# Statistical Analysis with Bootstrap and Jackknife Methods

[![R](https://img.shields.io/badge/R-4.0%2B-blue)](https://www.r-project.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-Resampling-green)](https://en.wikipedia.org/wiki/Bootstrapping_(statistics))
[![Jackknife](https://img.shields.io/badge/Jackknife-Estimation-orange)](https://en.wikipedia.org/wiki/Jackknife_resampling)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📋 Description
Implementation of **Markov Chain Monte Carlo (MCMC)** methods for simulating from various probability distributions. The project includes applications of the **Metropolis, Metropolis‑Hastings, and Gibbs algorithms**, with detailed analysis of acceptance rates, effective sample sizes, rejection streaks, and convergence diagnostics.

This project was implemented as part of the **MSc in Applied Statistics** at the **University of Piraeus**.

## Contents
| File | Description |
|------|-------------|
| `part1_metropolis_rejection_streaks.R` | Metropolis with normal proposal; analysis of rejection run‑lengths. |
| `part2_metropolis_uniform_proposal.R` | Metropolis with uniform proposal U(-3.1, 3.1); convergence of mean and variance. |
| `part3_mh_log_transform.R` | Metropolis‑Hastings with log transformation (positive support). |
| `part4_mh_normal_proposal_ess.R` | Metropolis‑Hastings with normal proposal; ESS and acceptance rate in plot title. |
| `part5_gibbs_sampler.R` | Gibbs sampler for a bivariate exponential distribution. |
| `part6_gibbs_nonexistent_mean.R` | Gibbs sampler; demonstration of non‑existence of E[X/Y]. |

## 🗂️ Project Structure
```
MCMC-Methods/
│
├── part1_metropolis_rejection_streaks.R    # Metropolis with normal proposal, run‑length analysis
├── part2_metropolis_uniform_proposal.R               # Metropolis with uniform proposal
├── part3_mh_log_transform.R                 # Metropolis‑Hastings with log transformation
├── part4_mh_normal_proposal_ess.R               # Metropolis‑Hastings with normal proposal
├── part5_gibbs_sampler.R                    # Gibbs sampler for bivariate exponential
├── part6_gibbs_nonexistent_mean.R             # Gibbs sampler with demonstration of non‑finite mean
│
├── datasets/                                     # (No external datasets required; all distributions defined in code)
│
├── report/                                       # Folder containing the assignment report
│   └── MCMC-Methods.pdf               # Full report of the analysis 
│
└── README.md                                     # Project documentation
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
