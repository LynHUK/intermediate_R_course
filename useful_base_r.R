#library(tidyverse)
library(NHSRdatasets)

################################
# Some useful base R functions #
################################

# make a dataframe
data <- ae_attendances

# get list of column names
colnames(data)

# using $ sign to select a column
data$type

# get list of unique data items in a variable
unique(data$org_code)


# we can select a specific entry within that vector with square brackets
# to call the 4th entry we can use
data$type[4]

# we could also call the 4th to 10th entries
data$type[4:10]

# note to python users, we start counting at 1 and not zero
# we also include the 10th entry 
#  this is very different to how python does indexing

# get number of distinct entries
n_distinct(data$org_code)

# get the range of a variable (useful for dates)
range(data$period)

# see structure of data to check data types
str(data)

# see the first 5 rows of data
head(data)

# see the last 5 rows of data
tail(data)

# see the first 15 rows of data
head(data, 
     15)

# see the first 15 rows of data - but using dpylr
top_n(data, 
      15)

# see the first 15% of total rows of data - but using dpylr
# (defaults to last variable to order by)
top_frac(data, 
         .15)

# see the first 15% of total rows of data - but using dpylr
# ordered by attendances
top_frac(data, 
         .15, 
         attendances)