# CS830 CW1 Plan — Regression: Predict Song Popularity

**Problem choice:** Regression — predict `pop` (popularity score)

**Why:** Continuous target gives richer model comparison surface. Genre prediction collapses to a few dominant classes with severe imbalance — harder to interpret meaningfully.

---

## Data columns (from raw CSVs)

`title, artist, top genre, year, bpm, nrgy, dnce, dB, live, val, dur, acous, spch, pop`

Files: `1950.csv … 2010.csv` (one per decade, combined = full dataset)

---

## Step-by-step sequence

### 1. Exploratory Data Analysis (findings drive everything downstream)

#### Load & first look

- [ ] Load all 7 decade CSVs, tag each row with source decade, concat
- [ ] `df.info()`, `df.describe()`, shape — get a feel for scale
- [ ] Check for duplicate rows (same title + artist); decide drop vs keep

#### Data quality — find the problems before deciding how to fix them

- [ ] Null audit: count and % per column — is missingness random or structured?
- [ ] `year` coherence: plot distribution of `year` values per source decade file; quantify how many re-releases are outside ±5yr of their decade — decide threshold for dropping vs flagging
- [ ] `pop` = 0 or outlier check: are zero-popularity rows real or data errors?
- [ ] Numeric range sanity: `bpm` > 300? `dur` < 10s? `dB` > 0? Flag anomalies
- [ ] Genre cardinality: how many unique genres? Long tail? Collapse rare genres into "other" if warranted

#### Distributions — let the data tell us what it needs

- [ ] Histogram for every numeric feature + `pop` (target)
- [ ] Identify right/left skew — log-transform candidates: `dur`, `acous`, `spch`, `bpm`
- [ ] Box plots by decade — does `pop` shift over time? Do audio features drift?
- [ ] Genre frequency bar chart — is this balanced enough for target encoding or does it collapse?

#### Relationships — what might predict popularity?

- [ ] Correlation heatmap across all numeric features
- [ ] Scatter plots: `pop` vs each feature (spot non-linear relationships early)
- [ ] Mean `pop` by genre (ranked) — is genre a strong signal?
- [ ] Mean `pop` by decade — strong temporal trend? This affects whether `year` is a useful feature or a confound

#### Cleaning decisions (document each one explicitly)

- [ ] Nulls: drop row / impute median / impute mode — based on what the audit shows
- [ ] Year outliers: drop or keep with a `rerelease` flag column
- [ ] Pop = 0: drop or keep — justify
- [ ] Numeric anomalies: cap at sensible bounds or drop

#### Lock the holdout split last, after cleaning

- [ ] `train_test_split(stratify=decade, test_size=0.1, random_state=42)` on cleaned data
- [ ] Save holdout indices to `data/spotify-songs/validation/holdout_indices.json` — reproducibility without writing a full CSV

### 2. Feature Engineering (informed by Step 1 findings)

- [ ] Encode `top genre` — target encoding if genre has strong pop signal (Step 1 will tell us); ordinal otherwise
- [ ] Drop `title`, `artist` — too high cardinality, not generalisable
- [ ] `year` vs `decade`: use whichever Step 1 shows has a cleaner relationship to `pop`
- [ ] Apply log transforms to skewed features identified in Step 1
- [ ] StandardScaler in sklearn Pipeline for linear models only (tree models get raw numerics)

### 3. Baseline Models (benchmarks)

- [ ] **Mean predictor** — predict global mean `pop` for every row (floor benchmark)
- [ ] **Linear Regression** — OLS, interpret coefficients, check residuals
- [ ] Report RMSE and R² for both on 5-fold CV

### 4. Intermediate Models

- [ ] **Ridge Regression** — tune `alpha` via CV, compare to OLS; shows regularisation effect
- [ ] **Decision Tree Regressor** — tune `max_depth`; visualise one shallow tree to build intuition

### 5. Advanced Models

- [ ] **Random Forest Regressor** — tune `n_estimators`, `max_features`; extract feature importances
- [ ] **Gradient Boosting (XGBoost or sklearn GBR)** — tune `learning_rate`, `max_depth`, `n_estimators` via RandomizedSearchCV

### 6. Model Comparison

- [ ] Table: model | CV RMSE | CV R² | fit time
- [ ] Select best model based on CV RMSE
- [ ] Evaluate best model on held-out validation set (one shot, no peeking before this)
- [ ] Residual plot: predicted vs actual, residuals vs predicted

### 7. Interpretation & Insights

- [ ] Feature importance plot for winning model
- [ ] Partial dependence plots for top 3 features
- [ ] Narrative: what makes a song popular per the model? Does genre/bpm/energy dominate?
- [ ] Honest critique: where does the model fail? (low-pop niche songs, era bias, etc.)

### 8. Notebook Writeup (submission-ready)

- [ ] Markdown cells: problem framing → data understanding → prep → modelling → results → conclusion
- [ ] All code cells produce output (Restart & Run All clean pass)
- [ ] GenAI acknowledgement section at end
- [ ] PDF export ≤ 20 pages

---

## Models in scope (3–5 required)

| # | Model | Role |
| --- | --- | --- |
| 1 | Mean predictor | Naive baseline |
| 2 | Linear Regression | Linear baseline |
| 3 | Ridge Regression | Regularised linear |
| 4 | Random Forest | Non-linear ensemble |
| 5 | Gradient Boosting | Best-effort model |

Decision Tree sits between 3 and 4 — include briefly as motivation for ensembles.

---

## Directory layout

```text
data/spotify-songs/
  raw/          ← original decade CSVs (read-only)
  training/     ← clean.csv, features.csv
  validation/   ← holdout.csv (10%, touched only at final eval)
```

---

## Key risks

- **Year incoherence** — re-releases skew decade representation; filter or flag
- **Genre leakage** — target encoding must be fit on train fold only inside CV
- **Low R²** — popularity is noisy; explain this in writeup rather than over-engineer
