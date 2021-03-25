
 

# Load packages -----------------------------------------------------------

library(tidyverse)          # Load the tidyverse package

# Read data ---------------------------------------------------------------


table1 <- read_fwf("Data/Nat2018PublicUS.c20190509.r20190717.txt",
         col_positions = fwf_cols(year = c(9,12), 
                                  month = c(13,14),
                                  day = c(23),
                                  age = c(75,76),
                                  race = c(107),
                                  place = c(32),
                                  mstatus = c(120),
                                  meduc = c(124),
                                  feduc = c(163)
                                  
                                 
                                   ))

table1  # print table1 (table containig all data that will be  explored in the data analysis)
 

# Clean the data ----------------------------------------------------------

daysofweek <- as_factor(c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
 
daysofweek       # print days of the week
 
races <- as_factor(c("White (only)", "Black (only)", "AIAN (only)", "Asian (only)", "NHOPI", "More than one race"))

races  # print the different races

maritalstatus <- as_factor(c("Married", "Unmarried"))

maritalstatus      # print marital status

birthplace <- as_factor(c("Hospital", "Free standing birth center", "Home (intended)", "Home,unintended0", "home (unknown if intended or unintended", "clinic/doctor's office", "Other","Unknown"))

birthplace      # print birth place

educationlevel <- as_factor(c("8th grade or less", "9th through 12th grade with no diploma", "High School diploma", "Some college credit, no degree", "Associate degree", "Bachelor'sdegree", "Master's degree (MA, MEng, MSW, MBA)", "Doctorate (PhD, EdD) or Professional degree (MD, DDS, DVM, LLB, JD)", "Unknown"))

educationlevel     # print education level

birthmonth <- as_factor(c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

birthmonth

main_table <- mutate(
  table1, 
  year = as.integer(year) , 
  month = as.integer(month),
  day = daysofweek[day],
  race = races[race],
  mstatus = maritalstatus[mstatus],
  place = birthplace[place],
  meduc = educationlevel[meduc],
  feduc = educationlevel[feduc],
  month = birthmonth[month]
) 
 
main_table

# Histogram  showing the age distribution

fig1 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = age, fill = "#C5351B"))
          
          
fig1 + labs(title = "Distribution of Mother's Age",
          x = "Age of Mother",
          y = "Frequency (Number of People)",
          caption = "(based on data from the CDC's National Center for Health Statistics)"
          ) 


# Histogram showing the racial distribution

fig2 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = race, fill = "#C5351B"))

fig2 + labs(title = "Distribution of Mother's Race", 
            x = "Race of Mother",
            y = "Frequency (Number of People)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
            )

# Histogram showing the marital status distribution of mothers

fig3 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = mstatus, fill = "#C5351B"))

fig3 + labs(tite = "Marital Status of Mother",
            x = "Marital Status",
            y= "Frequenct (Number of people)",
            caption  = "(based on data from the CDC's National Center for Health Statistics")








  