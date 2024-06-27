####################################################
# alternative joins - row and column concatenation #
####################################################

# a few more things to join datasets together
# standard joins are covered in the introduction course in some detail

# this is about joining tables without keys

df_one <- data |>
  select (period,
          org_code,
          type,
          attendances) |>
  head()

df_two <- data |>
  select (where(is.numeric)) |>
  head()

# jam the two data frames together, side by side
# column bind

df_new <- cbind(df_one,
                df_two)

# note duplicated column is duplicated - which can cause issues - best to remove
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

df_new <- df_new |>
  bind_rows(df_two)

# <<< Over to you >>>>

# create a dataframe of the top 5 admissions only
# and the bottom 5 attendances only and join the two columns together







df_one <- data |>
  select(admissions) |>
  top_n(5, admissions)

df_two <- data |>
  select(attendances) |>
  top_n(-5, attendances)

df_new <- bind_cols(df_one, 
                    df_two)
