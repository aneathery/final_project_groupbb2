# ui.R

############################## Set up ##########################################

# Load Libraries
library("dplyr")
library("shiny")
library("ggplot2")
library("rsconnect")
library("plotly")

# Load data
fuel <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# List of State names
state_names <- unique(fuel$State)

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

# Dropdown menu for selecting states
bar_widget_1 <- selectInput(
  "select_state",
  label = "Select State",
  choices = state_names,
  # choices = fuel$State, # I made the state names into a variable, I'm not sure if it messes up the code
  selected = "WA"
)

# Checkbox for fuel types
bar_widget_2 <- checkboxGroupInput(
  "check_fuel",
  label = h3("Select Fuel Type"),
  choices = list(
    "BD" = 1,
    "CNG" = 2,
    "E85" = 3,
    "ELEC" = 4,
    "HY" = 5,
    "LNG" = 6,
    "LPG" = 7
  ),
  selected = 1
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
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      leafletOutput("map")
    )
  )
)

# Bar chart page
page_three <- tabPanel(
  # Tab name
  "Bar Chart",
  titlePanel("Breakdown of Fuel Types by State"),
  sidebarLayout(
    sidebarPanel(
      # Widgets
      bar_widget_1,
      bar_widget_2
    ),
    mainPanel(
      plotlyOutput("bar")
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
   page_two#,
  # page_three,
  #page_four
))
