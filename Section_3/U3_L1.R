
# Working with a data.table format

# Step 1. Installation of the packages
install.packages(c("dplyr", "tidyverse", "data.table"), dependencies = TRUE)

# Step 2. Attach the packages to the global environment
library(data.table)
library(tidyverse)
library(dplyr)

# Step 3. Github Location's URL
url <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/ProductData.csv" 

# Step 4. Reading data from GitHub, create 'dataframe' object named as DataFrame and return total time taken by the process
system.time(DataFrame <- read.csv(url))

# Step 5. Reading data from GitHub, create'data.table' object named as DataTable and return total time taken by the process
system.time(DataTable <- fread(url, sep=','))

# Step 6. examine the structures of the objects
str(DataFrame)
str(DataTable)

# Step 7. Convert the dataframe object into data.table object
DataFrame2DataTable <- as.data.table(DataFrame)

# check for the structure of the above object
str(DataFrame2DataTable)









