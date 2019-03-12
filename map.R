# final-project-groupbb2

# This is the file in which Amber will create a map displaying the
# location of alternative fuel stations in the United States.

################################### Set up ###################################
# Load necessary libraries
library("leaflet")
library("dplyr")
library("ggplot2")
library("lubridate")
library("lintr")
library("ggmap")
library("styler")

# Load raw data
raw_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

############################## Bar Chart #####################################

# This map displays the location of alternative fuel stations in the United
# States

make_station_map <- function(stations_df, Fuel.Type.Code) {
  color_palette <- colorFactor(
    c(
      "navy", "deepskyblue", "dodgerblue4", "turquoise4", "blue", "lightblue1",
      "midnightblue"
    ),
    domain = unique(stations_df$Fuel.Type.Code)
  )

  stations_map <- leaflet(data = stations_df) %>%
    addTiles() %>%
    addCircles(
      lat = ~Latitude,
      lng = ~Longitude,
      popup = paste0(
        "City: ", stations_df$City,
        "; Station Name: ", stations_df$Station.Name,
        "; Fuel Type: ", stations_df$Fuel.Type.Code
      ),
      color = ~ color_palette(Fuel.Type.Code)
    ) %>%
    setView(-100, 37.8, 3.6)
}
