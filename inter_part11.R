#####################
# row numbers       #
# and               #
# date manipulation #
##################### 

# adding a row number - useful for calculating times between things
# or identifying things like referral time to second contact etc

data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')) |>
  arrange(org_code,
          type,
          period) |>
  mutate(row_number = row_number())

# row number per org_code
data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')) |>
  arrange(org_code,
          type,
          period) |>
  mutate(row_number = row_number(),
         .by = c(org_code, type))

# row number per date (dense rank)
data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')) |>
  arrange(period) |>
  mutate(row_number = dense_rank(period))

# row number per date (dense rank) but in reverse order
# normally would put a '-' in front of the variable to rank by and it would
# rank its inverse which would work just fine
# however you can't inverse a date. Therefore have reordered them and then 
# converted the rank into an absolute value
# (horrible but it works) 
# (this was an answer to a student question and so left it here)
data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')) |>
  mutate(row_number = abs(desc(dense_rank(period))))

# row number per date - jump missing (rank)
data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD')) |>
  arrange(period) |>
  mutate(row_number = min_rank(period))

# now lets remove 2018 and check the row numbers still work on the new dataset

data_row <- data |>
  filter(org_code %in% c('RQM',
                         'RJ1', 
                         'RDD'),
         !between (period,  # note the ! in front for the between to convert it 
                   # into a not between
                   as.Date('2018-01-01') , 
                   as.Date('2018-12-31'))
  ) |>  
  arrange(org_code,
          type,
          period) |>
  mutate(row_num = row_number(),
         .by = org_code, type)

# the ! is awesome - for example could add it in front of the org code 
# to filter everything except for those org codes
