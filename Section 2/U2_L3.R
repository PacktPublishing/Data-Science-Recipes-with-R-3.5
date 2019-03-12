
## Working with Date Data Types in R


# 1. Install the package lubridate
install.packages("lubridate", dependencies = T)

# 2. Load the packages tidyverse and lubridate 
library(tidyverse)
library(lubridate)

# 3. read the CSV data from the GitHub location
PoliticalData <- read.csv("https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section%202/campaign_data.csv")

# 4. review the valiables and their respective data types
sapply(PoliticalData, class)

# YMDHMS (Year Month Day Hour Minute Second)
# use ymd_hms() function from lubridate package that converts YMDHMS data type into POXISct (Date/Time) type variable

PoliticalData$start_time <- ymd_hms(PoliticalData$start_time)
PoliticalData$end_time <- ymd_hms(PoliticalData$end_time)

PoliticalData <- PoliticalData %>% mutate(start_year = year(start_time),
                                          Month_Name = month(start_time, label=TRUE),
                                          Day = day(start_time),
                                          Day_of_the_Week = wday(start_time, label=TRUE))


# Create Intervals column
PoliticalData <- PoliticalData %>% mutate(intervals = interval(start_time, ymd(Sys.Date())))
# time_length()
# Days elapsed since the airing of the advertisement
PoliticalData <- PoliticalData %>% mutate(Days_Elapsed = round(time_length(intervals, "day")))

# Weeks elapsed since the airing of the advertisement
PoliticalData <- PoliticalData %>% mutate(Weeks_Elapsed = round(time_length(intervals, "week")))

# Months elapsed since the airing of the advertisement
PoliticalData <- PoliticalData %>% mutate(Months_Elapsed = round(time_length(intervals, "month")))

# Years elapsed since the airing of the advertisement
PoliticalData <- PoliticalData %>% mutate(Years_Elapsed = round(time_length(intervals, "year")))


# Filter data before Oct, 1st, 2016
FilteredPoliticalData <- PoliticalData %>% filter(start_time < ymd("2016-10-01"))
















