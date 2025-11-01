# Load the Dataset
library(AER)
data(HMDA)

str(HMDA)
head(HMDA)
summary(HMDA)

# Full model using all predictors
full_model <- glm(deny ~ ., data = HMDA, family = binomial)
summary(full_model)

# Stepwise variable selection using AIC
aic_model <- step(full_model, direction = "both", trace = 0)
summary(aic_model)

# Stepwise variable selection using BIC
n <- nrow(HMDA) 
bic_model <- step(full_model, direction = "both", trace = 0, k = log(n))
summary(bic_model)

# Extract the coefficient for 'single' in the AIC model
coef_aic <- coef(aic_model)
print(names(coef_aic))
odds_ratio_single <- exp(coef_aic["singleyes"])
print("Odds ratio for singles vs. married (AIC-selected model):")
print(odds_ratio_single)

# Interpret the effect
if (odds_ratio_single > 1) {
  cat("Singles are more likely to have their mortgage denied compared to married individuals.\n")
} else {
  cat("Singles are less likely to have their mortgage denied compared to married individuals.\n")
}

