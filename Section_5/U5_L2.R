
### Decomposing the time series data

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


# decompose the time series data
TimeSeriesComponents <- decompose(apple)

# decomposed elements
names(TimeSeriesComponents)

# view the decomposed elements
head(TimeSeriesComponents$trend)

# plot decomposed time series
plot(TimeSeriesComponents)

# decompose the time series data (multiplicative)
TimeSeriesComponents2 <- decompose(apple, type = "multiplicative")

# plot decomposed time series
plot(TimeSeriesComponents2)


