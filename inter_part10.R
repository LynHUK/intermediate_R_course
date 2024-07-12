# lets do a complex version
data_wide <- data |>
  filter(org_code == 'RF4',
         #type == '1',                     # have not removed the type this time
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances,
          type)                            # have included type back in 

# look at the data

# lets pivot
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = attendances)

# lets do a complex version with more sites
data_wide <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RF4'), 
         # type == '1',                    # have not removed the type
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances,
          type)                            # have included type back in 

# look at the data

# lets pivot
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = attendances)

# lets do a complex version with breaches as well - another period dependent 
# variable
data_wide <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RF4'), 
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances,
          breaches,                      # have breaches type back in 
          type)                           

# look at the data

# lets pivot 
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = attendances)

# yuck not what we want - reset the data and lets try again
data_wide <- data |>
  filter(org_code %in% c('RQM','RJ1', 'RF4'), 
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances,
          breaches,                      # have breaches type back in 
          type)                           

# lets pivot 
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = c(attendances, 
                              breaches))

# r has given us automatically generated column names
# (there are options to change how that is handled, but not going to go into 
# that now)

# lets make our wide data long

# start with a basic wide dataset again

data_wide <- data |>
  filter(org_code == 'RQM',
         type == '1',
         period >= '2018-08-01') |>
  select (org_code,
          period,
          attendances)

# lets pivot
data_wide <- data_wide |>
  pivot_wider(names_from = period,
              values_from = attendances)

# and make it long
data_long <- data_wide |>
  pivot_longer(cols = where(is.numeric),
               names_to = 'period',
               values_to = 'attendances')

# not going to lie, pivoting wide data to long is harder and requires much more
# wrangling, however the principle is the same and so going to move on 

#####################
# rolling functions #
#####################

# lets just do some other bits of wrangling
# say we wanted a 6 month rolling mean of attendances by each of the sites in
# our data...

library(zoo)

# zoo has a lovely function for rolling windows

data <- ae_attendances

data_roll <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')
  ) |>
  arrange(org_code,
          type,
          period) |>
  mutate(rolling = rollapply(attendances,
                             6,
                             mean,
                             align = 'right',
                             fill = NA),
         .by = c(org_code,
                 type))
