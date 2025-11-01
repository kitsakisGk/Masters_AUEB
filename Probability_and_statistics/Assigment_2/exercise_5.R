joker_2020 <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assigment_2/joker data/Joker_2020.csv", stringsAsFactors = FALSE)
joker_2021 <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assigment_2/joker data/Joker_2021.csv", stringsAsFactors = FALSE)
joker_2022 <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assigment_2/joker data/Joker_2022.csv", stringsAsFactors = FALSE)
joker_2023 <- read.csv("C:/Users/admin/OneDrive/Υπολογιστής/Master AUEB DS/Probability_and_statistics/Assigment_2/joker data/Joker_2023.csv", stringsAsFactors = FALSE)

joker_2020_numbers <- joker_2020$ΤΖΟΚΕΡ_1_από_20 
joker_2021_numbers <- joker_2021$ΤΖΟΚΕΡ_1_από_20
joker_2022_numbers <- joker_2022$ΤΖΟΚΕΡ_1_από_20
joker_2023_numbers <- joker_2023$ΤΖΟΚΕΡ_1_από_20

max_length <- max(
  length(joker_2020_numbers),
  length(joker_2021_numbers),
  length(joker_2022_numbers),
  length(joker_2023_numbers)
)

joker_2020_numbers <- c(joker_2020_numbers, rep(NA, max_length - length(joker_2020_numbers)))
joker_2021_numbers <- c(joker_2021_numbers, rep(NA, max_length - length(joker_2021_numbers)))
joker_2022_numbers <- c(joker_2022_numbers, rep(NA, max_length - length(joker_2022_numbers)))
joker_2023_numbers <- c(joker_2023_numbers, rep(NA, max_length - length(joker_2023_numbers)))

joker_combined <- data.frame(
  Year2020 = joker_2020_numbers,
  Year2021 = joker_2021_numbers,
  Year2022 = joker_2022_numbers,
  Year2023 = joker_2023_numbers
)

#Visualize the data.
print(joker_combined)

create_year_plot <- function(year_data, year_label) {
  freq_table <- table(na.omit(year_data))
  barplot(
    freq_table,
    main = paste("Frequency of Winning Numbers -", year_label),
    xlab = "Joker Numbers",
    ylab = "Frequency"
  )
}

create_year_plot(joker_combined$Year2020, "2020")
create_year_plot(joker_combined$Year2021, "2021")
create_year_plot(joker_combined$Year2022, "2022")
create_year_plot(joker_combined$Year2023, "2023")

all_years <- c(joker_combined$Year2020, joker_combined$Year2021, joker_combined$Year2022, joker_combined$Year2023)
all_years <- na.omit(all_years)  

frequency_table <- table(all_years)

print(frequency_table)

barplot(
  frequency_table,
  main = "Frequency of Winning Joker Numbers (2020-2023)",
  xlab = "Joker Numbers",
  ylab = "Frequency"
)
#Expected Frequency E|x| = total/n and chi-square test.
total_draws <- length(all_years)
print(total_draws)

expected_frequency <- total_draws / 20

chi_square_test <- chisq.test(frequency_table, p = rep(1/20, 20))
print(chi_square_test)
