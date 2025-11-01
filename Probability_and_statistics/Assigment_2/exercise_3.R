data <- read.table("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assigment_2/drug_response_time.txt", header = TRUE)

#Visualize the data.
head(data)

summary_stats <- aggregate(time ~ drug, data = data, summary)
print(summary_stats)

hist_A <- hist(data$time[data$drug == "A"], main = "Response Time - Drug A", xlab = "Time", col = "lightblue")
hist_B <- hist(data$time[data$drug == "B"], main = "Response Time - Drug B", xlab = "Time", col = "lightgreen")

boxplot_response <- boxplot(time ~ drug, data = data, 
                            main = "Response Time by Drug Type", 
                            xlab = "Drug Type", ylab = "Time", 
                            col = c("lightblue", "lightgreen"))

#Since we have normal distributions we use shapiro test. 
shapiro_test_A <- shapiro.test(data$time[data$drug == "A"])
shapiro_test_B <- shapiro.test(data$time[data$drug == "B"])
print(shapiro_test_A)
print(shapiro_test_B)

#MLE calculations.
mean_A <- mean(data$time[data$drug == "A"])
mean_B <- mean(data$time[data$drug == "B"])
var_A <- var(data$time[data$drug == "A"])
var_B <- var(data$time[data$drug == "B"])
print(mean_A)
print(mean_B)
print(var_A)
print(var_B)

#T-test fro CI.
t_test <- t.test(time ~ drug, data = data, var.equal = TRUE)
ci_95 <- t_test$conf.int
print(ci_95)

#CI 99% and 99.9%.
alpha_99 <- 0.01
alpha_999 <- 0.001
n_A <- sum(data$drug == "A")
n_B <- sum(data$drug == "B")
pooled_sd <- sqrt(((n_A - 1) * var_A + (n_B - 1) * var_B) / (n_A + n_B - 2))
error_99 <- qt(1 - alpha_99 / 2, df = n_A + n_B - 2) * pooled_sd * sqrt(1/n_A + 1/n_B)
error_999 <- qt(1 - alpha_999 / 2, df = n_A + n_B - 2) * pooled_sd * sqrt(1/n_A + 1/n_B)
ci_99 <- c(mean_A - mean_B - error_99, mean_A - mean_B + error_99)
ci_999 <- c(mean_A - mean_B - error_999, mean_A - mean_B + error_999)
print(ci_99)
print(ci_999)

#Checking the difference in response time.
print(t_test)
