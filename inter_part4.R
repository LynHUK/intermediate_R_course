#########################

# ensure we are using a clean data frame
data <- ae_attendances

####################
# select statement #
####################

# The select function in simple terms works like a sql select statement
# we can select columns from our dataframe and in addition they
# will be ordered in the order we select them
data_select <- data |>
  select (period,
          org_code)

view(data_select)

# or

data_select <- data |>
  select (org_code,
          period)

view(data_select)


# we can also do a simple rename at the select stage
data_select <- data |>
  select (date_period = period,
          organisation = org_code)

# can also do a ! or - for negative select
data_select <- data |>
  select (!c(org_code,
             period))

# NOTE - you have to put the multiples into a vector
data_select <- data |>
  select (!org_code,
          !period)
# THIS DOES NOT WORK

data_select <- data |>
  select (-org_code,
          -period)
# this does work

# we can use some additional verbs in our select statement
# select any column name that contains 'es'
data_select <- data |>
  select (contains ('es'))

# select any column name that does not contains 'es'
data_select <- data |>
  select (!contains ('es'))

# select columns where the data is numeric
data_select <- data |>
  select (where(is.numeric))

# select breaches then admissions and then everything else as it is
data_select <- data |>
  select (admissions, 
          breaches, 
          everything())

