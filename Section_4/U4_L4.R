
### Transformation and Scale Adjustment ###

# Production to Area Ratio's line plot
plot(x=RiceData$Year, y=RiceData$Prod_To_Area, type="l")

# Addggplot metadata and theme parameters into an object and map the data
Rice_ProdToArea <- ggplot(data=RiceData, mapping = aes(x=Year, y=Prod_To_Area)) +
  theme(axis.text.x = element_text(face="bold"),
        axis.text.y = element_text(face="bold"),
        axis.title = element_text(size=11, face="bold", colour="maroon"),
        plot.title = element_text(size=13, hjust = 0.5, face="bold", colour = "maroon", vjust = -1)
        )

# Create a regression line plot using geom_smooth and geom_point functions
Rice_ProdToArea + geom_point(size = 3) + geom_smooth() +
  ggtitle("Production of Rice to Harvested Area")   # add plot title

# specify the linear model to be used
Rice_ProdToArea + geom_point(size = 3) + geom_smooth(method = lm) +
  ggtitle("Production of Rice to Harvested Area")   # add plot title

Rice_ProdToArea + geom_point(size = 3) + geom_smooth(method = lm, level=0.9) +
  ggtitle("Production of Rice to Harvested Area")   # add plot title

# Create regression plot
plot1 <- EmployeeData %>% select(Age_in_Yrs, GrossSalary, Gender, EthnicGroup) %>% 
  filter(Gender != "U" & EthnicGroup == c("WHITE", "ASIAN")) %>% 
  ggplot(aes(x = Age_in_Yrs, y = GrossSalary , fill = EthnicGroup)) + 
  geom_smooth(method = "lm",
              color = "black",
              size = 0.5) + 
  facet_grid(~Gender) 

# Print the plots
plot1


# Create regression plot with data
plot2 <- EmployeeData %>% select(Age_in_Yrs, GrossSalary, Gender, EthnicGroup) %>% 
  filter(Gender != "U" & EthnicGroup == c("WHITE", "ASIAN")) %>% 
  ggplot(aes(x = Age_in_Yrs, y = GrossSalary , fill = EthnicGroup)) + 
  geom_smooth(method = "lm",
              color = "black",
              size = 0.5) + 
  facet_grid(~Gender) + geom_point()

# Print the plots
plot2


# install and load the scales package
# install.packages("scales", dependencies = T)
library(scales)

# scale the y axis using log10 transformation
plot2 + scale_y_continuous(trans = log10_trans())

# install the package 
# install.packages("gridExtra", dependencies = T)
# load the package
library(gridExtra)

# create base plot
plot3 <- ggplot(EmployeeData, aes(EthnicGroup))

# Plot 1 : add geom barplot
p1 <- plot3 + geom_bar(width = 0.5)

# Plot 2 : scale the y axis using log10
p2 <- plot3 + geom_bar(width = 0.5) + scale_y_log10()

# arrange both the plots in one graph area
grid.arrange(p1, p2)


# mean and median of gross salaries grouped by ages in years and cities
EmployeeData2 <- EmployeeData %>% group_by(City, Age_in_Yrs) %>% 
  summarise(mean_salary = mean(GrossSalary),
            median_salary = median(GrossSalary),
            Counts = n()) %>% arrange(City, Age_in_Yrs)

# for each age group, hot the mean of the salaries vary in this data?
ggplot(EmployeeData2, aes(Age_in_Yrs, mean_salary)) + geom_point()

# limit the axis and zoom the plot
ggplot(EmployeeData2, aes(Age_in_Yrs, mean_salary)) + geom_point() + 
  coord_cartesian(xlim = c(20,60), ylim = c(0, 5000))






