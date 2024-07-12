#####################
# grouping by dates #
#####################

# grouping our data by year and getting totals
data_year <- data |>
  filter(org_code == 'RQM',
         type == '1') |>
  group_by(year_total = floor_date(period,       # note calling a new name to 
                                   # the grouped variable
                                   'year')) |>
  summarise (total_attendances = sum(attendances),
             total_breaches = sum(breaches),
             median_admissions = median(admissions, 
                                        na.rm = TRUE))

# calculating a financial year
data_finance <- data |>
  filter(org_code == 'RQM',
         type == '1') |>
  mutate(finance_year = ifelse(month(period) >= 4, 
                               year(period) + 1, 
                               year(period)))