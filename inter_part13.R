######################
# cutting up strings #
# and                #
# parsing numbers    #
######################

# lets see if we can extract some more info from our data

# our org_code contains numbers and letters  
# what if we want to pull out just the numbers from those org_codes?

data_org_code_numbers <- data |>
  mutate(org_code_number = parse_number(as.character(org_code), 
                                        na = c("NA", 
                                               "Nothing")))

# this does throw up a warning as a number of org_codes do not have numbers in 
# them it also is a little messy, but gives and idea of what can be done

# maybe we want to filter our data to any org code that contains a 'R' or a 'P' 
# anywhere

data_filt <- data |>
  filter (str_detect (org_code,'R') |      # note the use of | to denote 'or'
            str_detect (org_code,'P'))

# <<< Over to you >>>>

# what organisations code have a number in them over 50?
# can you return a dataframe with just the org_codes of those with a number over
# 50






data_org_code_numbers <- data |> 
  mutate(org_code_number = parse_number(as.character(org_code), 
                                        na = c("NA", 
                                               "Nothing"))) |>
  filter(org_code_number > 50)

#########################

# sometimes we want to shorten strings 
# we can do this by words or characters

example <- 'This is an example of a long sentence that I would like to shorten as it is far too long'

# by characters

substr(example, start = 1, stop = 15) 

# by words 

word(example, start = 1, end = 4, sep = fixed(' ')) # note uses end and not stop

# removing words 
# useful for handling really long hospital names

################################
# make hospital names readable #
################################

long_hospital_name <- 'Boggins University HosPital NHS Trust'

# lets change this to 'Boggins HosPital'

library(tm)
# tm is a text mining library but has some nice text features

short_hospital_name <- removeWords(long_hospital_name, 
                                   c('University', 
                                     'NHS', 
                                     'Trust'))

short_hospital_name

# close but now we have odd spaces between our words and at the end

# nice little function call string squish

short_hospital_name <- str_squish(short_hospital_name)

short_hospital_name

# all of this will also work within a dataframe