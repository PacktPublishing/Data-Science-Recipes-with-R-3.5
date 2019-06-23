####### Forecasting using ARIMA  #######

# install the packages necessary for this recipe
install.packages(c("urca", "ggplot2","dplyr", "forecast", "tidyverse"), dependencies = T)

# Load the packages necessary for this recipe
library(dplyr)
library(tidyverse)
library(forecast)
library(urca)
library(ggplot2)

# Download the data
url <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_5/AAPL.csv"
APPL <- read.csv(url, stringsAsFactors = F)
rm(url)

# create a time series object
apple <- APPL %>% select(Close) %>% ts(start=c(2000,1), frequency = 12)

# unit root test of original time series data
ur.kpss(apple) %>% summary()

# unit root test of first order differenced time series
ur.kpss(diff(apple)) %>% summary()

# plot the differenced time series
cbind("First Order Difference of data" = diff(apple),
      "Second Order Difference of data" = diff(diff(apple))) %>% 
  autoplot(facets = TRUE) + xlab("Years") + ylab("") + ggtitle("Apple, Inc. Stock Price")

# best fitted ARIMA model
bestModel <- auto.arima(apple)

# summarize the best fit model
summary(bestModel)

# forecast for 24 months in future
ArimaForecast <- forecast(bestModel, h=24)

# assess the model
checkresiduals(bestModel)

# plot the forecast
autoplot(ArimaForecast)












