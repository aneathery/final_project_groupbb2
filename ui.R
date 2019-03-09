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
# Making the UI cleaner by putting code into variables
bar_widget_1 <- selectInput(
  "select_state",
  label = "Select State",
  choices = fuel$State,
  selected = "WA"
)

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

# Start of UI
ui <- navbarPage(
  "Analyzing Alternative Fuel Types",
  tabPanel(
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
  ),
  # End of Page 1
  
  # Start of Page 2
  tabPanel(
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
  ),
  
  # Start of Page 3
  tabPanel(
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
  ),
  
  # Start of Page 4
  tabPanel(
    "Line Graph",
    titlePanel("Edit this"),
    sidebarLayout(
      sidebarPanel(
      ),
      mainPanel(
        plotOutput("hist")
      )
    )
  )
)