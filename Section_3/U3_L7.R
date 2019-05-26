# Chaining operations in R

# Load the packages
library(dplyr)
library(data.table)
library(lubridate)

# load the data
url <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/Sales_Jan_2019.csv"
SalesData <- fread(url, sep=",", stringsAsFactors = T)

# change date format
SalesData$Transaction_date <- mdy(SalesData$Transaction_date)

# view structure
str(SalesData)

# sum of series 1 through 100
sum(1:100)
# sum of numbers
sum(5, 10, 15, 40, 75)

# simple chaining operation
1:100 %>% sum()
c(5, 10, 15, 40, 75) %>% sum()

# select columns Product and Price where individuals are from Houston
select(filter(SalesData, City=="Houston"), contains("Pr"))

filter(SalesData, City=="Houston") %>% select(contains("Pr"))


SalesData %>% filter(City == "Houston") %>% 
  select(contains("Pr")) %>% 
  group_by(Product) %>% 
  summarise(Total = sum(Price))















