# Plotting in R using ggplot2 package

# install package
install.packages("ggplot2", dependencies = T)

# Load the packages
library(dplyr)
library(data.table)
library(ggplot2)

# Load the Employee Data
url1 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/EmployeeData.csv"
EmployeeData <- fread(url1, sep= ",", stringsAsFactors = TRUE)

# Load the Rice Production Data
url2 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/RiceProductionData.csv"
RiceData <- fread(url2, sep= ",", stringsAsFactors = FALSE)

# Load the Grains Data
url3 <- "https://raw.githubusercontent.com/PacktPublishing/Data-Science-Recipes-with-R-3.5/master/Section_4/PrincipalCropsProductionData.csv"
GrainsData <- fread(url3,  sep= "," ,  stringsAsFactors = TRUE)

# Base plot
myPlot4 <- ggplot(data = GrainsData, aes(x=Year)) + 
  labs(x = "Year",
       y = "Production in Tonnes",
       title = "Yearly Grains Production",
       subtitle = "x10000 Tonnes"
       ) +
  theme(axis.text.x = element_text(angle = -45, hjust = 0, vjust = 1),
        axis.text.y = element_text(angle = 45, hjust = 0, vjust = 2),
        axis.title = element_text(size = 12, face = "bold", colour = "maroon"),
        plot.title = element_text(size = 15, face = "bold", colour = "maroon", hjust = 0.5, vjust = -1),
        plot.subtitle = element_text(size = 10, face = "italic", hjust = 0.5)
        )

myPlot4

# Add lines to the base plot
myPlot5 <- myPlot4 +
  geom_line(aes(y = Rice / 10000, colour = "red"), size=1.2) +
  geom_line(aes(y = Wheat / 10000, colour = "blue"), size=1.2)

# Plot it
myPlot5

# Change the title of the legend and rename with original var names
myPlot6 <- myPlot5 + guides(colour = guide_legend("Grains")) +
  scale_colour_manual(labels = c("Rice", "Wheat"), values = c("red", "blue"))

myPlot6


### Box Plot : Ages Vs Genders in Employee's data

# Store the basic ggplot metadata into an object, say, Boxplot.
BoxPlot <- ggplot(EmployeeData, aes(x = Gender, y = Age_in_Yrs))

# Add geomatric object "Boxplot" and title to the plot
BoxPlot + geom_boxplot(fill = "blue", colour = "black", alpha=0.7) +
  ggtitle("Distribution of Ages accross genders")

# Create a subset of employee's data where we normalize the salaries into another column using dplyr package
EmployeeData_Subset <- EmployeeData %>% select(Gender, GrossSalary) %>% 
  mutate(LogSalary = log(GrossSalary)) %>% na.omit()

# Store the basic plot metadata into an object
BoxPlot2 <- ggplot(EmployeeData_Subset, aes(x = Gender, y = LogSalary))

# add Boxplot geomatry and title
BoxPlot2 + geom_boxplot(fill = "blue", colour="black", alpha=0.7) + 
  ggtitle("Distribution of Gross Salaries by Genders")










