## Data Manipulation using Dplyr and SQL ###

# load the sparklyr package
library(sparklyr)
# invoke the configuration settings
config <- spark_config()
# setting cores
config$'sparklyr.cores.local' = 6
# setting the system memory (RAM)
config$'sparklyr.shell.driver-memory' = "16G"
# allocation of fraction of RAM
config$'sparklyr.memory.fraction' = 0.9
# to unset the java conflict, if in case any error is thrown
Sys.unsetenv("JAVA_HOME") 
# Connecting spark
sc <- spark_connect(master = "local", version = "2.4.3", config = config)

# URL for the data on github (Source:: Quandl.com)
URL <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_6/bankdata.csv"

# Download the data into a dataframe object 'StocksData'
StocksData <- read.csv(URL)
StocksData$Date <-  as.Date(StocksData$Date, format = "%d-%m-%Y")
str(StocksData)

# Load the dplyr package
library(dplyr)

# push the data from R dataframe to Spark dataframe (table)
copy_to(dest = sc, df = StocksData, name = "StocksData", overwrite = TRUE)

# check how many tables are there in Spark
src_tbls(sc)

# push the data from r dataframe to spark dataframe using instance
SparkObject <- copy_to(dest = sc, df = StocksData, name = "StocksData", overwrite = TRUE)

# add the new column in spark table
SparkObject %>% mutate(IntraDay_Diff = High - Low) %>%  sdf_register("StocksData_Mutated")

# Filtering on Spark dataframe using dplyr functions
SparkObject %>% filter(bank_name == 'SBI') %>% head()

# Groupby summary
SparkObject %>% group_by(bank_name) %>% 
  summarise(minPrice = min(Close, na.rm = T),
            maxPrice = max(Close, na.rm = T),
            count = n()
            ) %>% head()

# SQL Query on Spark

# Query 1
sqlQ1 <- "Select bank_name, TotalTradeQuantity from StocksData where bank_name = 'SBI'"
# Run the query
sdf_sql(sc, sqlQ1)

# collect to bring back data into R dataframe
Local_r_DF <- collect(sdf_sql(sc, sqlQ1))







