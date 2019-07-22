
## Machine Learning using R and Spark ###

# load the sparklyr package
library(sparklyr)
library(dplyr)
library(ggplot2)
library(gridExtra)

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

# URL for the data on github
URL<-"https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_6/Sales_Ads_Data.csv"

# Download the data into a dataframe object 'StocksData'
SalesData <- read.csv(URL, stringsAsFactors = F)

# Plot scatter to have an idea about the variables' relationships
p1 <- ggplot(SalesData, aes(x=Sales, y=TV)) + geom_point() + geom_smooth()
p2 <- ggplot(SalesData, aes(x=Sales, y=Radio)) + geom_point() + geom_smooth()
p3 <- ggplot(SalesData, aes(x=Sales, y=Newspaper)) + geom_point() + geom_smooth()
p4 <- ggplot(SalesData, aes(x=Sales, y=Internet)) + geom_point() + geom_smooth()

grid.arrange(p1, p2, p3, p4, ncol=2)

# copy the data to spark
SalesData_SparkTbl <- sdf_copy_to(sc, SalesData, overwrite = T)
# varify
src_tbls(sc)

# partition into training and test sets (70:30 respectively)
partition <- SalesData_SparkTbl %>% sdf_partition(training = 0.7, test = 0.3, seed = 1234)

head(partition$training)
head(partition$test)

# fit a linear regression model to the training dataset
fit <- partition$training %>% ml_linear_regression(Sales ~ . )

# summary of the fitted model
summary(fit)

# make prediction on test data and create a dataframe
df_predicted <- as.data.frame(ml_predict(fit, partition$test))

# density plot of predicted and actual sales data
windows(height = 7, width = 5.5)
plot(density(df_predicted$prediction), col="blue", main = "Actual Vs. Predicted Sales")
lines( density(df_predicted$Sales), col="red")
# add legend
legend("topright", legend=c("Actual", "Predicted"), col=c("blue", "red"), lty=1:2,
  cex=0.8, xjust=0.5, yjust = 0.5, title = "Data Types", text.font = 10, bg="gray90"
)

# box plot
boxplot(df_predicted$Sales, df_predicted$prediction, names = c("Actual Sales", "Predicted Sales"))

# Plot the predicted vs actual sales
ggplot(df_predicted, aes(x=Sales, y = prediction)) + geom_abline(lty="dashed", col="blue") + geom_point() +
  theme(plot.title = element_text(hjust = 0.5)) + coord_fixed(ratio = 1) + 
  labs(x = "Actual Sales", y = "Predicted Sales", title = "Actual Vs. Predicted Sales")


#for more details, please visit:
#   https://spark.rstudio.com/mlib/













