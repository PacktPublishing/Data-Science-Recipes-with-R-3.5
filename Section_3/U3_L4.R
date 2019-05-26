
# load the package
library(data.table)

# Download the AdultData from GitHub Location:
url1 <- "https://github.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/raw/master/Section%202/AdultData.csv"

# Read into data.table object name "AdultData1"
AdultData1 <- fread(url1, sep=',')

# Download the second dataset AdultData2 from below GitHub Location:
url2 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/AdultData2.csv"

# Read into data.table object name "AdultData2"
AdultData2 <- fread(url2, sep=',')

# Download third dataset AdultData3
url3 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_3/AdultData3.csv"

# Read into data.table object name "AdultData3"
AdultData3 <- fread(url3, sep=",")

# Review datatables
names(AdultData1)
names(AdultData2)
names(AdultData3)

# merging or appending two datatables into an object "FinalDataTable"
FinalDataTable <- rbindlist(list(AdultData1, AdultData2))

# merging or appending two datatables into an object "FinalDataTable"
FinalDataTable2 <- rbindlist(list(AdultData1, AdultData2), use.names = TRUE, fill = TRUE)

# set primary key on the variable by which join to happen
setkey(AdultData2, Date_of_Joining)
setkey(AdultData3, Date_of_Joining)

# Left Join AdultData2 and AdultData3
Left_Joined_DataTable <- AdultData2[AdultData3]

# Right Join AdultData2 and AdultData3
Right_Joined_DataTable <- AdultData3[AdultData2]

# Inner join the datatables
Inner_Joined_DataTable <- AdultData2[AdultData3, nomatch = 0]












