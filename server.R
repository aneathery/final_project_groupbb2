# final-project

# This is the file that provides instructions to the R server.
library(shiny)

# Read in data
source("bar.R")
source("line.R")
fuel_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Start shinyServer
shinyServer <- function(input, output) {
  
  # Page 1 Overview
  
  # Page 2 Map
  
  # Page 3 Bar Chart
  output$bar <- renderPlotly({
    return(make_bar_chart(fuel_data, input$select_state, input$check_fuel))
  })
  
  # Page 4 Line Graph
  output$line <- renderPlotly({
    make_line_graph(fuel_data, input$fuel_type, 2000, 2018)
  })
}
