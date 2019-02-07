
# Change the default folder location (change the folder location in below code)
setwd("C:/Users/MANU/Desktop/Datasets/")


#### Read a delimited file  ####

# change the folder location in below code
delimited <- read.delim("C:/Users/MANU/Desktop/Datasets/delim.txt", sep=";", header = TRUE)

# view first few rows
head(delimited)



## Extra ##

# above will also show some warning due to no-line break in the file, if you want you can disable warnings using
options(warn=-1)

# to reset or enable back the default warnings (because sometimes you may need it)
options(warn=0)