
## Advanced Data Manipulation using R and Spark ###

# load the sparklyr package
library(sparklyr)
library(dplyr)

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

# push the data from R dataframe to Spark dataframe (table)
copy_to(dest = sc, df = StocksData, name = "StocksData", overwrite = TRUE)
# check how many tables are there in Spark
src_tbls(sc)
# push the data from r dataframe to spark dataframe using instance
SparkObject <- copy_to(dest = sc, df = StocksData, name = "StocksData", overwrite = TRUE)
# add the new column in spark table
SparkObject %>% mutate(IntraDay_Diff = High - Low) %>%  sdf_register("StocksData_Mutated")


# review the dataframe
SparkObject %>% head()

# Change the formate of date column
SparkObject %>% mutate(Date = date_add(to_date("1970-01-01"), Date)) %>% sdf_register("StocksData2") %>% head()

# filter for HDFC bacnk, aggregate the monthly average of total traded quantities of the stock
library(lubridate)
SparkObject %>% filter(bank_name == "HDFC") %>% 
  mutate(Date = date_add(to_date("1970-01-01"), Date)) %>% 
  mutate(Month = month(Date), Year = year(Date)) %>% 
  select(bank_name, Year, Month, TotalTradeQuantity) %>% 
  group_by(bank_name, Year, Month) %>% arrange(Year, desc(Month)) %>% 
  summarise(Avg_Mthly_Trading = mean(TotalTradeQuantity )) %>% 
  head()

# Avg trading of stocks for HDFC in Nov. month of each year in data
SparkObject %>% filter(bank_name == "HDFC") %>% 
  mutate(Date = date_add(to_date("1970-01-01"), Date)) %>% 
  mutate(Month = month(Date), Year = year(Date)) %>% filter(Month == 11) %>% 
  select(bank_name, Year, Month, TotalTradeQuantity) %>% 
  group_by(bank_name, Year, Month) %>% arrange(Year, desc(Month)) %>% 
  summarise(Avg_Mthly_Trading = mean(TotalTradeQuantity )) %>% 
  head()

# Collect the data for plotting purposes
plt <- # Avg trading of stocks for HDFC in Nov. month of each year in data
  SparkObject %>% filter(bank_name == "HDFC") %>% 
  mutate(Date = date_add(to_date("1970-01-01"), Date)) %>% 
  mutate(Month = month(Date), Year = year(Date)) %>% filter(Month == 11) %>% 
  select(bank_name, Year, Month, TotalTradeQuantity) %>% 
  group_by(bank_name, Year, Month) %>% arrange(Year, desc(Month)) %>% 
  summarise(Avg_Mthly_Trading = mean(TotalTradeQuantity )) %>% 
  collect()

# load ggplot2
library(ggplot2)

# plot the data
ggplot(plt, aes(x = Year, y = Avg_Mthly_Trading)) + geom_line()


