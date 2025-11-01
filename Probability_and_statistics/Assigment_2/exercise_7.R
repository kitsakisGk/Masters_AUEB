novice <- c(22.10, 22.30, 26.20, 29.60, 31.70, 33.50, 38.90, 39.70, 43.20, 43.20)
advanced <- c(32.50, 37.10, 39.10, 40.50, 45.50, 51.30, 52.60, 55.70, 55.90, 57.70)
proficient <- c(40.10, 45.60, 51.20, 56.40, 58.10, 71.10, 74.90, 75.90, 80.30, 85.30)

#combine to one dataframe.
recall_data <- data.frame(
  score = c(novice, advanced, proficient),
  group = factor(rep(c("Novice", "Advanced", "Proficient"), each = 10))
)

#visualize the data.
str(recall_data)
head(recall_data)

summary_stats <- aggregate(score ~ group, data = recall_data, summary)
print(summary_stats)

hist_novice <- hist(recall_data$score[recall_data$group == "Novice"], 
                    main = "Histogram of Recall Scores - Novice", 
                    xlab = "Recall Score", col = "lightblue", breaks = 10)

hist_advanced <- hist(recall_data$score[recall_data$group == "Advanced"], 
                      main = "Histogram of Recall Scores - Advanced", 
                      xlab = "Recall Score", col = "lightgreen", breaks = 10)

hist_proficient <- hist(recall_data$score[recall_data$group == "Proficient"], 
                        main = "Histogram of Recall Scores - Proficient", 
                        xlab = "Recall Score", col = "lightgrey", breaks = 10)

boxplot(score ~ group, data = recall_data, 
        main = "Recall Ability by Player Experience Level",
        xlab = "Experience Level", ylab = "Recall Score", col = c("lightblue", "lightgreen", "lightgrey"))

#Anova test.
anova_result <- aov(score ~ group, data = recall_data)
summary(anova_result)

#Paired tests with Bonferroni.
pairwise_t_tests <- pairwise.t.test(recall_data$score, recall_data$group, p.adjust.method = "bonferroni")
print(pairwise_t_tests)
