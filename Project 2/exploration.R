# ============================================================
# STATS 220 Project 2 - exploration.R
# ============================================================

# Part C: Load package and import data
library(tidyverse)

logged_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRpaV2hAWyd5ujhrqoV3zonod4LI6QRkUCaeZARUgJAaRf9IqanNpQS5HTG36xY431Mjpn6MmufFrhC/pub?output=csv")

# Check the data loaded correctly
glimpse(logged_data)
head(logged_data)


# ============================================================
# Part D: Rename variables
# ============================================================

latest_data <- logged_data %>%
  rename(
    timestamp   = Timestamp,
    drink_type  = drink_type,
    size        = size,
    price       = price_nzd,
    time_of_day = time_of_day
  )


# ============================================================
# Part D: Explore summary values
# ============================================================

# Total number of observations
total_obs <- nrow(latest_data)
total_obs

# Mean price of all drinks
mean_price <- mean(latest_data$price)
mean_price

# Maximum price observed
max_price <- max(latest_data$price)
max_price

# Minimum price observed
min_price <- min(latest_data$price)
min_price

# Most common drink type
most_common_drink <- names(sort(table(latest_data$drink_type), decreasing = TRUE))[1]
most_common_drink

# Most common time of day
most_common_time <- names(sort(table(latest_data$time_of_day), decreasing = TRUE))[1]
most_common_time


# ============================================================
# Part D: Explore bar charts (trying different options)
# ============================================================

# Bar chart 1: Count of each drink type
ggplot(latest_data, aes(x = drink_type)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Number of Observations by Drink Type",
    x = "Drink Type",
    y = "Count"
  ) +
  theme_minimal()

# Bar chart 2: Count by size
ggplot(latest_data, aes(x = size)) +
  geom_bar(fill = "coral") +
  labs(
    title = "Number of Observations by Drink Size",
    x = "Size",
    y = "Count"
  ) +
  theme_minimal()

# Bar chart 3 (trying): Count by time of day
ggplot(latest_data, aes(x = time_of_day)) +
  geom_bar(fill = "mediumseagreen") +
  labs(
    title = "Number of Observations by Time of Day",
    x = "Time of Day",
    y = "Count"
  ) +
  theme_minimal()

# Bar chart 4 (trying): Drink type coloured by size
ggplot(latest_data, aes(x = drink_type, fill = size)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Drink Type Broken Down by Size",
    x = "Drink Type",
    y = "Count",
    fill = "Size"
  ) +
  theme_minimal()


# ============================================================
# Part D: FINAL CODE FOR REPORT
# (The two summary values and two bar charts chosen for dynamic_report.Rmd)
# ============================================================

# Summary value 1: mean price
mean_price <- mean(latest_data$price)

# Summary value 2: most common drink type
most_common_drink <- names(sort(table(latest_data$drink_type), decreasing = TRUE))[1]

# Bar chart 1: drink type
ggplot(latest_data, aes(x = drink_type)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Number of Observations by Drink Type",
    x = "Drink Type",
    y = "Count"
  ) +
  theme_minimal()

# Bar chart 2: time of day
ggplot(latest_data, aes(x = time_of_day)) +
  geom_bar(fill = "mediumseagreen") +
  labs(
    title = "Number of Observations by Time of Day",
    x = "Time of Day",
    y = "Count"
  ) +
  theme_minimal()
