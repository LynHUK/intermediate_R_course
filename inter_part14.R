#####################
# intro to  factors #
#####################

# a quick note on factors
# factors are a datatype that converts a character into a ordinal datatype
# think low medium and high

data <- ae_attendances


data <- data |>
  mutate(
    attendance_grouping = case_when(
      attendances < 5000 ~ 'Less than 5,000',
      attendances < 10000 ~ '5,000 to 9,999',
      attendances < 15000 ~ '10,000 to 14,999',
      attendances < 20000 ~ '15,000 to 19,999',
      attendances < 25000 ~ '20,000 to 24,999',
      attendances >= 25000 ~ '25,000 and over',
      .default = 'ERROR - does not compute'
    )
  )

# lets have a look at our attendance groupings
data_fact <- data |>
  filter (period == '2016-04-01',
          type == '1') |>
  arrange (attendance_grouping)


# lets do a super quick plot
data_fact |> 
  ggplot(aes(x = attendance_grouping)) +
  geom_bar()

# lets change our character data type to a factor data type
# we can then make it ordinal
data_fact <- data_fact |>
  mutate(attendance_grouping = factor(
    attendance_grouping,
    levels = c(
      "Less than 5,000",
      "5,000 to 9,999",
      "10,000 to 14,999",
      "15,000 to 19,999",
      "20,000 to 24,999",
      "25,000 and over")
  )
  )

# lets do our plot again
data_fact |> 
  ggplot(aes(x = attendance_grouping)) +
  geom_bar()

# also if we look at our dataframe again, we can sort it by that factor too

# this can be really useful to show groupings of providers by systems etc
# we can also reorder factors based on a different variable, for instance you 
# may want to order your providers by number of attendances or highest 
# performance

# there are further funky things with factors, but will have to skim over.
# just to say you can re order your factors for build your factors on other 
# variables.

# WARNING - if you set your data as factors, R will not like you adding data 
# into that column if is not one of the factors you have created.
# There are ways of doing this but don't have time now to go into detail
# It is also possible to make factors more dynamically - again no time

#########################
# intro to dynamic text #
#########################

# A quick note on combining text and variables - useful for writing commentary 
# or dynamic labels

# Say we want to create a sentence that says 
# 'The maximum number of attendances was 20000' (or whatever it is)

# we can create join a string together with the paste0 command 

text <- paste0('The maximum number of attendances was ', 
               max(data$attendances))

# you can make longer strings and switch between text and non text with commas

text <- paste0('The maximum number of attendances was ', 
               max(data$attendances), 
               ' and the lowest was ', 
               min(data$attendances))

# the glue library has functions that are easier to use than paste
library (glue)

max_attend <- max(data$attendances)
min_attend <- min(data$attendances)

glue('The maximum number of attendances was {max_attend} and the lowest was {min_attend}')
# this does the same with with considerably fewer brackets and commas
