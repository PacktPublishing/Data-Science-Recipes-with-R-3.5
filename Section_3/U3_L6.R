# Selecting columns and manipulating rows of a datatable

# Load the packages
library(dplyr)
library(tidyverse)
library(tidyselect)
library(data.table)
library(lubridate)

# load the data
url <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/Sales_Jan_2019.csv"
SalesData <- fread(url, sep=",", stringsAsFactors = T)

# Show columns names
colnames(SalesData)

# show structure
str(SalesData)

# change date format
SalesData$Transaction_date <- mdy(SalesData$Transaction_date)

# select single column by index number
df1 <- SalesData[ , 2]

# select multiple columns by index
df2 <- SalesData[ , 2:4]
df3 <- SalesData[ , 4:2]
df4 <- SalesData[ , c(2,5,6)]

# select single column by name of the variable
df5 <- SalesData[ , "City"]

# select multiple columns by names of the variables
df6 <- SalesData[ , c("City", "Country")]

# 1st example: select "Name" and "City" columns from the datatable
df7 <- select(SalesData, Name, City)

# select all the columns except Name and City columns
df8 <- select(SalesData, -Name, -City)

# select columns that start with "Pr" e.g. Price etc.
df9 <- select(SalesData, starts_with("Pr"))

# select columns that end with "te" e.g. Price etc.
df10 <- select(SalesData, ends_with("te"))

# select columns that contain the specific character
df11 <- select(SalesData, contains("_"))

# select columns that matches the specific pattern
df12 <- select(SalesData, matches(".t."))

# select last column from the datatable
df13 <- select(SalesData, last_col())

df14 <- select(SalesData, last_col(offset = 2))

df15 <- select(SalesData, last_col(offset = 2:3))

df16 <- select(SalesData, last_col(offset = 3:2))

# select Name, Price, Product columns where Transaction_date > "2018-05-31"
df17 <- select(filter(SalesData, Transaction_date > "2018-05-31"), c("Name", "Price", "Product")  )











