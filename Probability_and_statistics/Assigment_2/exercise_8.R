#Creating a dataframe.
ratings <- c(65, 50, 70, 45, 55, 30,
             70, 55, 65, 60, 65, 30,
             60, 80, 60, 85, 70, 30,
             60, 65, 70, 65, 55, 55,
             60, 70, 65, 70, 55, 35,
             55, 75, 60, 70, 60, 20,
             60, 75, 60, 80, 50, 45,
             55, 65, 50, 60, 50, 40)

gender <- factor(rep(c("Female", "Male"), each = 8))
alcohol <- factor(rep(c("None", "2 pints", "4 pints"), each = 16))

partner_data <- data.frame(Rating = ratings, Gender = gender, Alcohol = alcohol)

#Visualize the data.
str(partner_data)
head(partner_data)

summary_by_group <- aggregate(Rating ~ Gender + Alcohol, data = partner_data, FUN = mean)
print(summary_by_group)

hist_none_female <- hist(partner_data$Rating[partner_data$Alcohol == "None" & partner_data$Gender == "Female"], 
                         main = "Histogram - None & Female", xlab = "Rating", col = "lightblue", breaks = 5)

hist_none_male <- hist(partner_data$Rating[partner_data$Alcohol == "None" & partner_data$Gender == "Male"], 
                       main = "Histogram - None & Male", xlab = "Rating", col = "lightgreen", breaks = 5)

hist_2pints_female <- hist(partner_data$Rating[partner_data$Alcohol == "2 pints" & partner_data$Gender == "Female"], 
                           main = "Histogram - 2 Pints & Female", xlab = "Rating", col = "lightblue", breaks = 5)

hist_2pints_male <- hist(partner_data$Rating[partner_data$Alcohol == "2 pints" & partner_data$Gender == "Male"], 
                         main = "Histogram - 2 Pints & Male", xlab = "Rating", col = "lightgreen", breaks = 5)

hist_4pints_female <- hist(partner_data$Rating[partner_data$Alcohol == "4 pints" & partner_data$Gender == "Female"], 
                           main = "Histogram - 4 Pints & Female", xlab = "Rating", col = "lightblue", breaks = 5)

hist_4pints_male <- hist(partner_data$Rating[partner_data$Alcohol == "4 pints" & partner_data$Gender == "Male"], 
                         main = "Histogram - 4 Pints & Male", xlab = "Rating", col = "lightgreen", breaks = 5)

boxplot_ratings <- boxplot(Rating ~ Alcohol * Gender, data = partner_data,
                           main = "Partner Selection Ratings by Alcohol and Gender",
                           xlab = "Alcohol and Gender", ylab = "Rating",
                           col = c("lightblue", "lightgreen", "lightgrey"))

#Anova test.
anova_result <- aov(Rating ~ Gender * Alcohol, data = partner_data)
summary(anova_result)

#Checking the residuals if normal.
hist_residuals <- hist(residuals(anova_result), main = "Histogram of Residuals", xlab = "Residuals")
qqnorm(residuals(anova_result))
qqline(residuals(anova_result))

#Checking the variances with 2 tests to compare
library(car)
levene_test <- leveneTest(Rating ~ Gender * Alcohol, data = partner_data)
print(levene_test)

bartlett_test <- bartlett.test(Rating ~ interaction(Gender, Alcohol), data = partner_data)
print(bartlett_test)

