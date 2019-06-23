
# load the package
library(data.table)

# Download the data from GitHub Location:
url <- "https://github.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/raw/master/Section%202/AdultData.csv"

# Reading into data.table object
AdultData <- fread(url, sep=',')

# Computing average of ages for each gender type
AdultData[ , mean(age), by=gender]

# removing NAs or NaNs before computing averages
AdultData[ , mean(na.omit(age)), by=gender]

# replace result column V1 with 'Avg_Age' variable name
AdultData[ , .(Avg_Age = mean(na.omit(age))), by=gender]

# unique races for each of the genders grouped by type of education
AdultData[ , .(Unique_Races = uniqueN(race)) , by = .(Education_Type = education, Gender = gender)]
