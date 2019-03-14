# ui.R

############################## Set up ##########################################

# Load Libraries
library("shiny")
library("plotly")
library("leaflet")
library("lintr")
library("styler")

# Load data
fuel <- read.csv("alt_fuel_data.csv", stringsAsFactors = FALSE)

# Fuel Types
fuel_types <- list(
  "Biodiesel (BD)" = "BD",
  "Compressed Natural Gas (CNG)" = "CNG",
  "Ethanol (E85)" = "E85",
  "Electric Charging (ELEC)" = "ELEC",
  "Hydrogen (HY)" = "HY",
  "Liquefied Natural Gas (LNG)" = "LNG",
  "Propane (LPG)" = "LPG"
)

# State names
state_names <- list(
  "All States",
  "Alabama (AL)" = "AL", "Alaska (AK)" = "AK", "Arizona (AZ)" = "AZ",
  "Arkansas (AR)" = "AR", "California (CA)" = "CA", "Colorado (CO)" = "CO",
  "Connecticut (CT)" = "CT", "Delaware (DE)" = "DE", "Florida (FL)" = "FL",
  "Georgia (GA)" = "GA", "Hawaii (HI)" = "HI", "Idaho (ID)" = "ID",
  "Illinois (IL)" = "IL", "Indiana (IN)" = "IN", "Iowa (IA)" = "IA",
  "Kansas (KS)" = "KS", "Kentucky (KY)" = "KY", "Louisiana (LA)" = "LA",
  "Maine (ME)" = "ME", "Maryland (MD)" = "MD", "Massachusetts (MA)" = "MA",
  "Michigan (MI)" = "MI", "Minnesota (MN)" = "MN", "Mississippi (MS)" = "MS",
  "Missouri (MO)" = "MO", "Montana (MT)" = "MT", "Nebraska (NE)" = "NE",
  "Nevada (NV)" = "NV", "New Hampshire (NH)" = "NH", "New Jersey (NJ)" = "NJ",
  "New Mexico (NM)" = "NM", "New York (NY)" = "NY",
  "North Carolina (NC)" = "NC", "North Dakota (ND)" = "ND",
  "Ohio (OH)" = "OH", "Oklahoma (OK)" = "OK", "Oregon (OR)" = "OR",
  "Pennsylvania (PA)" = "PA", "Rhode Island (RI)" = "RI",
  "South Carolina (SC)" = "SC", "South Dakota (SD)" = "SD",
  "Tennessee (TN)" = "TN", "Texas (TX)" = "TX", "Utah (UT)" = "UT",
  "Vermont (VT)" = "VT", "Virginia (VA)" = "VA", "Washington (WA)" = "WA",
  "West Virginia (WV)" = "WV", "Wisonson (WI)" = "WI", "Wyoming (WY)" = "WY",
  "American Samoa", "District of Columbia (DC)" = "DC", "Puerto Rico"
)

################################# Widgets ######################################

# First dropdown state menu
bar_widget_1 <- selectInput(
  "select_state",
  label = "Select First State",
  choices = state_names[-1],
  selected = "AR"
)

# Second dropdown state menu
bar_widget_2 <- selectInput(
  "select_state_two",
  label = "Select Second State",
  choices = state_names[-1],
  selected = "MS"
)

# Drop down menu that allows user to select a fuel type
dropdown_fuel_type <- selectInput(
  inputId = "fuel_type_line",
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

# Dropdown for States/locations
dropdown_line_graph <- selectInput(
  "line_dropdown",
  label = "Select State",
  choices = state_names,
  selected = "All States"
)

# Checkbox that lets users select what fuel to see
map_widget <- checkboxGroupInput(
  inputId = "fuel_type_map",
  label = "Fuel Type",
  choices = fuel_types,
  selected = "HY"
)

################################# UI ###########################################

# Overview Page
page_one <- tabPanel(
  "Overview",
  titlePanel(
    "Alternative Fuel Stations - About our Project"
  ),
  includeMarkdown("README.md"),
  includeCSS("style.css")
)

# Map page
page_two <- tabPanel(
  "Locations of Stations",
  titlePanel(
    "Alternative Fuel Station Locations"
  ),
  # Description of Analysis Importance
  p("One way to conceptualize the demand for alternative fuel is by visualizing
    the popularity of different fuel types in different regions of the country."),
  h4(strong("Select alternative fuel types of interest to view their locations
     throughout the United States.")),
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
  "Compare Two States", # Tab Name
  titlePanel("Breakdown of Fuel Types for Two States"),
  # Description of Analysis Importance
  p("There are various types of fuel stations throughout the United States
    that consumers can choose from. As the amount of stations within each
    state varies, so does the amount of each fuel type. "),
  h4(strong("Choose two states to analyze using the dropdown menus")),
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
      width = 3,
      # Widgets
      bar_widget_1,
      bar_widget_2,
      # Legend
      p(strong("BD = Biodiesel")),
      p(strong("CNG = Compressed Natural Gas")),
      p(strong("E85 = Ethanol")),
      p(strong("ELEC = Electric Charging")),
      p(strong("HY = Hydrogen")),
      p(strong("LNG = Liquefied Natural Gas")),
      p(strong("LPG = Propane"))
    ),
    mainPanel(
      fluidRow(
        splitLayout(
          cellWidths = c("50%", "50%"), # Two charts side-by-side
          cellArgs = list(style = "padding: 15px"),
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
  "Growth and Trends",
  titlePanel("Alternate Fuel Growth"),
  # Description of line graph"
  p("Some forms of alternate fuel are more popular than others. This page allows
    people and/or businesses to compare how popular the various forms of
    alternate fuel are by presenting the number of stations opened each year
    for a specified fuel type and state."),
  h4(strong(
    "Choose a Fuel Type and State to Analyze Using the Dropdown Menus"
  )),
  p("By looking at the number of stations opened year by year, people can
    easily visualize the trend that a fuel type is undergoing."),
  h1(), # Creating space between text and widgets/graphs
  h1(), # Creating space between text and widgets/graphs
  # Start of data
  sidebarLayout(
    sidebarPanel(
      # Widgets
      dropdown_fuel_type,
      slider_year_timeline,
      dropdown_line_graph
    ),
    mainPanel(
      plotlyOutput(outputId = "line")
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
