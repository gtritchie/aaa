# show html widget in viewer pane

library(leaflet)

m <- leaflet() %>%
  addTiles() %>% # Add default OpenStreetMap tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m # print the map
