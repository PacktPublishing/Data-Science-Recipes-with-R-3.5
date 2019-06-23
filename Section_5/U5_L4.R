
### Making prediction from smoothen time series data

# install the necessary packages
install.packages(c("forecast", "tseries"), dependencies = T)

# load the packages
library(dplyr)
library(forecast)
library(tseries)
library(ggplot2)
library(tidyverse)

# Download the data
url <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_5/AAPL.csv"
APPL <- read.csv(url, stringsAsFactors = F)
rm(url)

# create a time series object
apple <- APPL %>% select(Close) %>% ts(start=c(2000,1), frequency = 12)


# Make prediction for next 12 months

# Prediction from the time series smoothen for noise
AppleForecast11 <- forecast(AppleForecast, h=12)

# Prediction from the time series smoothen for noise and trend-cycle
AppleForecast22 <- forecast(AppleForecast2, h=12)

# Prediction from the time series smoothen for noise, trend-cyle and seasonality
AppleForecast33 <- forecast(AppleForecast3, h=12)


# Plot the prediction
mypar <- par(mfrow = c(2,2))
plot(AppleForecast11)
plot(AppleForecast22)
plot(AppleForecast33)
par(mypar)










