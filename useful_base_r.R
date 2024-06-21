library(tidyverse)
library(NHSRdatasets)

################################
# Some useful base R functions #
################################

# make a dataframe
data <- ae_attendances

# get list of column names
colnames(data)      # works on matrices and data frames
names(data)         # works on vectors and data frames

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

## Some useful functions from the dplyr package

# see the first 15 rows of data 
dplyr::slice_head(data, 
      n = 15)

# see the first 15% of total rows of data 
# (defaults to last variable to order by)
slice_head(data,
           prop = .15)

# see the first 15% of total rows of data - but using dpylr
# ordered by attendances
slice_head(data, 
         prop = .15, 
         order_by = attendances)









