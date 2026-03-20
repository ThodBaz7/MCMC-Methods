# Metropolis-Hastings with normal proposal
# Includes acceptance rate, effective sample size (ESS), and plot with title

pi_tilde <- function(x) {
  exp(-0.5 * ((x/10)^4 + (x/10)^2 + x^2))
}

N <- 10000
sigma_prop <- 2.7
set.seed(2025)

x <- numeric(N)
x[1] <- rnorm(1)
accept_count <- 0

for (i in 2:N) {
  y <- rnorm(1, x[i-1], sigma_prop)
  ratio <- pi_tilde(y) / pi_tilde(x[i-1])
  alpha <- min(1, ratio)
  if (runif(1) <= alpha) {
    x[i] <- y
    accept_count <- accept_count + 1
  } else {
    x[i] <- x[i-1]
  }
}

accept_rate <- accept_count / (N-1)

# Discard burn-in
burn_in <- 1000
x_post <- x[(burn_in+1):N]

# Effective sample size
library(coda)
ess <- effectiveSize(mcmc(x_post))

# Normalized density
Z <- integrate(pi_tilde, -Inf, Inf)$value
pi_norm <- function(x) pi_tilde(x) / Z

# Histogram with true density and summary statistics in title
hist(x_post, breaks = 30, freq = FALSE,
     main = paste("MH sample: mean =", round(mean(x_post), 3),
                  "accept =", round(accept_rate, 3),
                  "ESS =", round(ess, 0)),
     xlab = "x", col = "lightblue", xlim = c(-10, 10))
curve(pi_norm, from = -10, to = 10, add = TRUE, col = "red", lwd = 2)
