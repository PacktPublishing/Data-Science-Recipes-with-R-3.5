
# load the package
library(data.table)

# Download the data from GitHub Location:
url <- "https://github.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/raw/master/Section%202/AdultData.csv"

# Reading into data.table object
AdultData <- fread(url, sep=',')

str(AdultData)

# view top 4 rows
head(AdultData, n=4)
head(AdultData, 4)

# view bottom 3 rows
tail(AdultData, 3)

# to view 3 rows from the top and column 2 and 4 of the datatable
head(AdultData[1:3, 2:4])
head(AdultData[1:30, 2:4])
head(AdultData[1:30, 2:4], 3)

# add / update / delete a column in data.table

# add a new column
AdultData[, Age_in_Months := 12 * age]

AdultData[, Age_in_days := 365 * age]

# dropping columns in data.table
AdultData[ , c("Age_in_Months", "Age_in_days") := NULL]

# replacing the row values
AdultData[education == "Assoc-voc", education := "Associate"]












