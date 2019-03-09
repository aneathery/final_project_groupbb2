# final-project

# This is the file that both drives the structure of the user interface and
# provides instructions to the R server.

############################## Set up #######################################

# Loading in the necessary packages to complete the assignment
library("dplyr")
library("shiny")
library("ggplot2")
library("rsconnect")
library("plotly")

fuel <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

############################### UI Section ##################################


ui <- navbarPage(
  "Analyzing Alternative Fuel Types",
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
  # End of Page 1
  
  # Start of Page 2
  tabPanel(
    "Bar Chart",
    titlePanel(
      "Breakdown of Fuel Types by State"
    ),
    sidebarLayout(
      sidebarPanel(
        # Widget 1 for page 1
        checkboxGroupInput(
          "checkGroup", 
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
            selected = 1)
    ),
      mainPanel(
        plotOutput("plot")
      )
    )
  ),
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