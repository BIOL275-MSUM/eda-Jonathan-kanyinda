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

### Data Acquisition

In this analysis the data was obtained from public data files of the
Center for Desease Control and Prevention’s National Center for Health
Statistic at
:<https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm#Period_Linked>
(Data Access - Vital Statistics Online 2020) and the selected data was
from the 2017/2018 year as a Ziped file that was decompressed/expanded
into the computer and there was a user guide provided that was used to
collect the information of interrest(NCHS 2020). The first step was to
obtain the files that were ziped in order to be able to explore them.
After obtaining the file, the information was encoded as a “fixed width
function” file and therefore I used the fwf function from the readr
package (Wickham and Hester 2020). Next, the user guide helped to figure
out which set rows contained specific information in order to be able to
retrieve that information using the fwf function in R.

### Data Preparation

For the data analysis I used RStudio version 1.2.5033 (R Core Team 2020)
and R version 4.0.3 (R Core Team 2020) for wrangling and data analysis.
The data obtained was a set of numbers displayed in a table (table1) and
the user guide provided the correspondence and significance of each
number. Therefore to better understand the data, I created a word
document in which I recorded the meaning of each number in the different
categories of interest using the user guide as a reference and then
proceeded to modify the values displayed in the inintial table (table1)
using the as\_factor function from the forcats package (Wickham 2020)
function combined with the combine function (c()) from the base package
(R Core Team 2020) and then proceeded to print a new table
(main\_table). I then used the information from the new table
(main\_table) to create graphs using the ggplot function from the
ggplot2 package (Wickham 2016)

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
table1 <-  read_fwf("Data/Nat2018PublicUS.c20190509.r20190717.txt",
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
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   year = col_double(),
    ##   month = col_character(),
    ##   day = col_double(),
    ##   age = col_double(),
    ##   race = col_double(),
    ##   place = col_double(),
    ##   mstatus = col_double(),
    ##   meduc = col_double(),
    ##   feduc = col_double()
    ## )

``` r
table1  # print table1 (table containig all data that will be  explored in the data analysis)
```

    ## # A tibble: 3,801,534 x 9
    ##     year month   day   age  race place mstatus meduc feduc
    ##    <dbl> <chr> <dbl> <dbl> <dbl> <dbl>   <dbl> <dbl> <dbl>
    ##  1  2018 01        2    30     1     1       1     6     3
    ##  2  2018 01        2    35     3     1       2     9     4
    ##  3  2018 01        2    28     1     1       1     6     4
    ##  4  2018 01        2    23     3     1       2     2     2
    ##  5  2018 01        3    37     1     1       1     4     3
    ##  6  2018 01        2    26     1     2       1     6     6
    ##  7  2018 01        3    28     1     1       1     4     6
    ##  8  2018 01        4    31     1     1       1     3     7
    ##  9  2018 01        5    37     1     1       1     2     4
    ## 10  2018 01        6    26     1     1       1     7     6
    ## # … with 3,801,524 more rows

``` r
# Clean the data ----------------------------------------------------------

daysofweek <- as_factor(c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
 
daysofweek       # print days of the week
```

    ## [1] Sunday    Monday    Tuesday   Wednesday Thursday  Friday    Saturday 
    ## Levels: Sunday Monday Tuesday Wednesday Thursday Friday Saturday

``` r
races <- as_factor(c("White (only)", "Black (only)", "AIAN (only)", "Asian (only)", "NHOPI (only)", "More than one race"))

races  # print the different races
```

    ## [1] White (only)       Black (only)       AIAN (only)        Asian (only)      
    ## [5] NHOPI (only)       More than one race
    ## 6 Levels: White (only) Black (only) AIAN (only) Asian (only) ... More than one race

``` r
maritalstatus <- as_factor(c("Married", "Unmarried"))

maritalstatus      # print marital status
```

    ## [1] Married   Unmarried
    ## Levels: Married Unmarried

``` r
birthplace <- as_factor(c("Hospital", "Free standing birth center", "Home (intended)", "Home,unintended0", "home (unknown if intended or unintended", "clinic/doctor's office", "Other","Unknown"))

birthplace      # print birth place
```

    ## [1] Hospital                               
    ## [2] Free standing birth center             
    ## [3] Home (intended)                        
    ## [4] Home,unintended0                       
    ## [5] home (unknown if intended or unintended
    ## [6] clinic/doctor's office                 
    ## [7] Other                                  
    ## [8] Unknown                                
    ## 8 Levels: Hospital Free standing birth center ... Unknown

``` r
educationlevel <- as_factor(c("8th grade or less", "9th through 12th grade with no diploma", "High School diploma", "Some college credit, no degree", "Associate degree", "Bachelor'sdegree", "Master's degree (MA, MEng, MSW, MBA)", "Doctorate (PhD, EdD) or Professional degree (MD, DDS, DVM, LLB, JD)", "Unknown"))

educationlevel     # print education level
```

    ## [1] 8th grade or less                                                  
    ## [2] 9th through 12th grade with no diploma                             
    ## [3] High School diploma                                                
    ## [4] Some college credit, no degree                                     
    ## [5] Associate degree                                                   
    ## [6] Bachelor'sdegree                                                   
    ## [7] Master's degree (MA, MEng, MSW, MBA)                               
    ## [8] Doctorate (PhD, EdD) or Professional degree (MD, DDS, DVM, LLB, JD)
    ## [9] Unknown                                                            
    ## 9 Levels: 8th grade or less ... Unknown

``` r
birthmonth <- as_factor(c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

birthmonth
```

    ##  [1] January   February  March     April     May       June      July     
    ##  [8] August    September October   November  December 
    ## 12 Levels: January February March April May June July August ... December

``` r
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
```

    ## # A tibble: 3,801,534 x 9
    ##     year month  day      age race    place     mstatus meduc        feduc       
    ##    <int> <fct>  <fct>  <dbl> <fct>   <fct>     <fct>   <fct>        <fct>       
    ##  1  2018 Janua… Monday    30 White … Hospital  Married Bachelor'sd… High School…
    ##  2  2018 Janua… Monday    35 AIAN (… Hospital  Unmarr… Unknown      Some colleg…
    ##  3  2018 Janua… Monday    28 White … Hospital  Married Bachelor'sd… Some colleg…
    ##  4  2018 Janua… Monday    23 AIAN (… Hospital  Unmarr… 9th through… 9th through…
    ##  5  2018 Janua… Tuesd…    37 White … Hospital  Married Some colleg… High School…
    ##  6  2018 Janua… Monday    26 White … Free sta… Married Bachelor'sd… Bachelor'sd…
    ##  7  2018 Janua… Tuesd…    28 White … Hospital  Married Some colleg… Bachelor'sd…
    ##  8  2018 Janua… Wedne…    31 White … Hospital  Married High School… Master's de…
    ##  9  2018 Janua… Thurs…    37 White … Hospital  Married 9th through… Some colleg…
    ## 10  2018 Janua… Friday    26 White … Hospital  Married Master's de… Bachelor'sd…
    ## # … with 3,801,524 more rows

``` r
# Histogram  showing the age distribution

fig1 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = age, fill = "#C5351B"))
          
          
fig1 + labs(title = "Distribution of Mother's Age",
          x = "Age of Mother",
          y = "Frequency (Number of People)",
          caption = "(based on data from the CDC's National Center for Health Statistics)"
          ) 
```

![](EDA_Presentation_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

``` r
# Histogram showing the racial distribution

fig2 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = race, fill = "#C5351B"))

fig2 + labs(title = "Distribution of Mother's Race", 
            x = "Race of Mother",
            y = "Frequency (Number of People)",
            caption = "(based on data from the CDC's National Center for Health Statistics)"
            )
```

![](EDA_Presentation_files/figure-gfm/unnamed-chunk-2-2.png)<!-- -->

``` r
# Histogram showing the marital status distribution of mothers

fig3 <- ggplot(data = main_table) +
  geom_bar(mapping = aes(x = mstatus, fill = "#C5351B"))

fig3 + labs(tite = "Marital Status of Mother",
            x = "Marital Status",
            y= "Frequenct (Number of people)",
            caption  = "(based on data from the CDC's National Center for Health Statistics")
```

![](EDA_Presentation_files/figure-gfm/unnamed-chunk-2-3.png)<!-- -->

## Discussion

## Litterature Cited

1.  National Center for Health Statistics. User guide to the 2018
    period/2017 cohort linked birth/infant death public use file. 2020.
    Available from:
    <ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Dataset_Documentation/DVS/period-cohort-linked/18PE17CO_linkedUG.pdf>.

2.  Data Access - Vital Statistics Online. National Center for Health
    Statistics, 2020,
    www.cdc.gov/nchs/data\_access/vitalstatsonline.htm\#Period\_Linked.

3.  Hadley Wickham and Jim Hester (2020). readr: Read Rectangular Text
    Data. R package version 1.4.0.
    <https://CRAN.R-project.org/package=readr>

4.  Hadley Wickham (2020). forcats: Tools for Working with Categorical
    Variables (Factors). R package version 0.5.0.
    <https://CRAN.R-project.org/package=forcats>

5.  R Core Team (2020). R: A language and environment for statistical
    computing. R Foundation for Statistical Computing, Vienna, Austria.
    URL <https://www.R-project.org/>.

6.  H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
    Springer-Verlag New York, 2016.
