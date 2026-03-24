# Statistical Simulation with MCMC Methods

[![R](https://img.shields.io/badge/R-4.0%2B-blue)](https://www.r-project.org/)
[![MCMC](https://img.shields.io/badge/MCMC-Metropolis--Hastings-green)](https://en.wikipedia.org/wiki/Metropolis%E2%80%93Hastings_algorithm)
[![Gibbs](https://img.shields.io/badge/Gibbs-Sampling-orange)](https://en.wikipedia.org/wiki/Gibbs_sampling)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Description
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

## Project Structure
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

## Installation & Execution

### Prerequisites
- **R** (version 3.6 or higher)
- The **coda** package is used for effective sample size calculation (can be installed via install.packages("coda")). All other code uses base R.

### Execution Steps
```bash
# 1. Clone the repository
git clone https://github.com/ThodBaz7/MCMC-Methods.git
cd MCMC-Methods

# 2. Run each exercise script in R (or RStudio)
# For example:
source("part1_metropolis_rejection_streaks.R")
source("part2_metropolis_uniform_proposal.R")
source("part3_mh_log_transform.R")
source("part4_mh_normal_proposal_ess.R")
source("part5_gibbs_sampler.R")
source("part6_gibbs_nonexistent_mean.R")
```

## R Code Features
All scripts are self‑contained and rely primarily on base R; only coda is used for ESS calculation.

### Key Functions:
- `pi_tilde()` - unnormalized target densities
- `rle()` - base R function for run‑length encoding (used in part1)
- `integrate()` - numerical integration for normalizing constants
- `cumsum()` and `var()` - for cumulative estimates
- `mcmc()` and `effectiveSize()` - from coda package

## Report
The full assignment report is available at [`report/MCMC-Methods.pdf`](report/MCMC-Methods.pdf)

## License
MIT License - Free use and modification with attribution.

## Contact
thbazhba@gmail.com
