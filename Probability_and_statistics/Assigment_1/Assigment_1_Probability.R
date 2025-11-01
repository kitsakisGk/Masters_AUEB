data100 <- read.table("C:/Users/admin/OneDrive/Έγγραφα/R/call_duration_100.txt")
data_num100 <-  as.numeric(data100$x)
hist100 <- hist(data_num100, prob = TRUE, breaks = 10,main = "Call Duration Histogram with PDF",xlab = "Call Duration (minutes)", ylab = "Relative Frequency")
hist100 <- curve((x^2 / 2) * exp(-x), from = 0, to = max(data_num100), add = TRUE, lwd = 1)
prob_most_one <- mean(data_num100 <= 1)
prob_most_two <- mean(data_num100 <= 2)
mean <- mean(data_num100)
var <- var(data_num100)
cost_function <- function(x) {
  if (x <= 2) {
    return(2)
  } else {
    return(2 + 4 * (x - 2))
  }
}
call_costs <- sapply(data_num100, cost_function)
cost_of_average_duration <- cost_function(mean)
average_call_cost <- mean(call_costs)
quartiles <- quantile(call_costs, probs = c(0.25, 0.75))
data2 <- read.table("C:/Users/admin/OneDrive/Έγγραφα/R/call_duration_100.txt")
data2 <- read.table("C:/Users/admin/OneDrive/Έγγραφα/R/call_duration_10000.txt")
data_num10000 <-  as.numeric(data2$x)
hist10000 <- hist(data_num10000, prob = TRUE, breaks = 10,main = "Call Duration Histogram with PDF",xlab = "Call Duration (minutes)", ylab = "Relative Frequency")
hist10000 <- curve((x^2 / 2) * exp(-x), from = 0, to = max(data_num10000), add = TRUE, lwd = 1)
prob_most_one2 <-mean(data_num10000 <= 1)
prob_most_two2 <- mean(data_num10000 <= 2)
mean2 <- mean(data_num10000)
var2 <- var(data_num10000)
cost_function2 <- function(x) {
  if (x <= 2) {
    return(2)
  } else {
    return(2 + 4 * (x - 2))
  }
}
call_costs2 <- sapply(data_num10000, cost_function2)
cost_of_average_duration2 <- cost_function(mean2)
average_call_cost2 <- mean(call_costs2)
quartiles2 <- quantile(call_costs2, probs = c(0.25, 0.75))