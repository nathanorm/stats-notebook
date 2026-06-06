# CS830 CW1 — Regression: Predict Song Popularity

## Problem Statement

**Commissioned task:** Given the audio characteristics of a song, predict its popularity score on Spotify.

**Problem type:** Regression — predict `pop` (continuous, range 26–94 in this dataset).

**Why regression over classification:**
The classification alternative (predict `top_genre`) has a severe class imbalance problem: `dance pop` accounts for 114/660 songs (17%), with a long tail of tiny classes. After collapsing genres with fewer than 3 examples, 41 classes remain across only 660 rows (~16 examples per class on average). A naive classifier predicting the majority class every time achieves ~17% accuracy — the writeup would be dominated by imbalance-handling rather than ML insights. Regression on a continuous, well-distributed target is the cleaner path for this dataset.

**The question being answered:** Which audio characteristics (energy, danceability, acousticness, loudness, etc.) predict how popular a song will be on Spotify? The client is a music label or producer who wants to understand what makes a song perform well — not what year it was released.

---

## Dataset

- **Source:** 7 decade CSVs (`1950.csv` – `2010.csv`), combined into one dataset
- **Raw shape:** 667 rows × 15 columns
- **Clean shape:** 660 rows × 16 columns (after cleaning, see below)
- **Split:** 594 train / 66 holdout (90/10, stratified by `source_decade`, `random_state=42`)
- **Holdout indices:** persisted to `data/spotify-songs/validation/holdout_indices.json`

---

## EDA Findings

### Data quality

| Issue | Count | Action taken | Justification |
| --- | --- | --- | --- |
| Duplicate rows (title + artist) | 7 | Dropped | Same song in both train and holdout would leak information |
| `top_genre` nulls | 16 (2.4%) | Filled → `"unknown"` | Must fill before genre collapsing or NaNs bypass the rare-genre filter |
| `pop == 0` | 0 | No action | Not present in this dataset |
| Year incoherence (re-releases) | 143 rows with \|year − source_decade\| > 15 | Flagged as `is_rerelease`; excluded from features | 21% of data — too many to drop; flag added but excluded from modelling (see feature decisions) |
| Rare genres (n < 3) | 76 genres | Collapsed → `"other"` | Too sparse for meaningful target encoding |

### Feature correlations with `pop`

| Feature | r | Notes |
| --- | --- | --- |
| `acous` | −0.455 | Strongest signal — acoustic songs are less popular |
| `db` | +0.365 | Louder songs score higher |
| `dur` | +0.281 | Longer songs tend to score higher |
| `nrgy` | +0.272 | More energetic = more popular |
| `dnce` | +0.249 | More danceable = more popular |
| `spch` | +0.193 | More speech = slightly more popular (rap/hip-hop effect) |
| `bpm` | +0.067 | Weak — likely noise |
| `val` | −0.102 | Weak negative |
| `live` | −0.037 | Effectively zero — dropped |

### Skewness

| Feature | Skew | Action |
| --- | --- | --- |
| `spch` | 3.58 | Log-transform |
| `live` | 2.16 | Dropped (zero correlation anyway) |
| `dur` | 0.97 | Borderline — log-transform applied |
| Others | < 0.85 | No transform needed |

### Genre signal

- 115 unique genres in raw data → 41 after collapsing rare genres
- Top genres by mean `pop` are modern rap/hip-hop styles — genre is a real signal
- Target encoding (with smoothing, fitted inside CV folds only) chosen over ordinal encoding

---

## Feature Engineering Decisions

