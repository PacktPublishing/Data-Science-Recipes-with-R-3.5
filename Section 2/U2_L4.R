


# Adding a new record

PoliticalData <- PoliticalData %>% mutate(total_time_aired = end_time - start_time)

# Method two
PoliticalData$total_time_aired2 <- PoliticalData$end_time - PoliticalData$start_time


# creating a dataframe
df1 <- data.frame(total_time_aired = 10)

