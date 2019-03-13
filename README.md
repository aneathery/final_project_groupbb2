# Project Members - Amber, Karen, Manbir, & Patrick

&nbsp; Our Informatics project utilizes a dataset containing various information related to Alternative Fueling Stations in the US from the 1970s to 2019. Each entry in the dataset offers valuable insights on the location of the Fueling Station, the contact information, access days, year opened, potential governmental affliation, and more. This dataset was collected and published by the U.S. Department of Energy and can be accessed on their [government website here](https://afdc.energy.gov/data_download). It is frequently updated as more and more Fueling Stations pop up due to the popularity of alternative/hybrid vehicles increasing. The environmental and economic concerns of the future also makes alternative cars a vital innovation to learn more about, but the primary purpose of our project was to see rising trends in alternative fueling stations across the US so that manfucturers, car dealers, or other businesses could gauge whether or not it makes sense to continue investing in alternative fuel based vehicles.

## Analysis

&nbsp; After briefly examining the dataset intially, we found ourselves thinking of the many ways propspective--or current manufacturers--of alternative fuel vehicles could benefit from the insights gained from a dataset analysis. We sought to find whether or not alternative fuel stations are prevelant throughout every state in the US--though our main priority was to see the prevelance of stations around major metropolitian areas. And we did, infact, see that certain alternative fuel stations like the Electric Charging stations were found in every state around a major city. 

&nbsp; We also wanted to see how many of a particular fuel station were available in one state compared to another. This led us to find that Electric Charging stations were the most common and states with higher populations tended to have more such stations, as is to be expected. Additionally, we found a general positive trend in the market with more and more fueling stations popping up as the years went on for all types of fueling stations. 

&nbsp; Due to the sheer breadth of the dataset and the many variables involved, we invite you to experiment with the visualizations and see the results for yourself! You will find insights on questions such as:

-	Where are different alternative fueling stations currently located?
-	How many alternative fuel stations are in each state (with a breakdown by *type*)?
-	How does a given state fare against another when it comes to alternative fuel station availability?
-	Which types of alternative fuel are the most popular?
-	How many stations are being opened each year?
- 	And more!

&nbsp; Because this is a topic that is only increasing in popularity you can formulate some of your own questions and find that they, too, can be answered via these visualizations!


## Visualizations

In this app, you can find three different interactive visualizations of the dataset:

1. A map plotting the location of Alternative Fueling Stations in the US, which gives the user the ability to select which types of Alternative Fueling Stations they would like to see.
2. A compartive bar chart showing the kinds of Alternative Fuel Stations available, where the user has the ability to select two states to compare.
3. A line graph showing the number of Alternative Fuel Stations opened, where the user has the ability to select a time period to see.

These visualizations were done using R and utilized libraries such as plotly, leaflet, ggplot, dplyr, and Shiny.
