
 

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
                                  feduc = c(163),
                                  weight = c(509,510)
                                  
                                 
                                   ))

table1  # print table1 (table containig all data that will be  explored in the data analysis)
 

# Clean the data ----------------------------------------------------------

daysofweek <- as_factor(c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
 
daysofweek       # print days of the week
 
races <- as_factor(c("White (only)", "Black (only)", "AIAN (only)", "Asian (only)", "NHOPI", "More than one race"))

races  # print the different races

maritalstatus <- as_factor(c("Married", "Unmarried"))

maritalstatus      # print marital status

birthplace <- as_factor(c("Hospital", "Free standing birth center", "Home (intended)", "Home,unintended0", "Home (unknown)", "clinic/doctor's office", "Other","Unknown"))

birthplace      # print birth place

educationlevel <-
  as_factor(
    c(
      "1st-8th grade",
      "9th-12th grade/no diploma",
      "HS diploma",
      "college credit/no degree",
      "A.degree",
      "Bachelor's degree",
      "Master's degree",
      "Doctorate",
      "Unknown"
    )
  )

educationlevel     # print education level

birthmonth <-
  as_factor(
    c(
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    )
  )

birthmonth # print birth month

weightofchildren <-
  as_factor(
    c(
      "227-449",
      "500-749",
      "750-999",
      "1000-1249",
      "1250,1499",
      "1500,1999",
      "2000-2499",
      "2500-2999",
      "3000-3499",
      "3500-3999",
      "4000-4499",
      "4500-4999",
      "5000-8167",
      "Not Stated"
    )
  )

weightofchildren # print the weight at birth of children

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
  month = birthmonth[month],
  weight = weightofchildren[as.integer(weight)] 
) 
 
main_table # print main table of selected data



# Histogram  showing the age distribution

fig1 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = age), fill = "#C5351B")
          
          
fig1 + labs(title = "Distribution of Mother's Age",
          x = "Age of Mother",
          y = "Frequency (Number of People)",
          caption = "(based on data from the CDC's National Center for Health Statistics)"
          ) 


# Histogram showing the racial distribution

fig2 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = race) , fill = "#C5351B")

fig2 + labs(title = "Distribution of Mother's Race", 
            x = "Race of Mother",
            y = "Frequency (Number of People)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
            ) +  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Histogram showing the marital status distribution of mothers

fig3 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = mstatus) , fill = "#C5351B")


fig3 + labs(tite = "Marital Status of Mother",
            x = "Marital Status",
            y= "Frequency (Number of people)",
            caption  = "(based on data from the CDC's National Center for Health Statistics)"
            ) 

# Histogram showing the distribution of mothers' education level

fig4 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = meduc  ), fill = "#C5351B")

fig4 + labs(title = "Eucation level of Mothers",
            x = "Education level",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
            ) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )
     
# Histogram showing the distribution of father's education level

fig5 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = feduc  ), fill = "#C5351B")

fig5 + labs(title = "Eucation level of Fathers",
            x = "Education level",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )


# Histogram showing the distribution of the places of birth

fig6 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = place  ), fill = "#C5351B")

fig6 + labs(title = "Place/Facility of birth",
            x = "Place of birth",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )

# Histogram showing the distribution of days of birth.

fig7 <-  ggplot(data = main_table) +
  geom_bar(mapping = aes(x = day  ), fill = "#C5351B")

fig7 + labs(title = "Days of Birth",
            x = "Day of birth",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )

# Histogram showing the distribution of months of birth

fig8 <-  ggplot(data = main_table) +
  geom_bar(mapping = aes(x = month  ), fill = "#C5351B")

fig8 + labs(title = "Month of birth",
            x = "Month of birth",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )

# Histogram showing distribution of years of births.

fig9 <-  ggplot(data = main_table) +
  geom_bar(mapping = aes(x = as.factor(year)  ), fill = "#C5351B")

fig9 + labs(title = "Year of Birth",
            x = "year of birth",
            y = "Frequency (Numer of people)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  )

# Histogram showing the distribution of children weight at birth


fig10 <-  ggplot(data = main_table) +
  geom_bar(mapping = aes(x = weight  ), fill = "#C5351B")

fig10 + labs(title = "Children's Weight at Birth",
             x = "Weight (in grams)",
             y = "Frequency (Numer of people)",
             caption = "(based on data from the CDC's National Center for Health Statistics)"
) + 
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
    
  ) 


  

 

  