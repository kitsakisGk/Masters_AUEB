# Loading the dataset
data <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assignment_3/Data/exercise_2_data.csv")

head(data)

#summary 
summary(data)

# Convert Danger Index to a factor
data$Danger_Index <- as.factor(data$Danger_Index)

# Fitting the model
model <- lm(TS ~ Log_Body_Weight + Danger_Index, data = data)

# Summary of the model
summary(model)

# Assess the effect of category 5 vs category 1
# (Look at the coefficient for Danger_Index5)
cat_5_effect <- summary(model)$coefficients["Danger_Index5", ]
print(cat_5_effect)

# Visualization: Regression lines for each category
library(ggplot2)
ggplot(data, aes(x = Log_Body_Weight, y = TS, color = Danger_Index)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("1" = "red", 
                                "2" = "yellow", 
                                "3" = "green", 
                                "4" = "black", 
                                "5" = "blue")) +
  labs(title = "Regression Lines for Each Danger Index Category",
       x = "Log Body Weight",
       y = "Total Sleep (TS)") +
  theme_minimal()
