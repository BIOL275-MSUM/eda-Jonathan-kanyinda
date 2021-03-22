
 

# Load packages -----------------------------------------------------------

library(tidyverse)          # Load the tidyverse package

# Read data ---------------------------------------------------------------


table1 <- read_fwf("Data/Nat2018PublicUS.c20190509.r20190717.txt",
         col_positions = fwf_cols(birth_year = c(9,12), 
                                  month_of_birth = c(13,14),
                                  day_of_birth = c(23),
                                  age_of_mother = c(75,76),
                                  race_of_mother = c(107),
                                  place_of_birth = c(32),
                                  
                                  marital_status = c(120),
                                  mother_education_level = c(124),
                                  father_education_level = c(163)
                                 
                              
                            
                                   ))


 table1  # print table1 (table containig all data that will be  explored in the data analysis)
 
 group_by(table1, race_of_mother,place_of_birth)

table2 <- select(table1, race_of_mother, place_of_birth)

table2

  