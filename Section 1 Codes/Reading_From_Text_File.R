

# Change the default folder location (change the folder location in below code)
setwd("C:/Users/MANU/Desktop/Datasets/")


#### Reading TEXT file  ####

# Reading a .txt file that doesn't have columns (header) names (change the folder location in below code)
data_without_colnames <- read.table("C:/Users/MANU/Desktop/Datasets/without_header.txt", header = FALSE)

# Reading a .txt file that has columns (header) names (change the folder location in below code)
data_with_colnames <- read.table("C:/Users/MANU/Desktop/Datasets/with_header.txt", header = TRUE)


