# map.R

# Create a map displaying the location of alternative fuel stations in the
# United States

################################### Set up ###################################

# Load libraries
library("leaflet")
library("dplyr")

# Load raw data
raw_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

############################## Bar Chart #####################################

# This map displays the location of alternative fuel stations in the United
# States

make_station_map <- function(stations_df, fuel_choice) {
  color_palette <- colorFactor(
    c(
      "navy",
      "red1",
      "plum3",
      "turquoise4",
      "seagreen1",
      "orangered2",
      "yellowgreen"
    ),
    domain = unique(stations_df$Fuel.Type.Code)
    # Note: Linting error for Fuel.Type.Code using '.' instead of '_' but
    # have to use '.' because that is from the csv dataset
  )

  fuel_type <- filter(stations_df, stations_df$Fuel.Type.Code == fuel_choice)

  stations_map <- leaflet(data = fuel_type) %>%
    addTiles() %>%
    addCircles(
      lat = ~Latitude,
      lng = ~Longitude,
      popup = paste0(
        "Location: ", fuel_type$City, ", ", fuel_type$State,  "<br/>",
        "Station Name: ", fuel_type$Station.Name, "<br/>",
        "Fuel Type: ", fuel_type$Fuel.Type.Code, "<br/>"
      ),
      color = ~ color_palette(Fuel.Type.Code)
    ) %>%
    addLegend(
      pal = color_palette,
      values = ~ stations_df$Fuel.Type.Code,
      title = "Fuel Types",
      group = "circles",
      position = "bottomleft"
    ) %>%
    setView(-100, 37.8, 3.6)
}
