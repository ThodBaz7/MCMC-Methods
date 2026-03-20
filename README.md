# MCMC Methods – R Implementations

R implementations of Markov Chain Monte Carlo (MCMC) algorithms for six different target distributions.  
Includes **Metropolis**, **Metropolis‑Hastings**, and **Gibbs samplers**, with analysis of acceptance rates, effective sample size (ESS), rejection run‑lengths, and convergence plots.

## Contents

| File | Description |
|------|-------------|
| `part1_metropolis_rejection_streaks.R` | Metropolis with normal proposal; analysis of rejection run‑lengths. |
| `part2_metropolis_uniform_proposal.R` | Metropolis with uniform proposal U(-3.1, 3.1); convergence of mean and variance. |
| `part3_mh_log_transform.R` | Metropolis‑Hastings with log transformation (positive support). |
| `part4_mh_normal_proposal_ess.R` | Metropolis‑Hastings with normal proposal; ESS and acceptance rate in plot title. |
| `part5_gibbs_sampler.R` | Gibbs sampler for a bivariate exponential distribution. |
| `part6_gibbs_nonexistent_mean.R` | Gibbs sampler; demonstration of non‑existence of E[X/Y]. |
| `report.pdf` | Full assignment report (Greek, with results and figures). |

## Requirements

- R (≥ 3.6)
- Packages: `coda` (install with `install.packages("coda")`)

## Usage

Each script can be run independently. For example:

```bash
Rscript part1_metropolis_rejection_streaks.R