| Feature | Decision | Justification |
| --- | --- | --- |
| `acous`, `db`, `nrgy`, `dnce`, `dur`, `spch`, `val` | Keep as model inputs | All have measurable correlation with `pop`; all describe the sound of the song |
| `bpm` | **Drop** | r = +0.067 with `pop` — weakest remaining feature and effectively noise. Pre-modelling check showed `bpm` is largely independent of other features (max inter-feature r = 0.18), so the reason to drop is purely its near-zero predictive signal, not multicollinearity. With only 660 rows, including noise features degrades linear models. |
| `live` | **Drop** | r = −0.037, effectively zero — adds noise not signal |
| `top_genre` | **Target encode** (smoothed, inside CV) | 41 categories with genuine mean-pop variation; raw label encoding loses ordinal signal; one-hot adds 41 sparse columns to 660 rows; genre is a valid input — a producer knows what genre they are making |
| `spch`, `dur` | **Log-transform** | Skew 3.58 and 0.97 respectively; improves linear model assumptions |
| `year`, `source_decade` | **Drop** | Spotify's `pop` score is based on current streaming activity, so older songs score lower by construction — not because of their audio features. Including `year` would let the model predict era rather than sound. The commissioned question is about audio characteristics, not release date. |
| `is_rerelease` | **Drop** | Derivative of `year`; same reasoning as above |
| `title`, `artist` | **Drop** | Too high cardinality; not generalisable to new songs |

### Multicollinearity note

Pre-modelling verification confirmed strong inter-feature correlations:

| Pair | r |
| --- | --- |
| `nrgy` ↔ `db` | +0.70 |
| `nrgy` ↔ `acous` | −0.66 |
| `db` ↔ `acous` | −0.50 |
| `dnce` ↔ `val` | +0.46 |

These do not affect tree models but will destabilise and inflate OLS coefficients — `nrgy` and `db` are largely measuring the same underlying quality (loud, electric songs). Ridge Regression is included specifically to handle this via L2 regularisation — its inclusion is quantitatively justified, not just a formality.

### `acous == 0` rows

41 songs have `acous = 0`. Inspection confirmed these are real values — all are high-energy electric or rock/pop songs (e.g. Born in the U.S.A., Numb, Pour Some Sugar On Me). Spotify measured them as 0% acoustic correctly. No special handling needed.

---

## Model Plan

### Models in scope

| # | Model | Type | Role |
| --- | --- | --- | --- |
| 1 | Mean predictor | Naive baseline | Floor benchmark — any real model must beat this |
| 2 | Linear Regression | Linear | Establishes whether a linear relationship exists; interpretable coefficients |
| 3 | Ridge Regression | Regularised linear | Tests whether shrinkage helps given correlated features (`nrgy`/`db` are correlated) |
| 4 | Random Forest | Non-linear ensemble | Captures feature interactions; provides feature importance ranking |
| 5 | Gradient Boosting | Boosted ensemble | Best-effort model; compare to RF to assess whether sequential boosting helps on this dataset size |

A shallow Decision Tree will be shown briefly between Ridge and Random Forest as intuition-building for why ensembles improve over a single tree — not counted as one of the 5.

### Evaluation

- **During training:** 5-fold cross-validation on `df_train` (594 rows); report mean CV RMSE and R²
- **Final evaluation:** best model evaluated once on `df_holdout` (66 rows) — not touched until this point
- **Metrics:** RMSE (primary), R² (secondary), fit time (context)
- **Plots:** residuals vs predicted, feature importance, partial dependence for top 3 features

### Expected R² range

R² of 0.3–0.5 is realistic given the noisy target. Low R² is expected and will be explained in the writeup — `pop` reflects streaming behaviour, social signals, and playlist placement that audio features alone cannot capture.

---

## Notebook Structure (submission)

1. Problem description and motivation
2. Data loading and first look
3. Data quality and cleaning (with documented decisions)
4. Distributions and relationships (EDA plots)
5. Feature engineering and pipeline setup
6. Models: baseline → linear → regularised → ensemble → boosted
7. Model comparison table
8. Final evaluation on holdout
9. Interpretation: feature importance, partial dependence, critique
10. Conclusion: answer the commissioned question
11. GenAI acknowledgement

---

## Directory layout

```text
data/spotify-songs/
  raw/          ← original decade CSVs (read-only, permissions set to 444)
  validation/   ← holdout_indices.json (10% split, locked after EDA)
```

All cleaning and feature engineering happens in-memory inside sklearn Pipelines. No intermediate CSVs written — transformers are fitted per CV fold to prevent leakage.
