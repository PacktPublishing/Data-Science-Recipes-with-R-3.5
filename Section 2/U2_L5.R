

# Dropping variables in R

PoliticalData$total_time_aired2 <- NULL

PoliticalData[ , c(12, 13)] <- list(NULL)


# removing observations from a dataframe

PoliticalData <- PoliticalData[ -c(1, 3), ]


