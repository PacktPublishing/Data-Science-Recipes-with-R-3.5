
## Adjusting the themes in ggplot2


# load the packages 
library(ggplot2)
library(gridExtra)
library(dplyr)

# make a base plot
gg <- EmployeeData %>% filter(Gender != "U") %>% 
  ggplot(mapping= aes(x = Gender))

# add geom bar and themes BW and dark
p1 <- gg + geom_bar() + theme_bw() + ggtitle("Emaple : Theme BW")
p2 <- gg + geom_bar() + theme_dark() + ggtitle("Emaple : Theme Dark")

# arrange the plots
grid.arrange(p1, p2)

# add more features to the themes
gg + geom_bar(color="black", fill="steelblue", alpha=0.8) +
  theme(
    axis.title = element_text(size=12, face="bold"),
    plot.title = element_text(size=15, face="bold", hjust=0.5, vjust=-1.0, colour="maroon"),
    panel.grid.major = element_line(colour = "red"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "gray")
  ) + ggtitle("Our Customized theme")








