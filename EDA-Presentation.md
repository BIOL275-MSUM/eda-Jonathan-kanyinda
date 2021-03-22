Investigation of Different Causes of Infant Mortality in the United
States
================
Jonathan Kanyinda
03/13/2021

## Abstract

Infant mortality in the United States is one of the less discussed
topics in general. However, it affects a lot of families and communities
in the country. In this report, infant mortality based on the data from
the year 2018 by age, maternal race, gestational age and maternal state
of residence have been investigated. Descriptive tabulations as well as
graphs are reported and interpreted for infant death mortality using the
2018 period linked birth/infant datafile that is based on birth and
death certificates registered in all states and the district of
Columbia. More than 20,000 infant deaths were reported in 2018. The
infant mortality rate declined by 4 % in comparison to 2017, and
regardless of the differences investigated, in general the mortality
rate has been trending down since 1995. I will do an exploratory
analysis to investigate the relation between race, gestational age and
state of residence with infant mortality

## Introduction

## Methods

In this analysis the data was obtained from public data files of the
Center for Desease Control and Privation’s National Center for Health
Statistic at
:<https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm#Period_Linked>
and the select data was from 2017/2018 year as a Ziped file that was
decompressed/expanded into the computer and there was a user guide
provided that was used to collect the information of interrest. The
first step was to obtain the files that were ziped in order to be able
to explore them. After obtaining the file, the information was encoded
as a “fixed width function” file and therefore I needed to use the fwf
function, which is a function in the tidy verse package and I was
introduced to the function through a walk through at
<https://readr.tidyverse.org/reference/read_fwf.html>. Next, the user
guide helped to figure out which set rows contained specific information
in order to be able to retrieve that information using the fwf function
in R

LOAD
    PACKAGES

``` r
library(tidyverse)          # Load the tidyverse package
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

## REsults

Table 1

``` r
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
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   birth_year = col_double(),
    ##   month_of_birth = col_character(),
    ##   day_of_birth = col_double(),
    ##   age_of_mother = col_double(),
    ##   race_of_mother = col_double(),
    ##   place_of_birth = col_double(),
    ##   marital_status = col_double(),
    ##   mother_education_level = col_double(),
    ##   father_education_level = col_double()
    ## )

``` r
 table1  # print table1 (table containig all data that will be  explored in the data analysis)
```

    ## # A tibble: 3,801,534 x 9
    ##    birth_year month_of_birth day_of_birth age_of_mother race_of_mother
    ##         <dbl> <chr>                 <dbl>         <dbl>          <dbl>
    ##  1       2018 01                        2            30              1
    ##  2       2018 01                        2            35              3
    ##  3       2018 01                        2            28              1
    ##  4       2018 01                        2            23              3
    ##  5       2018 01                        3            37              1
    ##  6       2018 01                        2            26              1
    ##  7       2018 01                        3            28              1
    ##  8       2018 01                        4            31              1
    ##  9       2018 01                        5            37              1
    ## 10       2018 01                        6            26              1
    ## # … with 3,801,524 more rows, and 4 more variables: place_of_birth <dbl>,
    ## #   marital_status <dbl>, mother_education_level <dbl>,
    ## #   father_education_level <dbl>

## Discussion

## References
