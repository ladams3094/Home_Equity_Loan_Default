EDA and preprocessing
================
Luke Adams
2021-06-24

# EDA and Preprocessing

**Setup**

**Read data**

``` r
# read data
data_00 <- read_csv(here('data', 'hmeq-data-raw.csv'))
```

## Basic EDA

-   5,960 individual loans

-   12 features with **REASON** and **JOB** being categorical

-   **BAD** is our response variable (1 = default, 0 = no default)

-   NAs are present

``` r
# quick look at the data
glimpse(data_00, width = 90)
```

    ## Rows: 5,960
    ## Columns: 13
    ## $ BAD     <dbl> 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, …
    ## $ LOAN    <dbl> 1100, 1300, 1500, 1500, 1700, 1700, 1800, 1800, 2000, 2000, 2000, 2000, …
    ## $ MORTDUE <dbl> 25860, 70053, 13500, NA, 97800, 30548, 48649, 28502, 32700, NA, 22608, 2…
    ## $ VALUE   <dbl> 39025, 68400, 16700, NA, 112000, 40320, 57037, 43034, 46740, 62250, NA, …
    ## $ REASON  <chr> "HomeImp", "HomeImp", "HomeImp", NA, "HomeImp", "HomeImp", "HomeImp", "H…
    ## $ JOB     <chr> "Other", "Other", "Other", NA, "Office", "Other", "Other", "Other", "Oth…
    ## $ YOJ     <dbl> 10.5, 7.0, 4.0, NA, 3.0, 9.0, 5.0, 11.0, 3.0, 16.0, 18.0, 11.0, 3.0, 2.5…
    ## $ DEROG   <dbl> 0, 0, 0, NA, 0, 0, 3, 0, 0, 0, NA, 0, 0, 0, 0, 0, 2, NA, 0, 0, 0, 1, 0, …
    ## $ DELINQ  <dbl> 0, 2, 0, NA, 0, 0, 2, 0, 2, 0, NA, 1, 0, 0, 1, 1, 6, NA, 0, 0, 1, 0, 0, …
    ## $ CLAGE   <dbl> 94.36667, 121.83333, 149.46667, NA, 93.33333, 101.46600, 77.10000, 88.76…
    ## $ NINQ    <dbl> 1, 0, 1, NA, 0, 1, 1, 0, 1, 0, NA, 1, 2, 0, 0, 0, 1, NA, 1, 0, 1, 1, 2, …
    ## $ CLNO    <dbl> 9, 14, 10, NA, 14, 8, 17, 8, 12, 13, NA, 9, 25, 24, 16, 8, 22, NA, 16, 1…
    ## $ DEBTINC <dbl> NA, NA, NA, NA, NA, 37.113614, NA, 36.884894, NA, NA, NA, NA, NA, NA, NA…

**Clean up column names**

``` r
# rename columns for easier interpretability
# clean_names() converts columns to snake case by default
data_01 <-
  data_00 %>% 
  rename(default = BAD, loan_amt = LOAN, mort_due = MORTDUE, prop_val = VALUE, 
         loan_purpose = REASON, job = JOB, job_years = YOJ, num_derog = DEROG,
         num_delinq_credit_lines = DELINQ, credit_line_age_months = CLAGE, 
         num_credit_inq = NINQ, num_credit_lines = CLNO, debt_to_income = DEBTINC) %>% 
  clean_names()
```

**Convert data types**

-   **default**, **loan\_purpose**, **job** to factor variables

-   Recode **default** factors (1 is yes, 0 is no)

``` r
data_02 <- 
  data_01 %>% 
  modify_at(c('default', 'loan_purpose', 'job'), as.factor) %>% 
  mutate(default = recode(default, `1` = 'yes', `0` = 'no'))
```

Save model ready data

``` r
# write_csv(data_02, here('data', 'hmeq-tidy.csv'))
```
