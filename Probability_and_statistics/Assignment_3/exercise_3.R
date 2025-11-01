# Load the mtcars dataset
data(mtcars)

# Convert `am`, `vs`, and `cyl` into factors
mtcars$am <- as.factor(mtcars$am)  # Transmission: 0 = automatic, 1 = manual
mtcars$vs <- as.factor(mtcars$vs)  # Engine: 0 = V-engine, 1 = straight engine
mtcars$cyl <- as.factor(mtcars$cyl)  # Number of cylinders

head(mtcars)

summary(mtcars)

# Boxplots for categorical variables
boxplot(mpg ~ am, data = mtcars, main = "Fuel Consumption by Transmission", 
        xlab = "Transmission (0 = Auto, 1 = Manual)", ylab = "Miles per Gallon (mpg)")
boxplot(mpg ~ cyl, data = mtcars, main = "Fuel Consumption by Cylinders", 
        xlab = "Number of Cylinders", ylab = "Miles per Gallon (mpg)")

# Histograms for numeric variables
hist(mtcars$mpg, main = "Histogram of MPG", xlab = "Miles per Gallon (mpg)", col = "blue")
hist(mtcars$hp, main = "Histogram of Horsepower", xlab = "Horsepower", col = "green")
hist(mtcars$wt, main = "Histogram of Weight", xlab = "Weight", col = "red")
hist(mtcars$hp, main = "Histogram of Displacement", xlab = "Displacement", col = "darkblue")

# Select numeric variables
numeric_vars <- mtcars[, sapply(mtcars, is.numeric)]

# Pairwise scatterplots
pairs(numeric_vars, main = "Scatterplot Matrix of Numeric Variables")

# Correlation matrix
cor_matrix <- cor(numeric_vars)
print(cor_matrix)

# Heatmap for better visualization of correlations
library(ggcorrplot)
ggcorrplot(cor_matrix, lab = TRUE, 
           title = "Correlation Matrix Heatmap", 
           colors = c("red", "white", "blue"))

# Perform a t-test for mpg between manual and automatic
t_test_am <- t.test(mpg ~ am, data = mtcars)
print(t_test_am)

# Perform an ANOVA for mpg across different cylinder levels
anova_cyl <- aov(mpg ~ cyl, data = mtcars)
summary(anova_cyl)

# Tukey's test if ANOVA is significant
tukey_cyl <- TukeyHSD(anova_cyl)
print(tukey_cyl)

# Fit the full regression model
full_model <- lm(mpg ~ ., data = mtcars)
summary(full_model)

# Perform stepwise selection based on BIC
library(MASS) 
bic_model <- step(full_model, direction = "backward", k = log(nrow(mtcars)))
summary(bic_model)


# 1. Residuals vs Fitted Plot
plot(bic_model, which = 1, col = "blue", pch = 19, main = "Residuals vs Fitted")

# 2. Normal Q-Q Plot
plot(bic_model, which = 2, col = "darkgreen", pch = 19, main = "Normal Q-Q")

# 3. Scale-Location Plot
plot(bic_model, which = 3, col = "purple", pch = 19, main = "Scale-Location")

# 4. Residuals vs Leverage Plot
plot(bic_model, which = 5, col = "black", pch = 19, main = "Residuals vs Leverage")
