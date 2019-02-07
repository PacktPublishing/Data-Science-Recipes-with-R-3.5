
# Change the default folder location (change the folder location in below code)
setwd("C:/Users/MANU/Desktop/Datasets/")


#### Reading from Excel file  ####

# Install package "xlsx"
install.packages("xlsx", dependencies = T)

# sometimes, if needed, specify the javapath to R environment
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_201')   # for me, this is the location where JAVA is installed

# load the package
library(xlsx) 


# Read a sheet in the excel file #

# Read the sheet 1 (change the folder location in below code)
Google1 <- read.xlsx("C:/Users/MANU/Desktop/Datasets/GOOGLE.xlsx", sheetIndex = 1)

# Read the sheet 2 (change the folder location in below code)
Google2 <- read.xlsx("C:/Users/MANU/Desktop/Datasets/GOOGLE.xlsx", sheetIndex = 2)

# View first few rows
head(Google1)
head(Google2)
