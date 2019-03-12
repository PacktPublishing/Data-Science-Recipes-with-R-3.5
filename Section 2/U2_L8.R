

# Sorting data in R

# Read tge csv data from the GitHub location
PoliticalData <- read.csv("https://github.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/raw/master/Section%202/PoliticalData_Small.csv")

str(PoliticalData)

# sorting the data by variable network type
PDSorted1 <- PoliticalData[ order( PoliticalData$network) , ]

# sorting the data by the variable Day in descending order
PDsorted2 <- PoliticalData[ order( -PoliticalData$Day) , ]

# sorting the data by the variable Day in descending order using column index
PDsorted3 <- PoliticalData[ order( -PoliticalData[ , 5]) , ]

# sorting the data by column network in ascending Order and by column Day in descending order
PDsorted4 <- PoliticalData[ order( PoliticalData$network, -PoliticalData$Day) , ]

# Sorting the data by column name network using arrange function
PoliticalData5 <- PoliticalData %>% arrange(network)

# sorting of the data by column names network and Day
PoliticalData6 <- PoliticalData %>% arrange(network, Day)

# sorting of the data by column network in ascending order but by Day in descending order
PoliticalData7 <- PoliticalData %>% arrange(network, desc(Day))










