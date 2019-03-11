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
  filter( 
    Fuel.Type.Code == "BD" # Select which fuel type to use
  ) %>% 
  group_by(year) %>%
  count()

# Grouping by fuel type, state, and year
testing <- gas_data %>%
  mutate(
    year = as.numeric(substr(gas_data$Open.Date, nchar(gas_data$Open.Date) -
                               3, nchar(gas_data$Open.Date))) 
  ) %>% 
  group_by(Fuel.Type.Code, State, year) %>%
  count()

# Removing the row with NA values
yearly_gas_data <- yearly_gas_data[-nrow(yearly_gas_data), ]

# Line graph
plot <- plot_ly(
  data = yearly_gas_data,
  x = ~year,
  y = ~n,
  type = 'scatter',
  mode = "line"
) 

# Testing line plot out
yeet <- pull(yearly_gas_data[1,2])
testplot <- plot_ly(
  data = yearly_gas_data,
  x = ~year,
  type = "scatter",
  mode = "line+markers"
) %>%
  add_lines(y = ~n, name = "linear", line = list(shape = "linear"))

############################## Testing #########################################

bee <- testing %>%
  filter(Fuel.Type.Code == "BD")

testplot <- plot_ly(
  data = yearly_gas_data, 
  x = ~year, 
  type = 'scatter', 
  mode = 'line',
  y = ~n, 
  name = 'ELEC', 
  mode = 'line'
) %>%
  add_trace(
    x = ~bee$year,
    y = ~bee$n, 
    name = 'BD', 
    mode = 'line'
  ) %>%
  layout(title = paste("Stations Opened By Year"),
         xaxis = list(title = "Year"),
         yaxis = list (title = "Stations Opened"))

################################################################################

# Gas types
gas <- c("BD", "CNG", "E85", "ELEC", "HY", "LNG", "LPG")