# Metropolis with normal proposal N(0,1) (random walk)
# Calculation of rejection run-lengths

pi_tilde <- function(x) {
  exp(-x^2) * sin(x^2) / (1 + x^2)
}

N <- 10000
burnin <- 1000
total_iter <- N + burnin
x <- numeric(total_iter)
accepted <- logical(total_iter - 1)

x[1] <- 1
accept_count <- 0
set.seed(2025)

for (m in 2:total_iter) {
  current_x <- x[m-1]
  y <- rnorm(1, mean = current_x, sd = 1)
  alpha <- min(1, pi_tilde(y) / pi_tilde(current_x))
  u <- runif(1)
  if (u <= alpha) {
    x[m] <- y
    accepted[m-1] <- TRUE
    accept_count <- accept_count + 1
  } else {
    x[m] <- current_x
    accepted[m-1] <- FALSE
  }
}

# Remove burn-in
x_final <- x[(burnin+1):total_iter]
accepted_final <- accepted[burnin:(total_iter-1)]

# Acceptance rate
accept_rate <- mean(accepted_final)
cat("Acceptance rate:", round(accept_rate * 100, 2), "%\n")

# Estimate P(X > 1)
prob_gt_1 <- mean(x_final > 1)
cat("P(X > 1):", round(prob_gt_1, 4), "\n")

# Effective sample size
library(coda)
effective_size <- effectiveSize(mcmc(x_final))
cat("ESS:", round(effective_size, 2), "\n")

# Rejection run-lengths
rle_result <- rle(!accepted_final)  # TRUE = rejection
rejection_runs <- rle_result$lengths[rle_result$values == TRUE]
freq_table <- table(factor(rejection_runs, levels = 1:max(rejection_runs)))
print(freq_table)
