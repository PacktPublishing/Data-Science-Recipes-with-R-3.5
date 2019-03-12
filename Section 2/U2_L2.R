
#### Changing thevariable data types in R

# reading data from github
AdultData <- read.csv("https://github.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/raw/master/Section%202/AdultData.csv")

# data types of the each variable
sapply(AdultData, class)

# changing data type of 'workclass' variable
AdultData$workclass <- as.character(AdultData$workclass)

# Transform another variable
AdultData$educational.num <- as.factor(AdultData$educational.num)

as.integer()

as.numeric()

as.Date()
