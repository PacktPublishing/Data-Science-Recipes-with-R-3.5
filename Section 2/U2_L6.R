
# Merging datasets


# Creating dataframe emp1
emp1 = data.frame(EmployeeID = c(1:8), 
                  FName = c("Tom", "Herry", "Michael", "Annie", "Martin", "Maria", "Janny", "Abraham"), 
                  LName = c("Hanks", "Potter", "Jackson", "Joey", "Li", "Jordan", "Love", "KP"))

# Creating dataframe emp2
emp2 = data.frame(EmployeeID = c(5:12), 
                  BYear = c(1975, 1980, 1984, 1967, 1971, 1982, 1988, 1986), 
                  BPlace = c("London", "Helsinki", "New York", "Paris", "Tokyo", "Amsterdam", "Manila", "New Delhi"))

# merge dataframes
EmpData <- merge(emp1, emp2, by="EmployeeID")

# Merge Dataframes (using all=TRUE condition)
EmpData1 <- merge(emp1, emp2, by="EmployeeID", all=TRUE)

# Merge Dataframes (using all.x=TRUE condition)
EmpData2 <- merge(emp1, emp2, by="EmployeeID", all.x=TRUE)

# Merge Dataframes (using all.y=TRUE condition)
EmpData3 <- merge(emp1, emp2, by="EmployeeID", all.y=TRUE)
