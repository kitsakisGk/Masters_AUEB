before <- c(121.5, 122.4, 126.6, 120.0, 129.1, 124.9, 138.8, 124.5, 116.8, 132.2)
after <- c(117.3, 128.6, 121.3, 117.2, 125.6, 121.5, 124.2, 121.6, 117.9, 125.4)


#Visualize the data.
head(before)
head(after)

summary_before <- summary(before)
summary_after <- summary(after)
print(summary_before)
print(summary_after)

hist_before <- hist(before, main = "Histogram of Blood Pressure Before Drug", 
                    xlab = "Blood Pressure", col = "lightblue")
hist_after <- hist(after, main = "Histogram of Blood Pressure After Drug", 
                   xlab = "Blood Pressure", col = "lightgreen")

boxplot(before, after, names = c("Before", "After"),
        main = "Blood Pressure Before and After Drug",
        ylab = "Blood Pressure (mmHg)", col = c("lightblue", "lightgreen"))

# H0: No difference in mean blood pressure before and after drug
# H1: Drug reduces blood pressure (one-sided test)
t_test <- t.test(before, after, paired = TRUE, alternative = "greater")
print(t_test)
