library(tidyverse)
library(NHSRdatasets)

################################
# Some useful base R functions #
################################

# make a dataframe
data <- ae_attendances
# see summary statistics of a dataframe
# summary is a super function that also can give great summaries of other
# objects - such as linear models 
summary(data)

# quick counts by a column
table (data$type)

# or by 2 columns
table (data$type, 
       data$org_code)

# can do 3 columns but it starts to get silly how that is displayed

####################
# renaming columns #
####################

# dealing with spaces in variables (looking at you excel!)
# or if you want to rename a variable to a readable format for table

# lets rename our 'org_code' to 'Organisation Code'
# use back ticks to enclose a variable with with a space in it
# kind of the equivalent to square brackets in sql

data <- data |>
  rename(`Organisation Code` = org_code)

# lets also rename some more variables to something horrible
data <- data |>
  rename(Breaches = breaches,
         PERIOD = period,
         ` type` = type)

# we now have the look of a typically badly named table
# we could clean all those names manually
# or we could call in a janitor to use a function to do this for us

library(janitor)
# if this is not installed, install it manually

data <- clean_names(data)

#check the data frame 
view(data)

# phew! all better.

