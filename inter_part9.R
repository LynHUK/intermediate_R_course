
# say we wanted to do that on all our numeric data
# the awesome across function allows us to do pretty fancy stuff

data_tot_perc <- data |>
  mutate (across(where(is.numeric),
                 ~(. / sum(.)) * 100,
                 .names = "perc_{.col}"),
          .by = c(org_code, period))

# across also uses tidy select functions
data_tot_perc <- data |>
  mutate (across(contains('es'),
                 ~(. / sum(.)) * 100,
                 .names = "perc_{.col}"),
          .by = c(org_code, period))

# this may be a little too advanced for now, but do come back to it!

#######################
# row wise operations #
#######################

# we are now going to do a rowwise operation to find the maximum of our 
# attendances, admissions and our newly created column
# in essence rowwise treats each each row as its own group
data <- data |>
  rowwise() |>
  mutate(max_col = max(attendances,
                       admissions, 
                       breaches,
                       na.rm = TRUE)) |>
  ungroup()

# note that rowwise is a grouping function and needs to be ungrouped

##########################
# pivot wider and longer #
##########################

# pivoting data to longer or wider formats

# often we want long data for charts and wide data for tables and often have to
# convert from one to another

# lets go wide, lets look at a handful of sites and attendances and pivot wider 
# on date

# ie convert

#  org   period  attendances
#  abd   jan     100
#  abd   feb     200
#  abd   mar     300

# to

# org   jan   feb   mar
# abd   100   200   300

# lets start with filtering our data and selecting only a few columns


data_wide <- data |>
  filter(org_code == 'RQM',
         type == '1',
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances)

# have quick look at your data and see what shape it is in

# lets pivot
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = attendances)
