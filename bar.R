# final-project-groupbb2

# This is the file in which Karen will be creating a bar chart about the 
# breakdown of different fuel types in each state. 

################################### Set up ###################################

library("dplyr")
library("plotly")

# raw_data <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

############################## Bar Chart #####################################

# This bar chart will show how many stations of each fuel type are in a 
# selected state.
make_bar_chart <- function(data_set, state_var, fuel_var) {
  getting_data <- data_set %>%
    select(State, fuel_type) %>%
    arrange(State) %>%  
    filter(State == state_var) %>% 
    group_by(fuel_type) %>% 
    count() %>% 
    filter(fuel_type == fuel_var)
    
  fuel_chart <- plot_ly(
      data = getting_data, # data frame to show
      x = ~n, # variable for the x-axis, specified as a formula
      y = ~fuel_type, # variable for the y-axis, specified as a formula
      type = "bar", # create a chart of type "bar" -- a bar chart
      alpha = .7, # adjust the opacity of the bars
      hovertext = ~n,
      orientation = "h"
    ) %>%
    layout( # Proper labels for the map
      title = "Breakdown of Fuel Types",
      xaxis = list(title = "Number of Stations"),
      yaxis = list(title = "Fuel Type")
    )
}



# Attempt at a stacked bar chart


# state_name <- unique(getting_data$State)
# for (i in 1:53) {}
# fuel_names <- c(getting_data$fuel_type[1],
#                 getting_data$fuel_type[2],
#                 getting_data$fuel_type[3],
#                 getting_data$fuel_type[4],
#                 getting_data$fuel_type[5],
#                 getting_data$fuel_type[6],
#                 getting_data$fuel_type[7])
# amounts <- c(getting_data$n[1],
#             getting_data$n[2],
#             getting_data$n[3],
#             getting_data$n[4],
#             getting_data$n[5],
#             getting_data$n[6],
#             getting_data$n[7])
# data <- data.frame(state_name, fuel_names, amounts)
# 
# p <- plot_ly(data, x = ~state_name, y = ~getting_data$n[1], type = 'bar', name = getting_data$fuel_type[1]) %>%
#   add_trace(y = ~getting_data$n[2], name = getting_data$fuel_type[2]) %>%
#   add_trace(y = ~getting_data$n[3], name = getting_data$fuel_type[3]) %>%
#   add_trace(y = ~getting_data$n[4], name = getting_data$fuel_type[4]) %>%
#   add_trace(y = ~getting_data$n[5], name = getting_data$fuel_type[5]) %>%
#   add_trace(y = ~getting_data$n[6], name = getting_data$fuel_type[6]) %>%
#   add_trace(y = ~getting_data$n[7], name = getting_data$fuel_type[7]) %>%
#   layout(
#     title = "Breakdown of Fuel Types",
#     xaxis = list(title = "State"),
#     yaxis = list(title = 'Count'), 
#     barmode = 'stack')