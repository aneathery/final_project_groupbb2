# final-project

# This is the file that both drives the structure of the user interface.

############################## Set up #######################################

# Loading in the necessary packages to complete the assignment
library("dplyr")
library("shiny")
library("ggplot2")
library("rsconnect")
library("plotly")

fuel <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

################################## UI ########################################
# Dropdown menu for selecting states
bar_widget_1 <- selectInput(
  "select_state",
  label = "Select State",
  choices = fuel$State,
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

# Overview Page
page_one <- tabPanel(
  "Overview",
  titlePanel(
    "Edit this"
  ),
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Map page
page_two <- tabPanel(
  "Map",
  titlePanel(
    "Edit this"
  ),
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Bar chart page
page_three <- tabPanel(
  "Bar Chart", # Tab Name
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

year_range <- range()

# Line graph page
page_four <- tabPanel(
  "Line Graph",
  titlePanel("Alternate Fuel Growth"),
  sidebarLayout(
    sidebarPanel(
      
      # Drop down menu that allows user to select a fuel type
      selectInput(
        inputId = "fuel_type",
        label = "Fuel Type",
        choices = unique(fuel$Fuel.Type.Code)
      ),
      selected = "ELEC"
      
      # Slider that lets the user pick the range of population density
      #sliderInput(
      #  "years",
      #  label = "Timeline",
      #  min = 1980,
      #  max = 2018,
      #  value = 
      #)
      
    ),
    mainPanel(
      plotOutput(outputId = "line")
    )
  )
)
  
# Start of UI
shinyUI(navbarPage(
  "Analyzing Alternative Fuel Types",
  page_one,
  page_two,
  page_three,
  page_four
))