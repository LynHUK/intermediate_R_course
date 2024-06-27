### Setting things up

# You'll often want to include a sample of your dataframe rather than the whole thing, particularly if it's very large.

# Ctrl + F7 will open a new source column


library(dplyr)
library(datapasta)

fresh_data <- NHSRdatasets::LOS_model |> dplyr::slice_sample(n = 20) # slice_sample(prop=0.2) will randomly select 20% of rows
 

### Editing the data
# You can edit the resulting tibble, then assign it to an object.
# fresh_edited_data <-
 
fresh_data |> datapasta::dpasta()

 


#Some code you want to use the dataframe in
ggplot2::ggplot(data = fresh_edited_data, aes(x=Organisation, y = Age)) +geom_point()
 

# If you want to get help you could copy & paste the whole of the above chunk.


## Alternative way to create a dataframe from your data if you don't like datapasta.
### dput()

# The dput() function can also be used to produce the code to create your dataframe.
 
fresh_edited_data |> dput()
 


 
other_edited_data <- structure(list(ID = c(55L, 217L, 118L, 183L, 3L, 32L, 212L, 26L, 
25L, 242L, 247L, 264L, 296L, 105L, 53L, 66L, 93L, 158L, 210L, 
249L), Organisation = c("some_other_name", "a_different_name", 
"Trust8", "Trust3", "Trust3", "Trust2", "Trust2", "Trust6", "some_other_name", 
"Trust2", "a_different_name", "Trust4", "Trust6", "some_other_name", 
"Trust3", "Trust6", "Trust3", "Trust8", "Trust10", "Trust9"), 
    Age = c(81L, 14L, 14L, 69L, 93L, 82L, 59L, 49L, 83L, 90L, 
    70L, 79L, 32L, 15L, 14L, 8L, 55L, 50L, 56L, 74L), LOS = c(13L, 
    2L, 2L, 9L, 12L, 2L, 4L, 10L, 7L, 7L, 5L, 5L, 6L, 1L, 18L, 
    1L, 5L, 2L, 7L, 8L), Death = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 
    0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 1L, 1L, 0L, 0L, 0L)), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -20L))
 









### An alternative way to modify your data for sharing 

 
#create a dataframe of organisation names and aliases
Organisation <- unique(NHSRdatasets::LOS_model$Organisation)
length(Organisation) #checks the length of the vector Organisation
alias <- letters[1:10] #if you want to automate this you could use letters[1:length(Organisation)]
df <- data.frame(Organisation, alias) #combines the 2 vectors into a dataframe

# join the dataframe we just created to the LOS_model dataframe, select the columns we want & take a sample 10 rows, before piping it into dput() to create the code we can share.
dplyr::left_join(NHSRdatasets::LOS_model, df) |> select(Age, alias, Death) |> slice_sample(n=10) |> dput()
 


## What else should you include?
# library
# code
# error messages
# what solutions you've already tried

