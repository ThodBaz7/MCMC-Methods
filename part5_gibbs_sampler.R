# Gibbs sampler for joint distribution
# π(x,y) ∝ exp(-5x(1+y) - y(3+2x)), x,y > 0
# Conditional distributions:
#   x|y ~ Exp(5 + 7y)
#   y|x ~ Exp(3 + 7x)

N <- 100000
burnin <- 10000
M <- N + burnin

x <- numeric(M)
y <- numeric(M)
x[1] <- 1
y[1] <- 1

set.seed(2025)

# Gibbs sampling
for (m in 2:M) {
  # Sample x from Exp(5 + 7 * y_previous)
  lambda_x <- 5 + 7 * y[m-1]
  x[m] <- rexp(1, rate = lambda_x)
  
  # Sample y from Exp(3 + 7 * x_current)
  lambda_y <- 3 + 7 * x[m]
  y[m] <- rexp(1, rate = lambda_y)
}

# Discard burn-in
x_post <- x[(burnin+1):M]
y_post <- y[(burnin+1):M]
Z <- x_post + y_post   # total quantity

# Estimates for Z = X + Y
mean_Z <- mean(Z)
var_Z <- var(Z)

cat("Mean of Z:", round(mean_Z, 4), "\n")
cat("Variance of Z:", round(var_Z, 4), "\n")

# Histograms
par(mfrow = c(1, 3))
hist(x_post, breaks = 50, freq = FALSE, main = "Distribution of X",
     xlab = "x", col = "lightblue", xlim = c(0, 1))
hist(y_post, breaks = 50, freq = FALSE, main = "Distribution of Y",
     xlab = "y", col = "lightgreen", xlim = c(0, 1))
hist(Z, breaks = 50, freq = FALSE, main = "Distribution of Z = X + Y",
     xlab = "z", col = "lightcoral")
par(mfrow = c(1, 1))

# Convergence of cumulative mean and variance for Z
running_mean_Z <- cumsum(Z) / (1:length(Z))
running_var_Z <- sapply(1:length(Z), function(n) var(Z[1:n]))

# Plot convergence of mean
plot(running_mean_Z, type = "l", col = "blue",
     main = "Convergence of cumulative mean of Z",
     xlab = "Sample", ylab = "Mean")
abline(h = mean_Z, col = "red", lwd = 2)

# Plot convergence of variance
plot(running_var_Z, type = "l", col = "darkgreen",
     main = "Convergence of cumulative variance of Z",
     xlab = "Sample", ylab = "Variance")
abline(h = var_Z, col = "red", lwd = 2)
