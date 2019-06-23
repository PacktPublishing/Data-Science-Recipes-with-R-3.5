
## Interactive Maps in R

# install package
# install.packages("leaflet", dependencies = T)

# load the package
library(leaflet)

# mark the birth place of MK Gandhi
map1 <- leaflet() %>% addTiles() %>% # use the default base map which is OpenStreetMap tiles
  addMarkers(lat = 21.6454569, lng = 69.5999976, popup = "The birthplace of MK Gandhi") %>% 
  setView(lat = 21.6454569, lng = 69.5999976, zoom = 4)

# Print the plot
map1

# install package
# install.packages("maps", dependencies = T)

library(maps)

# map the US state maps
mapUSA <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapUSA) %>% addTiles() %>% addPolygons(fillColor = rainbow(10, alpha = NULL), stroke = FALSE)
