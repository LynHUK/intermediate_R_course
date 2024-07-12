# base R if statement - allows us to do what I call a one-sided if statement
# really useful if you want to trigger a conditional process

# curly brackets denote a 'scope' - a scope being a piece of code that may
# not necessarily be evaluated and does not always affect the global environment

a <- 5

if (a == 5)  {
  a <- 10
  print ('a is now 10')
  b <- a
  print('b has been created as a variable and is now a')
} 


# this is really powerful as works by if condition in brackets is met
# to do ALL of what is in the brackets
# the 'scope' of the if statement is global

a <- 5

if (a == 5)  {
  a <- 10
  print ('a is now 10')
  c <- a
  print('c has been created as a variable and is now a')
} else {
  print('a is ', a)
  print('c does not exist')
}


#####################
# group and mutate  #
# to make sub total #
#####################

# grouping and mutating rather than summarising
# calc total and percentages by month and org

# lets create a total number of attendances across all types by org and month

data_tot_perc <- data |>
  mutate (total_attend = sum(attendances),
          perc_attend = (attendances / total_attend) * 100,
          .by = c(org_code, period)) 
