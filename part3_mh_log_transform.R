# Metropolis-Hastings with log transformation (random walk on log scale)

N <- 100000
sigma_prop <- 1   # proposal standard deviation on log scale

pi_tilde <- function(x) {
  if (x <= 0) return(0)
  (x^2/2 + 3*x) * exp(-5*x)
}

set.seed(2025)
x <- numeric(N)
x[1] <- 1   # initial state

for (i in 2:N) {
  # Propose on log scale
  log_y <- log(x[i-1]) + rnorm(1, 0, sigma_prop)
  y <- exp(log_y)
  
  # Metropolis-Hastings ratio with Jacobian factor (y / x_old)
  ratio <- (y * pi_tilde(y)) / (x[i-1] * pi_tilde(x[i-1]))
  alpha <- min(1, ratio)
  
  if (runif(1) <= alpha) {
    x[i] <- y
  } else {
    x[i] <- x[i-1]
  }
}

# Discard burn-in (first 1000 samples)
x_post <- x[1000:N]

# Normalized density (normalizing constant 7.8125 derived from the PDF)
pi_true <- function(x) {
  7.8125 * (x^2/2 + 3*x) * exp(-5*x)
}

# Histogram with true density
hist(x_post, breaks = 50, freq = FALSE,
     main = "MH sample vs true density",
     xlab = "x", col = "lightblue", xlim = c(0, 2))
curve(pi_true, from = 0, to = 3, add = TRUE, col = "red", lwd = 2)

# Cumulative mean and median
cum_mean <- cumsum(x) / (1:N)
cum_median <- sapply(1:N, function(i) median(x[1:i]))

# Plot convergence
plot(1:N, cum_mean, type = "l", col = "blue", ylim = c(0.2, 0.6),
     main = "Convergence of sample mean and median",
     xlab = "Iteration", ylab = "Estimate")
lines(1:N, cum_median, col = "red")
abline(h = mean(x_post), col = "black", lty = 2)
abline(h = median(x_post), col = "black", lty = 2)
legend("topright", legend = c("Mean", "Median"), col = c("blue", "red"), lty = 1)
