# line.R

# Line chart that shows the number of stations opened within a specified
# timeline, for a specified fuel type

# Load libraries
library(dplyr)
library(plotly)

# This function takes in a data set, a fuel type, and a start and end year and 
# creates a line graph of the number of fueling stations opened for a specified
# fuel type within a specified ranged
make_line_graph <- function(data, fuel_type, start_year, end_year) {
 
  # Data filtered by year opened
  yearly_data <- data %>%
    mutate(
      year = as.numeric(substr(data$Open.Date, nchar(data$Open.Date) -
        3, nchar(gas_data$Open.Date)))
    ) %>%
    filter(
      Fuel.Type.Code == fuel_type # Select which fuel type to use
    ) %>%
    group_by(year) %>%
    count()
  
  # Creates a data frame of a year range and combines with fuel data.
  # Some years are missing and this section of code will create those missing
  # years and assign 0 stations opened for that year.
  years <- c(start_year:end_year)
  year <- data.frame("year" = years)
  yearly_data <- left_join(year, yearly_data, by = "year")
  yearly_data$n[is.na(yearly_data$n)] <- 0 # Changing NA values to 0
  
  # Line graph
  plot_ly(
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
}