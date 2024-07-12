############################################
# SPC - statistical process control graphs #
############################################

# Plot the dots - SPC charts
library(NHSRplotthedots)

data_spc <- data |>
  filter(org_code == 'RVR',
         type == '1')

data_spc |>
  ptd_spc(value_field = attendances,
          date_field = period)

# <<< Over to you >>>>

#  add in a target of 17500
#  we actually want to show improvement as a reduction






data_spc |>
  ptd_spc(value_field = attendances,
          date_field = period,
          target = 17500,
          improvement_direction = 'decrease')
# <<<<< end of question  >>>>>> 
#########################

# we now want to create a chart for each attendance type
data_spc <- data |>
  filter(org_code == 'RVR')

# simply add a facet field
data_spc |>
  ptd_spc(value_field = attendances,
          date_field = period,
          improvement_direction = 'decrease',
          facet_field = type)

# not bad but looks a bit clumpy and we need to tweak a few things to make this 
# a pretty ggplot 

# turn our ptd_spc into an object
plot_spc <- data_spc |>
  ptd_spc(value_field = attendances,
          date_field = period,
          improvement_direction = 'decrease',
          facet_field = type)

# feed that object into ptd_create_ggplot

plot_spc |> 
  ptd_create_ggplot(fixed_y_axis_multiple = FALSE,
                    x_axis_date_format = "%b %y",
                    x_axis_breaks = "2 months")
