
# Plotting in R using ggplot

# install package
install.packages("ggplot2", dependencies = T)

# Load the packages
library(dplyr)
library(data.table)
library(ggplot2)

# Load the Employee Data
url1 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/EmployeeData.csv"
EmployeeData <- fread(url1, sep= ",", stringsAsFactors = TRUE)

# Load the Rice Production Data
url2 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/RiceProductionData.csv"
RiceData <- fread(url2, sep= ",", stringsAsFactors = FALSE)

# Load the Grains Data
url3 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/PrincipalCropsProductionData.csv"
GrainsData <- fread(url3,  sep= "," ,  stringsAsFactors = TRUE)



#### Creating basic plots with ggplot2 package ###

# creating base plot
plot(x= GrainsData$Year, y= GrainsData$Rice)

# modifying the above plot
plot(x= GrainsData$Year, y= GrainsData$Rice/10000, type="l", lwd="2", col="blue",
     xlab = "Year", ylab = "Production in x10000 tonnes", main = "Yearly Rice Production Data")

# Basic line plot in ggplot2
ggplot(data = GrainsData, aes(x=Year, y=Rice)) + geom_line()

# Add more aesthetics to the plot
myPlot1 <- ggplot(data = GrainsData, aes(x=Year, y=Rice/10000)) + geom_line() + geom_point() + 
  labs(x = "Years", y = "Production in Tonnes", title = "Yearly Rice Prodcution",
       subtitle = "x10000 Tonnes")

myPlot1














