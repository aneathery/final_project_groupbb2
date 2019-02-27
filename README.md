# Project Proposal - Group BB2

## Project Description

### What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.

Our dataset is a csv that contains the locations and information about alternative fuel stations throughout the United States. This dataset was accessed from the [U.S. Department of Energy website](https://afdc.energy.gov/data_download), meaning this department collected the data.

### Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should hone in on one of these audiences.

The target audience is prospective or current manufacturers of alternative fuel vehicles. Ideally, they would be looking for positive trends in the market as they would help them identify whether or not to invest more in alternative fuel vehicles. Particularly, they would be interested in seeing whether more and more stations are popping up as Hybrid vehicles gain popularity as well as whether or not stations exist in most parts of the US. Other possible variables of interest include station access times, station cards accepts, and whether or not a station is open for public use.

### What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.
Our audience may want to learn many things from our data. For example:
-	Where are different alternative-fueling stations currently located?
- How many alternative fuel stations are in each state?
-	How many stations are being opened each year?
- Which types of alternative fuel are the most popular?
-	Whether they are public or private stations


## Technical Description

### How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?
We will be reading in a static CSV file.

### What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?
We may need to format date columns in order to partition by year. We also plan on mapping the fuel type codes of alternative fuel stations to the name of the fuel type. Thankfully, the data includes both an address and lat/long coordinates, so we will not have to convert addresses to lat/long.

### What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)
As of right now, we do not plan on using any major or new libraries in this project.

### What major challenges do you anticipate?
We anticipate that parsing or filtering the data will be one of the most difficult challenges. For example, filtering stations only by year. Furthermore, we don’t fully understand what some of the columns mean. We will need to do some research/googling to determine what some of the data indicates. Additionally, some items are empty. Also, thinking of the most effective data visualizations to communicate our findings may be challenging. 
