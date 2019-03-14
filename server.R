# server.R

# This is the file that provides instructions to the R server.
library("shiny")

# Source in files
source("scripts/map.R")
source("scripts/bar.R")
source("scripts/line.R")

# Load data
fuel_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Start shinyServer
shinyServer <- function(input, output) {

  # Page 2 Map
  output$map <- renderLeaflet({
    return(make_station_map(fuel_data, input$fuel_type_map))
  })

  # Page 3 Bar Chart
  output$bar <- renderPlotly({
    return(make_bar_chart(fuel_data, input$select_state))
  })
  output$bar_two <- renderPlotly({
    return(make_bar_chart_two(fuel_data, input$select_state_two))
  })

  # Page 4 Line Graph
  output$line <- renderPlotly({
    make_line_graph(
      fuel_data, input$line_dropdown, input$fuel_type_line, input$year_range[1], 
      input$year_range[2]
    )
  })
}
