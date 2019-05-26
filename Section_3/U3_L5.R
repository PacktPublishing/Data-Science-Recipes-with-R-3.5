
# load the package
library(data.table)

# Download the data from below GitHub Location:
url2 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/AdultData2.csv"
url3 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/AdultData3.csv"

# Read into data.table objects
AdultData2 <- fread(url2, sep=",")
AdultData3 <- fread(url3, sep=",")

# set primary key
setkey(AdultData2, Date_of_Joining)
setkey(AdultData3, Date_of_Joining)

# Left Join AdultData2 and AdultData3
Left_Joined_DataTable <- AdultData2[AdultData3]
# Right Join AdultData2 and AdultData3
Right_Joined_DataTable <- AdultData3[AdultData2]
# Inner join the datatables
Inner_Joined_DataTable <- AdultData2[AdultData3, nomatch = 0]

# review Inner_Joined_DataTable
str(Inner_Joined_DataTable)

# set key to variables of interests
setkey(Inner_Joined_DataTable, gender, age)

# subsetting for females aged 20
SubSet1 <- Inner_Joined_DataTable[ .( "Female", 20) ]

key(Inner_Joined_DataTable)

# Subset the datatable for unique Ages where gender is Male
Inner_Joined_DataTable[ .("Male"), .(unique(age))]

# Reset the key on State variable
setkey(Inner_Joined_DataTable, State)
key(Inner_Joined_DataTable)

Inner_Joined_DataTable[ .("NY"), .(MaxEduYrs = max(educational.num), AvgEduYrs = mean(educational.num)), keyby = gender]

# loading dplyr package
library(dplyr)

# sample 10 random rows from AdultData2datatable
set.seed(123)
sample_n(tbl = AdultData2, size=10, replace = TRUE)

# sample 10% of the total data from datatable AdultData2
SubSet1 <- sample_frac(AdultData2, 0.1, replace = TRUE)
head(SubSet1)







