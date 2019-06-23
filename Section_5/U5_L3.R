
### smoothing the time series data

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

# Simple Exponential Smoothing
AppleForecast <- HoltWinters(apple, beta = FALSE, gamma = FALSE)
# Print 
AppleForecast
head(AppleForecast)
# Plot
plot(AppleForecast)


# Complex Exponential Smoothing : for noise and trend
AppleForecast2 <- HoltWinters(apple,  gamma = FALSE)
# Print 
AppleForecast2
head(AppleForecast2)
# Plot
plot(AppleForecast2)


#  Complex Exponential Smoothing : for noise, trend and seasonality
AppleForecast3 <- HoltWinters(apple)
# Print 
AppleForecast3
head(AppleForecast3)
# Plot
plot(AppleForecast3)

















