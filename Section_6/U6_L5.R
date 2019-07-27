
## Machine Learning using R, Spark and H2O ###

# Download, install, and initialize the RSparkling
# Install packages H2O depends on
pkgs <- c("methods", "statmod", "stats", "graphics", "RCurl", "jsonlite", "tools", "utils")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}
install.packages("h2o", type = "source", repos = "http://h2o-release.s3.amazonaws.com/h2o/rel-yates/5/R")
install.packages("rsparkling", type = "source", repos = "http://h2o-release.s3.amazonaws.com/sparkling-water/rel-2.4/13/R")

# load the packages
library(dplyr)
library(tidyverse)
library(sparklyr)
library(h2o)
library(rsparkling)

# Connect to the Spark
sc <- spark_connect(master = "local", version="2.4.3")

# url for the data
URL <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_6/CreditRiskData.csv"

# Download the data into an object
LoansData <- read.csv(URL, stringsAsFactors = F)

# Copy to Spark DataFrame
Loans_SparkTbl <- copy_to(sc, LoansData, overwrite = TRUE)
Loans_SparkTbl

# Copy to H2O dataframe
Loans_h2oTbl <- as_h2o_frame(sc, Loans_SparkTbl)
Loans_h2oTbl

str(Loans_h2oTbl)

# list of variables required to be changed from character types to factor types
colm <- c("Employed", "Family_Size", "Married", "Education", "ResidentialArea", "Gender", "OwnedProperty", "LoanApproved")

# Convert the data type
Loans_h2oTbl[colm] <- as.factor(Loans_h2oTbl[colm])

str(Loans_h2oTbl)

# Drop the unwanted column
Loans_h2oTbl["Loan_ID"] <- NULL

# Split the H2O DataFrame into Train and Test sets (70:30%, respectively)
LoanDataSplits <- h2o.splitFrame(Loans_h2oTbl, ratios = 0.7, seed = 1234)

# response variable
y <- "LoanApproved"

# predictor variables set
x <- setdiff(names(Loans_h2oTbl), y)
x


# Logistic Regression on training dataset 
Loan_glm <- h2o.glm(x = x,
                    y = y,
                    family = "binomial",
                    training_frame = LoanDataSplits[[1]],
                    lambda_search = TRUE,
                    nfolds = 10
                    )

# help doc site
# http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/glm.html


# print summary
print(Loan_glm)

# print only the coefficients table
df <- as.data.frame(Loan_glm@model$coefficients_table)
df


# model performance evaluation
modelperformance <- h2o.performance(Loan_glm, newdata = LoanDataSplits[[2]])
print(modelperformance)

# Make prediction
Loan_Prediction <- h2o.predict(Loan_glm, newdata = LoanDataSplits[[2]])

# Review the prediction H2O frame
head(Loan_Prediction)

# H2O frame to Spark DataFrame
Loan_Prediction_SDF <- as_spark_dataframe(sc, Loan_Prediction)

# review the Spark DF
head(Loan_Prediction_SDF)



























