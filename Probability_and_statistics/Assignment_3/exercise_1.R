# Loading the dataset
data <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assignment_3/Data/covid_vaccination_deaths.csv")

head(data)

# Summary
summary(data)

# Scatterplot for data.
plot(data$Vaccination_Rate, data$Death_Rate,
     main = "Vaccination Rate vs Death Rate",
     xlab = "Vaccination Rate (%)",
     ylab = "Death Rate (per 1M)",
     pch = 16, col = "blue")

# Fitting the model
model <- lm(Death_Rate ~ Vaccination_Rate, data = data)

# Summary of the model
summary(model)

plot(data$Vaccination_Rate, data$Death_Rate,
     main = "Vaccination Rate vs Death Rate with Fitted Line",
     xlab = "Vaccination Rate (%)",
     ylab = "Death Rate (per 1M)",
     pch = 16, col = "blue")

# Add the fitted regression line to the plot.
abline(model, col = "red", lwd = 2)

#Plots for validation
# Residuals vs Fitted
plot(model$fitted.values, resid(model),
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals", pch = 16, col = "blue")
abline(h = 0, col = "red")

# Normal Q-Q Plot
qqnorm(resid(model), main = "Normal Q-Q Plot")
qqline(resid(model), col = "red", lwd = 2)

# Scale-Location Plot
plot(model$fitted.values, sqrt(abs(resid(model))),
     main = "Scale-Location Plot",
     xlab = "Fitted Values", ylab = "Square Root of |Residuals|",
     pch = 16, col = "blue")
abline(model, col = "red")

# Residuals vs Leverage
plot(hatvalues(model), resid(model),
     main = "Residuals vs Leverage",
     xlab = "Leverage", ylab = "Residuals", pch = 16, col = "blue")
abline(h = 0, col = "red")
