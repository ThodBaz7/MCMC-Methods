# Exercise 2
# Metropolis with uniform proposal U(-a, a), a = 3.1

pi_tilde <- function(x) {
  sin(x + 3)^4 * cos(x - 4)^2 * exp(-(x - 1)^2 / 2)
}

set.seed(2025)

N <- 100000
burnin <- 10000
a <- 3.1
total_steps <- N + burnin
x <- numeric(total_steps)
x[1] <- 2.5   # initial state

# Metropolis algorithm
for (m in 2:total_steps) {
  y <- x[m-1] + runif(1, -a, a)
  ratio <- pi_tilde(y) / pi_tilde(x[m-1])
  alpha <- min(1, ratio)
  if (runif(1) <= alpha) {
    x[m] <- y
  } else {
    x[m] <- x[m-1]
  }
}

# Discard burn-in
x_sample <- x[(burnin+1):total_steps]

# Normalize the density numerically
Z <- integrate(pi_tilde, -Inf, Inf)$value
pi_norm <- function(x) pi_tilde(x) / Z

# Histogram with true density
hist(x_sample, breaks = 80, freq = FALSE,
     main = "Histogram of samples and true density",
     xlab = "x", col = "lightblue", xlim = c(-5, 7), ylim = c(0, 1.2))
curve(pi_norm, from = -5, to = 7, add = TRUE, col = "red", lwd = 2)

# True mean and variance
true_mean <- integrate(function(x) x * pi_norm(x), -Inf, Inf)$value
true_var <- integrate(function(x) (x - true_mean)^2 * pi_norm(x), -Inf, Inf)$value

# Cumulative sample mean
sample_mean <- cumsum(x_sample) / (1:N)

# Cumulative sample variance
sample_var <- numeric(N)
for (i in 2:N) {
  sample_var[i] <- var(x_sample[1:i])
}
sample_var[1] <- 0

# Plot cumulative mean
plot(1:N, sample_mean, type = "l", col = "blue",
     main = "Cumulative sample mean",
     xlab = "Sample size", ylab = "Mean")
abline(h = true_mean, col = "red", lwd = 2)

# Plot cumulative variance
plot(1:N, sample_var, type = "l", col = "darkgreen",
     main = "Cumulative sample variance",
     xlab = "Sample size", ylab = "Variance")
abline(h = true_var, col = "red", lwd = 2)
