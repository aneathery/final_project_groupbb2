# bar.R

# This is the file in which Karen will be creating a bar chart about the 
# breakdown of different fuel types in each state. 

################################### Set up ###################################

# Load libraries
library("dplyr")
library("plotly")

############################## Bar Chart #####################################

# This bar chart will show how many stations of each fuel type are in a 
# selected state.
make_bar_chart <- function(data_set, state_var) {
  getting_data <- data_set %>%
    select(State, Fuel.Type.Code) %>%
    arrange(State) %>%
    filter(State == state_var) %>%
    group_by(Fuel.Type.Code) %>%
    count()
  fuel_chart <- plot_ly(
    data = getting_data, # data frame to show
    x = ~Fuel.Type.Code, # variable for the x-axis, specified as a formula
    y = ~n, # variable for the y-axis, specified as a formula
    type = "bar", # create a chart of type "bar" -- a bar chart
    alpha = .7 # adjust the opacity of the bars
  ) %>%
  layout( # Proper labels for the map
    title = paste0(state_var, " State Breakdown"),
    xaxis = list(title = "Fuel Type"),
    yaxis = list(title = "Number of Stations"),
    paper_bgcolor = "transparent", # Blends chart with background color
    plot_bgcolor = "transparent" # Blends chart with background color
  )
}

make_bar_chart_two <- function(data_set, state_var) {
  getting_data <- data_set %>%
    select(State, Fuel.Type.Code) %>%
    arrange(State) %>%
    filter(State == state_var) %>%
    group_by(Fuel.Type.Code) %>%
    count()
  fuel_chart <- plot_ly(
    data = getting_data, # data frame to show
    x = ~Fuel.Type.Code, # variable for the x-axis, specified as a formula
    y = ~n, # variable for the y-axis, specified as a formula
    type = "bar", # create a chart of type "bar" -- a bar chart
    alpha = .7, # adjust the opacity of the bars
    paper_bgcolor = "transparent",
    legend = list(
      x = 0, 
      y = 1, 
      bgcolor = 'rgba(255, 255, 255, 0)', 
      bordercolor = 'rgba(255, 255, 255, 0)'
    )
  ) %>%
  layout( # Proper labels for the map
    title = paste0(state_var, " State Breakdown"),
    xaxis = list(title = "Fuel Type"),
    yaxis = list(title = "Number of Stations"),
    paper_bgcolor = "transparent", # Blends chart with background color
    plot_bgcolor = "transparent" # Blends chart with background color
  )
}