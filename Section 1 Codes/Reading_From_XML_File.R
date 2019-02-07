
# Change the default folder location in below code
setwd("C:/Users/MANU/Desktop/Datasets/")


#### Reading XML Data  ####

# To read XML data into R, we first need to install and load the XML package
install.packages("XML", dependencies = T)

# load "XML" package
library(XML)

# Source of the file
# http://www.w3schools.com/xml/simple.xml

# to download the above source file, change the folder location in below code
download.file("http://www.w3schools.com/xml/simple.xml", "C:/Users/MANU/Desktop/Datasets/breakfast.xml")

# To read the data (change the folder location in below code)
fileName <- "C:/Users/MANU/Desktop/Datasets/breakfast.xml"

xmlData <- xmlInternalTreeParse(fileName)

# Print xml data
print(xmlData)

# convert xml data into a dataframe
xmlDataFrame <- xmlToDataFrame(xmlData)

# View first few rows
head(xmlDataFrame)