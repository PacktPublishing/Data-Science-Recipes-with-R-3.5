
## Combining the plots

# load the packages 
library(ggplot2)
library(gridExtra)
library(tidyr)
library(dplyr)

# reshape the data in GrainsData dataset
gd <- GrainsData %>% select(Year, Rice, Wheat) %>% 
  gather(key = "variable", value = "value", -Year)

# Time Series : Multiple Line Plot
p1 <- ggplot(gd, aes(x = Year, y = value)) + geom_line(aes(color = variable), size=1.5) +
  scale_color_manual(values = c("#236AB9", "#FC7307")) + 
  theme_bw() + 
  theme(
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 15, face = "bold", hjust = 0.5, vjust = -1.0, colour = "maroon"),
    panel.grid.major = element_line(colour = "light blue"),
    panel.grid.minor = element_blank()
  ) + ggtitle("Wheat Vs Rice Production")


# Time Series : Multiple Area Plot
p2 <- ggplot(gd, aes(x = Year, y = value)) + 
  geom_area(aes(color = variable, fill = variable), alpha=0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#236AB9", "#FC7307")) + 
  scale_fill_manual(values = c("#236AB9", "#FC7307")) +
  theme_bw() + 
  theme(
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 15, face = "bold", hjust = 0.5, vjust = -1.0, colour = "maroon"),
    panel.grid.major = element_line(colour = "light blue"),
    panel.grid.minor = element_blank()
  ) + ggtitle("Wheat Vs Rice Production : Area Plot")


# Arrange the plots into one area
grid.arrange(p1, p2, nrow = 1)

grid.arrange(p1, p2, ncol = 1)

grid.arrange(p1, p2, p1, p2, ncol = 2, nrow = 2)

# gridExtra vignette:
https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html














