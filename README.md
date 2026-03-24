# Statistical Analysis with Bootstrap and Jackknife Methods

[![R](https://img.shields.io/badge/R-4.0%2B-blue)](https://www.r-project.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-Resampling-green)](https://en.wikipedia.org/wiki/Bootstrapping_(statistics))
[![Jackknife](https://img.shields.io/badge/Jackknife-Estimation-orange)](https://en.wikipedia.org/wiki/Jackknife_resampling)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📋 Description
Implementation of **Markov Chain Monte Carlo (MCMC)** methods for simulating from various probability distributions. The project includes applications of the **Metropolis, Metropolis‑Hastings, and Gibbs algorithms**, with detailed analysis of acceptance rates, effective sample sizes, rejection streaks, and convergence diagnostics.

This project was implemented as part of the **MSc in Applied Statistics** at the **University of Piraeus**.

## 📊 Distributions Studied
- **Part 1:** Univariate distribution with density π(x)∝(e^(〖-x〗^2 )  sin⁡(x^2 ))/(1+x^2 ),x∈R
- **Part 2:** Univariate distribution with density π(x)∝〖sin〗^4 (x+3) 〖cos〗^2 (x-4)exp(-(x-1)^2/2),x∈R
- **Part 3:** Positive‑valued distribution π(x)∝x^2/(2+3x) e^(-5x),x>0
- **Part 4:** Univariate distribution with polynomial exponent π(x)∝exp⁡{-0.5[(x/10)^4+(x/10)^2+x^2 ]},x∈R
- **Part 5:** Bivariate distribution π(x,y)∝e^(-5x(1+y)-y(3+2x) ),x,y>0
- **Part 6:** Bivariate distribution with Normal and Gamma conditionals π(x,y)∝√y×exp{-y/2 [1+(x-π)^2 ]},x ∈ R,y > 0

## 🗂️ Project Structure
```
bootstrap-jackknife-methods/
│
├── part1_bootstrap_correlation_partial.R    # Part 1: Bootstrap for correlation coefficients
├── part2_jackknife_bootstrap_PCA_KL.R       # Part 2: Jackknife, Bootstrap PCA, KL divergence
│
├── datasets/                                 # Dataset files
│   ├── Games.txt
│   └── BodyMeasurements.txt
│
├── report/                                   # Folder containing the assignment report
│   └── bootstrap_jackknife_methods.pdf       # Full report of the analysis (in Greek)
│
└── README.md                                  # Project documentation
```

## 🚀 Installation & Execution

### Prerequisites
- **R** (version 3.6 or higher)
- No external R packages required (uses **base R functions only**)

### Execution Steps
```bash
# 1. Clone the repository
git clone https://github.com/ThodBaz7/bootstrap-jackknife-methods.git
cd bootstrap-jackknife-methods

# 2. Run the analysis scripts in R
# Open R or RStudio and run:
source("part1_bootstrap_correlation_partial.R")
source("part2_jackknife_bootstrap_PCA_KL.R")
```

## 📈 Analysis Stages

### 1️⃣ **Part 1: Correlation and Partial Correlation**
- Simple correlation coefficient X,Y calculation
- Partial correlation coefficient X,Y|Z (controlling for Z)
- Bootstrap methods for 95% confidence intervals:
  - Basic bootstrap
  - Percentile bootstrap
  - BCa bootstrap (bias-corrected and accelerated)
  - Bootstrap-t
- Comparison of all four methods for both correlation types

### 2️⃣ **Part 2: Jackknife and Bootstrap for PCA**

#### **A: Jackknife Estimation**
- Calculation of **θ = λ₁ / Σλᵢ** (proportion of variance explained by first principal component)
- Jackknife bias estimation
- Jackknife standard error calculation
- Comparison with original estimate

#### **B: Bootstrap Confidence Intervals for θ**
- 95% confidence intervals using all four bootstrap methods
- Method comparison and interpretation

#### **C: Hypothesis Testing for μ₁ = (7/17)μ₅**
- Testing equality of means between first and fifth columns
- Bootstrap simulation under H₀
- P-value calculation and interpretation

#### **D: Bootstrap for P(Z > 55)**
- 98% confidence intervals for probability estimation
- All four bootstrap methods applied to binary outcome
- Probability estimation for body measurements > 55

#### **E: Hypothesis Testing with KL Divergence Bootstrap**
- Classic t-test for H₀: μ₁ = 52
- Standard bootstrap test
- KL divergence bootstrap:
  - Optimal probability weights under H₀
  - Kullback-Leibler divergence minimization
  - Bootstrap sampling with optimal probabilities
- Comparison of all three methods

## 📦 R Code Features
All scripts use **base R only** - no external packages required.

### Key Functions:
- `my.cor_xy()` - Simple correlation calculation
- `my.partial_cor()` - Partial correlation calculation
- `calculate_theta()` - PCA variance proportion
- `jknife()` - Jackknife estimation function
- `p()` - KL divergence probability weights

## 📝 Results Summary

### **Part 1 Results:**
- **Simple correlation X,Y:** Nearly perfect positive correlation (all CIs near 1)
- **Partial correlation X,Y|Z:** All CIs contain 0 → spurious correlation explained by Z

### **Part 2 Results:**
- **θ estimate:** ~0.875 (first PC explains 87.5% of variance)
- **Jackknife bias:** Negligible (-0.0001)
- **Jackknife standard error:** 0.017
- **KL Bootstrap p-value:** ~0.04

## 📄 Report
The full assignment report is available at [`report/bootstrap_jackknife_methods.pdf`](report/bootstrap_jackknife_methods.pdf)

## 📜 License
MIT License - Free use and modification with attribution.

## 📬 Contact
thbazhba@gmail.com
