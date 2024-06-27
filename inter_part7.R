################
# conditionals #
################

# basic two part conditional - if_else

# lets flag all instances where attendances were above 20,000
# a simple if_else statement if condition, do this else do that
data <- data |>
  mutate(above_20000 = if_else (attendances >= 20000, 
                                'Y',
                                'N'))

# NOTE data types and outputs for two conditions need to be the same
data <- data |>
  mutate(above_20000 = if_else (attendances >= 20000, 
                                100,
                                "9999"))

# will throw a wobble

# if_else is great for a single conditional - you can nest if_else statements
# but that gets really messy quickly, especially with the amount of brackets at
# the end

# multi part conditional - or case statement

# lets create a grouping column for our attendances in 5000s

data <- data |>
  mutate(
    attendance_grouping = case_when(
      attendances < 5000 ~ 'Less than 5,000',
      attendances < 10000 ~ '5,000 to 9,999',
      attendances < 15000 ~ '10,000 to 14,999',
      attendances < 20000 ~ '15,000 to 19,999',
      attendances < 25000 ~ '20,000 to 24,999',
      .default =  'Over 25,0000'
    )
  )

# the .default gives the default or 'else' statement
# the '~' is called a tilde and can be found as shift # next to the return key

# there is also an old skool way of doing this 
data <- data |>
  mutate(
    attendance_grouping = case_when(
      attendances < 5000 ~ 'Less than 5,000',
      attendances < 10000 ~ '5,000 to 9,999',
      attendances < 15000 ~ '10,000 to 14,999',
      attendances < 20000 ~ '15,000 to 19,999',
      attendances < 25000 ~ '20,000 to 24,999',
      TRUE ~ 'Over 25,0000'
    )
  )

# note the 'true' is the else statement and you use a tilde rather than equals
# both work the same, the .default is the more modern method


# however lets make a deliberate issue

# for example this case statement fails if we have a value of exactly 25,000
# well not fail, just puts something in the wrong category
data$attendances[1] <- 25000

# now rerun the above case statement

# Lets also add some null data 
data$attendances[1] <- NA

# again the case statement 'works' but is incorrect

# personally I find it best to use the true statement as an error catch 

data <- data |>
  mutate(
    attendance_grouping = case_when(
      attendances < 5000 ~ 'Less than 5,000',
      attendances < 10000 ~ '5,000 to 9,999',
      attendances < 15000 ~ '10,000 to 14,999',
      attendances < 20000 ~ '15,000 to 19,999',
      attendances < 25000 ~ '20,000 to 24,999',
      attendances > 25000 ~ 'Over 25,0000',
      .default = 'ERROR - does not compute'
    )
  )

# we can fix this by adding a >= and changing our grouping
# description to '25,000 and over'

# <<< Over to you >>>>

# add a column that if type 1 halves the attendances
#                   if type 2 triples the attendances
#                   if type other quads the attendances
#                   if error a suitable error






# HINT - for your returns ensure they are all of the same data type






data <- data |>
  mutate(attendtance_multliper = case_when(type == '1' ~ attendances * 0.5,
                                           type == '2' ~ attendances * 3,
                                           type == 'other' ~ attendances * 4,
                                           .default = -9999))
