# Statistics and Probability Notebooks

This repository contains interactive Jupyter notebooks exploring fundamental concepts in statistics, probability theory, and related mathematical foundations.

## Project Structure

```
notebooks/
├── finance/
│   ├── outputs/                        # saved plot images
│   ├── 01_black_scholes.ipynb          # Q6: Black-Scholes & Monte Carlo (Euler-Maruyama)
│   └── 02_risk_asset_model.ipynb       # Q7: CRR binomial model vs Black-Scholes
└── intro/
    ├── calculus/
    │   ├── 01_calculus_overview.ipynb
    │   ├── 02_integration.ipynb
    │   └── 03_differentiation.ipynb
    ├── combinatorics/
    │   ├── 01_counting.ipynb
    │   ├── 02_permutations.ipynb
    │   ├── 03_selections.ipynb
    │   ├── 04_pigenhole_principle.ipynb
    │   └── 05_overview.ipynb
    ├── probability/
    │   ├── decision_theory/
    │   │   ├── 01_weighted_average.ipynb
    │   │   └── 02_expected_value.ipynb
    │   ├── distributions/
    │   │   ├── geometric_distribution.ipynb
    │   │   ├── poisson_distribution.ipynb
    │   │   └── uniform_distribution.ipynb
    │   ├── measures/
    │   │   └── 01_intro_to_measures.ipynb
    │   └── rules/
    │       ├── 01_basics.ipynb
    │       ├── 02_bayes.ipynb
    │       └── 03_random_variables.ipynb
    ├── set-theory/
    └── statistics/
```

## Topics Covered

### Mathematical Foundations
- **Calculus**: Essential calculus concepts
- **Set Theory**: Foundation for probability spaces
- **Combinatorics**: Counting principles and methods

### Core Probability Theory
- **Fundamental Rules**: Basic probability axioms and rules
- **Random Variables**: Properties and transformations
- **Bayes' Theorem**: Conditional probability and applications

### Probability Distributions
- Uniform Distribution
- Geometric Distribution
- Poisson Distribution

### Advanced Topics
- **Measure Theory**: Mathematical foundations
- **Decision Theory**: 
  - Weighted averages
  - Expected value calculations

### Financial Mathematics

- **Black–Scholes model**: closed-form European call pricing, Monte Carlo via Euler–Maruyama, SLLN convergence
- **CRR binomial model**: backward induction, convergence to Black–Scholes, odd/even oscillation

### Statistical Methods (Planned)
- Descriptive statistics
- Inferential statistics
- Hypothesis testing
- Confidence intervals
- Regression analysis

## Features
- Interactive visualizations using ipywidgets
- Real-world examples and applications
- Theoretical foundations and proofs
- Practice problems and solutions
- Links to additional resources

## Setup

A `Makefile` handles environment creation and launching JupyterLab.

**Create the conda environment** (first time only):

```bash
make env
```

This runs `conda env create -f environment.yml`, installing all pinned dependencies including numpy, scipy, matplotlib, and JupyterLab.

**Launch JupyterLab:**

```bash
make lab
```

This starts JupyterLab inside the `notebook-env` conda environment without needing to activate it manually. Navigate to the desired notebook in the `notebooks/` directory.

> Plot images saved during notebook execution are written to `notebooks/finance/outputs/`.

## Prerequisites
- Basic calculus understanding
- Familiarity with set notation
- Basic Python programming skills

## Contributing

Feel free to:
- Report issues or bugs
- Suggest improvements
- Submit pull requests
- Request additional topics

## Resources

### Recommended Reading
- [Add recommended textbooks]
- [Add online courses]
- [Add reference materials]

### Online References
- [Add helpful links]
- [Add documentation links]
- [Add tutorial links]

## License

MIT

## Author

Nathan Ormond

---
*This repository is actively developed. Topics and structure will evolve as the collection grows.*
