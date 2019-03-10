# line.R

# Line chart that shows fuel types by year and by state or all states

# Load libraries
library(dplyr)
library(plotly)

# Loading in data TEMPORARY ////////////////////
gas_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Data filtered by year opened
yearly_gas_data <- gas_data %>%
  mutate(
    year = as.numeric(substr(gas_data$Open.Date, nchar(gas_data$Open.Date) -
    3, nchar(gas_data$Open.Date)))
  ) %>%
  filter( # Select which fuel type to use
    Fuel.Type.Code == "BD"
  ) %>% 
  group_by(year) %>%
  count()

# Removing the row with NA values
yearly_gas_data <- yearly_gas_data[-nrow(yearly_gas_data), ]

# Line graph
plot <- plot_ly(
  data = yearly_gas_data,
  x = ~year,
  y = ~n,
  type = 'bar',
  mode = "markers",
  name = "test"
) 

testplot <- plot_ly(
  data = yearly_gas_data,
  x = ~year,
  type = "scatter",
  mode = "line+markers"
) %>%
  add_lines(y = ~n, name = "linear", line = list(shape = "linear"))

# Gas types
gas <- c("BD", "CNG", "E85", "ELEC", "HY", "LNG", "LPG")
