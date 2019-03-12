# ui.R

############################## Set up ##########################################

# Load Libraries
library("dplyr")
library("shiny")
library("ggplot2")
library("rsconnect")
library("plotly")
library("leaflet")
library("lubridate")
library("ggmap")

# Load data
fuel <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Getting the state names for the dropdown menu
state_names <- fuel %>%
  select(State) %>%
  arrange(State) %>% # Alphabetizing the states
  distinct(State) # Getting each individual state

# Fuel Types
fuel_types <- list(
  "Biodiesel (BD)" = "BD",
  "Compressed Natural Gas (CNG)" = "CNG",
  "Ethanol (E85)" = "E85",
  "Electric Charging (ELEC)" = "ELEC",
  "Hydrogen (HY)" = "HY",
  "Liquefied Natural Gas (LNG)" = "LNG",
  "Propane (LNG)" = "LPG"
)

################################# Widgets ######################################

bar_widget_1 <- selectInput(
  "select_state",
  label = "Select First State",
  choices = state_names,
  selected = "AR"
)

bar_widget_2 <- selectInput(
  "select_state_two",
  label = "Select Second State",
  choices = state_names,
  selected = "MS"
)

# Drop down menu that allows user to select a fuel type
dropdown_fuel_type <- selectInput(
  inputId = "fuel_type",
  label = "Fuel Type",
  choices = fuel_types,
  selected = "ELEC"
)

# Slider that lets the user pick the range of years
slider_year_timeline <- sliderInput(
  "year_range",
  label = "Timeline",
  min = 1990,
  max = 2018,
  value = c(1990, 2018),
  sep = ""
)

map_widget <- checkboxGroupInput(
  inputId = "fuel_type",
  label = "Fuel Type",
  choices = fuel_types,
  selected = "BD"
)

################################# UI ###########################################

# Overview Page
page_one <- tabPanel(
  "Overview",
  titlePanel(
    "Edit this"
  ),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Map page
page_two <- tabPanel(
  "Map",
  titlePanel(
    "Alternative Fuel Station Locations"
  ),
  # Description of Analysis Importance
  p("One way to conceptualize the demand for alternative fuel is by visualizing 
    the popularity of different fuel types in different regions of the country. 
    "),
  h4("Select alternative fuel types of interest to view their locations 
     throughout the United States."),
  p("Using a map to display the location of alternative stations allows 
    potential buyers to better visualize the locations of fuel stations and thus
    develop an intuitive understanding of the differing needs 
    for alternative fuel in different regions of the U.S."),
  h1(), # Creating space between text and widgets/graphs
  h1(), # Creating space between text and widgets/graphs
  # Start of data
  sidebarLayout(
    sidebarPanel(
      map_widget
    ),
    mainPanel(
      leafletOutput("map")
    )
  )
)

# Bar chart page
page_three <- tabPanel(
  "Bar Chart", # Tab Name
  titlePanel("Breakdown of Fuel Types for Two States"),
  # Description of Analysis Importance
  p("There are various types of fuel stations throughout the United States
    that consumers can choose from. As the amount of stations within each
    state varies, so does the amount of each fuel type. "),
  h4("Choose two states to analyze using the dropdown menus."),
  p("By looking at the two bar charts, one can visually see how the
    availability of different fuel type stations varies between the two
    states. One can quickly learn which fuel type has the most amount of
    stations in each state compared to the other type, the distribution
    between the fuel types, and how the two states compare in distribution.
    This information allows potential buyers to learn in which states his/her
    fuel type of interest is most accessible in and be able to compare
    two states of interest. "),
  h1(), # Creating space between text and widgets/graphs
  h1(), # Creating space between text and widgets/graphs
  # Start of data
  sidebarLayout(
    sidebarPanel(
      # Widgets
      bar_widget_1,
      bar_widget_2
    ),
    mainPanel(
      fluidRow(
        splitLayout(
          cellWidths = c("50%", "50%"), # Two charts side-by-side
          plotlyOutput("bar"),
          plotlyOutput("bar_two")
        )
      )
    )
  )
)

# Line graph page
page_four <- tabPanel(
  # Tab name
  "Line Graph",
  titlePanel("Alternate Fuel Growth"),
  sidebarLayout(
    sidebarPanel(
      # Widgets
      dropdown_fuel_type,
      slider_year_timeline
    ),
    mainPanel(
      plotlyOutput(outputId = "line")
    )
  )
)

# Start of UI
shinyUI(navbarPage(
  "Analyzing Alternative Fuel Types",
  # page_one,
  page_two,
  page_three,
  page_four
))
