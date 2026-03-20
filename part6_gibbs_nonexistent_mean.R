# Gibbs sampler for joint distribution
# π(x,y) ∝ sqrt(y) * exp( -y/2 * (1 + (x-π)^2) ), x∈R, y>0
# Conditional distributions:
#   x|y ~ N(π, 1/y)
#   y|x ~ Gamma(shape = 3/2, rate = (1 + (x-π)^2)/2)

N <- 100000
burnin <- 10000
M <- N + burnin

x <- numeric(M)
y <- numeric(M)
x[1] <- 1
y[1] <- 1

set.seed(2025)

for (m in 2:M) {
  # Sample x from N(π, 1/y_previous)
  x[m] <- rnorm(1, mean = pi, sd = 1 / sqrt(y[m-1]))
  
  # Sample y from Gamma(shape = 3/2, rate = (1 + (x-π)^2)/2)
  shape <- 3/2
  rate <- (1 + (x[m] - pi)^2) / 2
  y[m] <- rgamma(1, shape = shape, rate = rate)
}

# Discard burn-in
x_post <- x[(burnin+1):M]
y_post <- y[(burnin+1):M]

# Estimate E[X/(1+Y)]
ratio <- x_post / (1 + y_post)
cum_ratio <- cumsum(ratio) / (1:length(ratio))

plot(cum_ratio, type = "l", col = "blue",
     main = "Convergence of E[X/(1+Y)]",
     xlab = "Sample", ylab = "Estimate")
abline(h = mean(ratio), col = "red", lty = 2)

# Demonstrate non-existence of E[X/Y] by plotting cumulative means
# for 16 different random seeds
par(mfrow = c(4, 4))
for (seed in 2025:2040) {
  set.seed(seed)
  x <- numeric(M)
  y <- numeric(M)
  x[1] <- 1
  y[1] <- 1
  for (m in 2:M) {
    x[m] <- rnorm(1, pi, 1 / sqrt(y[m-1]))
    rate <- (1 + (x[m] - pi)^2) / 2
    y[m] <- rgamma(1, shape = 3/2, rate = rate)
  }
  x_post <- x[(burnin+1):M]
  y_post <- y[(burnin+1):M]
  ratio_xy <- x_post / y_post
  cum_xy <- cumsum(ratio_xy) / (1:length(ratio_xy))
  plot(cum_xy, type = "l", col = "darkred",
       main = paste("Seed", seed, "\nMean =", round(mean(ratio_xy), 3)),
       xlab = "", ylab = "", cex.main = 0.8)
}
par(mfrow = c(1, 1))
