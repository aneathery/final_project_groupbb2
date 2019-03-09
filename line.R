# line.R

# Line chart that shows fuel types by year and by state or all states

# Load libraries
library(dplyr)
library(plotly)

# Loading in data TEMPORARY
gas_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Data filtered by year opened
yearly_gas_data <- gas_data %>%
  mutate(year = substr(gas_data$Open.Date, nchar(gas_data$Open.Date) - 3, nchar(gas_data$Open.Date))) %>%
  select(year)

yeet <- yearly_gas_data[1,15]

# What the gas types are
test <- gas %>%
  group_by(Fuel.Type.Code) %>%
  count()

# 