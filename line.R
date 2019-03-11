# line.R

# Line chart that shows fuel types by year and by state or all states

# Load libraries
library(dplyr)
library(plotly)

# Loading in data TEMPORARY ////////////////////
gas_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Data filtered by year opened
yearly_data <- gas_data %>%
  mutate(
    year = as.numeric(substr(gas_data$Open.Date, nchar(gas_data$Open.Date) -
      3, nchar(gas_data$Open.Date)))
  ) %>%
  filter(
    Fuel.Type.Code == "ELEC" # Select which fuel type to use
  ) %>%
  group_by(year) %>%
  count()

# Data for years
years <- c(1990:2018)
year <- data.frame("year" = years)
yearly_data <- left_join(year, yearly_data, by = "year")
yearly_data$n[is.na(yearly_data$n)] <- 0

# Line graph
plot <- plot_ly(
  data = yearly_data,
  x = ~year,
  y = ~n,
  type = "scatter",
  mode = "line"
) %>%
  layout(
    title = paste0("Stations Opened By Year"),
    xaxis = list(title = "Year"),
    yaxis = list(title = "Stations Opened")
  )

# Fuel Types
fuel_types <- unique(gas_data$Fuel.Type.Code)

# This function takes in a data set, a fuel type, and a start and end year and 
# creates a line graph of the number of fueling stations opened for a specified
# fuel type within a specified ranged
make_line_graph <- function(data, fuel_type, start_year, end_year) {
 
  # Data filtered by year opened
  yearly_data <- gas_data %>%
    mutate(
      year = as.numeric(substr(gas_data$Open.Date, nchar(gas_data$Open.Date) -
        3, nchar(gas_data$Open.Date)))
    ) %>%
    filter(
      Fuel.Type.Code == fuel_type # Select which fuel type to use
    ) %>%
    group_by(year) %>%
    count()
  
  # Filtering the data by year range
  years <- c(start_year:end_year)
  year <- data.frame("year" = years)
  yearly_data <- left_join(year, yearly_data, by = "year")
  yearly_data$n[is.na(yearly_data$n)] <- 0 # Changing NA values to 0
  
  # Line graph
  line_graph <- plot_ly(
    data = yearly_data,
    x = ~year,
    y = ~n,
    type = "scatter",
    mode = "line"
  ) %>%
    layout(
      title = paste0("Stations Opened By Year"),
      xaxis = list(title = "Year"),
      yaxis = list(title = "Stations Opened")
    )
  return(line_graph)
}

zz <- make_line_graph(gas_data, "ELEC", 2005, 2018)
