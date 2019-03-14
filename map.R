# map.R

# This is the file in which Amber will create a map displaying the
# location of alternative fuel stations in the United States.

################################### Set up ###################################

# Load libraries
library("leaflet")
library("dplyr")
library("ggplot2")
library("lubridate")
library("lintr")
library("ggmap")

# Load raw data
raw_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

############################## Bar Chart #####################################

# This map displays the location of alternative fuel stations in the United
# States

make_station_map <- function(stations_df, fuel_choice){
  color_palette <- colorFactor(
    c("navy", "red1", "plum3", "turquoise4", "seagreen1", "orangered2", "yellowgreen"),
    domain = unique(stations_df$Fuel.Type.Code)
  )
  
  fuelType <- filter(stations_df, stations_df$Fuel.Type.Code == fuel_choice)
  
  stations_map <- leaflet(data = fuelType) %>%
    addTiles() %>%
    addCircles(
      lat = ~Latitude,
      lng = ~Longitude,
      popup = paste0("City: ", stations_df$City, "<br/>", 
                     "Station Name: ", stations_df$Station.Name, "<br/>",
                     "Fuel Type: ", stations_df$Fuel.Type.Code, "<br/>"), 
      color = ~color_palette(Fuel.Type.Code)
    ) %>%
    addLegend(
      pal = color_palette, 
      values = ~stations_df$Fuel.Type.Code, 
      title = "Legend",
      group = "circles", 
      position = "bottomleft"
    ) %>%
    setView(-100, 37.8, 3.6)
}