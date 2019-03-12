

# Filtering Data in R

# 1. Load the packages
library(tidyverse)
library(dplyr)
library(lubridate)

# 2. Read the CSV data from GitHub Location
PoliticalData <- read.csv("https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section%202/campaign_data.csv")

# 3. Change the data type
PoliticalData$start_time <- ymd_hms(PoliticalData$start_time)
PoliticalData$end_time <- ymd_hms(PoliticalData$end_time)

# Filtering based on start time after Sep 1, 2016
PoliticalData1 <- PoliticalData %>% filter(start_time > "2016-09-01")

# Filtering based on AND condition
PoliticalData2 <- PoliticalData %>% filter(start_time >= "2016-09-01" & end_time <= "2016-09-15")

# Filtering the data based on equal to condition
PoliticalData3 <- PoliticalData %>% filter(program_type == "news")

# Filtering the data based on equal to and AND conditions
PoliticalData4 <- PoliticalData %>% filter(program_type == "not news" & network == "WRAL")

# Filtering based on OR condition
PoliticalData5 <- PoliticalData %>% filter(program_type == "news" | network == "WRAL")

# Filtering based on IN like operator in SQL
PoliticalData6 <- PoliticalData %>% filter(network %in% c("WRAL", "KLAS"))







