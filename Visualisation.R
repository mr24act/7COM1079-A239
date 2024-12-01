# Importing libraries
library(ggplot2)
library(tidyverse)

# Loading data
UnemploymentRatesData <- read_csv('Unemployment rates by Metropolitan Statistical Area 1990-2016.csv')

# Removing commas from numeric columns
UnemploymentRatesData <- UnemploymentRatesData %>%
  mutate_at(vars(`Civilian Labor Force`, Employment, Unemployment), ~ as.numeric(gsub(",", "", .)))

# Checking structure of the data 
str(UnemploymentRatesData)

# Printing the head of the data
head(UnemploymentRatesData)

# Checking missing values of the data
sum(is.na(UnemploymentRatesData))

# Printing the summary of the data
summary(UnemploymentRatesData)

# Printing the last few rows of the data
tail(UnemploymentRatesData)

# Printing the columns of the data
colnames(UnemploymentRatesData)

# Plotting a Histogram for Civilian Labor Force
ggplot(UnemploymentRatesData, aes(x = `Civilian Labor Force`)) + 
  geom_histogram(binwidth = 5000, fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Histogram of Civilian Labor Force", 
       x = "Civilian Labor Force", 
       y = "Frequency")

# Plotting a Histogram for Unemployment Rate
ggplot(UnemploymentRatesData, aes(x = `Unemployment Rate`)) + 
  geom_histogram(binwidth = 0.5, fill = "lightcoral", color = "black") +
  theme_minimal() +
  labs(title = "Histogram of Unemployment Rate", 
       x = "Unemployment Rate (%)", 
       y = "Frequency")

# Plotting a Scatterplot for Civilian Labor Force vs Unemployment Rate
ggplot(UnemploymentRatesData, aes(x = `Civilian Labor Force`, y = `Unemployment Rate`)) +
  geom_point(color = "darkblue", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Scatterplot of Civilian Labor Force vs Unemployment Rate",
       x = "Civilian Labor Force",
       y = "Unemployment Rate (%)")
