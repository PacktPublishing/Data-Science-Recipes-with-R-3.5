
### Forecasting using Arima

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

# plot the time series
autoplot(apple) + 
  ggtitle("Time Series Plot of APPLE's Stock") + 
  xlab("Year") + ylab("Stock Closing Price : Apple Inc, in USD") + 
  theme(plot.title = element_text(hjust = 0.5, vjust = -1.0, face = "bold", color = "maroon"),
        axis.title = element_text(face = "bold", color = "maroon", size = 12)
        )














