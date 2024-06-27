
# if you want to join columns of different sizes you are 
# probably better off using the join family of functions

# Combining rows that exist in both tables and dropping duplicates 

# going to rename breaches to admissions to create some duplicates
df_one <- data |>
  select (org_code,
          admissions = breaches)

df_two <- data |>
  select (org_code,
          admissions) 

df_new_union <- union(df_one, 
                      df_two)

# Finding identical columns in both tables 
df_new_intersect <- intersect(df_one, 
                              df_two)

# Finding rows that don’t exist in another table 
df_new_diff <- setdiff(df_one, 
                       df_two)

###################
# Count functions #
###################

# lets do some more dpylr

# lets do a tidy version of 'table'
# this is useful if we want that kind of summary at the end
# of a longer pipe of  stuff
data_count <- data |>
  count(type)

# this could be the same as
data_count <- data |>
  summarise (count = n(),
             .by = type)

# creates a new column like a mutate with a count by feature
# eg how many times an org_code has submitted
data_count <- data |>
  add_count(org_code)

# is the same as
data_count <- data |>
  mutate (count = n(),
          .by = type)


###################
# fancy filtering #
###################

# filters data to org codes that contain a 'R' at any point
data_filter <- data |>
  filter(str_detect(org_code, "R"))

# filters data to latest date period per org code 
# (such an awesome feature to put a group by in a filter!)
data_filter <- data |>
  filter(period == max(period), 
         .by = org_code)

# filters data to type 1 AND 'attendances over 10,000
data_filter <- data |>
  filter(type == '1', 
         attendances > 10000)

# filters data to type 1 OR 'attendances over 10,000
data_filter <- data |>
  filter(type == '1' | 
           attendances > 10000)

# <<< Over to you >>>>

# can you write a script to check if we have one row per org_code
# if we have not, return only those where we have more than one row?
# and for bonus points put them in order by number of rows?






# HINT - you can count on the fact we have already covered how to do this
# and maybe look at what else the function can do (?count)






data_filter <- data |>
  count(org_code,
        sort = TRUE) |>
  filter (n > 1)

