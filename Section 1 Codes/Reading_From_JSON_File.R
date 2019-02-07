

# Change the default folder location (change the folder location in below code)
setwd("C:/Users/MANU/Desktop/Datasets/")


#### Reading from JSON Files ####

# To read JSON files into R, we first need to install and load the rjson package
install.packages("rjson", dependencies = T)

# load "rjson" package
library(rjson)

# Import data from json file (change the folder location in below code)
JsonData <- fromJSON(file="C:/Users/MANU/Desktop/Datasets/jason_sample.json")
print(JsonData)

# Convert JSON data into a dataframe
jsonData_to_DataFrame <- as.data.frame(JsonData)

# View first few rows
head(jsonData_to_DataFrame)