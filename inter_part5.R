library(dplyr)
# ensure we are using a clean data frame
data <- NHSRdatasets::ae_attendances

df_one <- data |>
  select (period,
          org_code,
          type,
          attendances) |>
  head()

df_two <- data |>
  select (where(is.numeric)) |>
  head()

# connect the two data frames together, side by side
# column bind

df_new <- cbind(df_one,
                df_two)

# note "attendances" column is duplicated - which can cause issues - best to remove
# or rename - also maintains order - need to be mindful you have rows that line 
# up


# we can also bind data frames by rows, this is similar to concatenation 
# in sql, need matching columns
df_one <- data |>
  head()

df_two <- data |>
  tail()

df_new <- rbind(df_one,
                df_two)

# if we dont have matching columns can use bind_rows
# which matches columns where they match and puts in na for where data does not 
# match

df_one <- data |>
  select (period,
          org_code,
          type,
          attendances) |>
  head()

df_two <- data |>
  tail()

df_new <- bind_rows(df_one,
                    df_two)

# or in a pipe

df_new <- df_one |>
  bind_rows(df_two)

