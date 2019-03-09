# final-project

# This is the file that provides instructions to the R server.

# Read in data
source("bar.R")
raw_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Start shinyServer
serverServer <- function(input, output) {
  output$bar <- renderPlotly({
    return(make_bar_chart(raw_data, input$select_state, input$check_fuel))
  })
}
