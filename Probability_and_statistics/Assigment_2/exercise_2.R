x <- c(10, 10, 10, 30, 30, 30, 50, 50, 50, 70, 70, 70)
y <- c(70.4, 131.5, 80.9, 281.6, 260.0, 294.6, 493.7, 487.4, 497.9, 708.6, 684.4, 674.1)

#Estimate for theta and 95%.
theta_hat <- sum(x * y) / sum(x^2)
sigma_squared <- 400  
alpha <- 0.05
z_alpha_over_2 <- qnorm(1 - alpha / 2)
theta_ci <- theta_hat + c(-1, 1) * z_alpha_over_2 * sqrt(sigma_squared / sum(x^2))
cat("Theta estimate:", theta_hat, "\n95% CI:", theta_ci, "\n")

#Expected height and 95% CI for other x=40. 
x_val <- 40
expected_height_40 <- theta_hat * x_val

height_ci_40 <- theta_ci * x_val

cat("Expected height for x = 40:", expected_height_40, "\n95% CI for x = 40:", height_ci_40, "\n")

#Expected values and CI for other values.
x_values <- c(0, 20, 60, 80)
for (x_val in x_values) {
  expected_height <- theta_hat * x_val
  height_ci <- theta_ci * x_val
  cat("Expected height for x =", x_val, ":", expected_height, "\n95% CI:", height_ci, "\n")
}

#Scatterplot. 
plot(x, y, main="Tree Heights vs. Diameters with Regression Line", xlab="Diameter x", ylab="Height y", col="red", pch=16)
abline(a = 0, b = theta_hat, col="green", lwd=2)
legend("topleft", legend=c("Data", "Line y"), col=c("red", "green"), pch=c(16, NA), lty=c(NA, 1))