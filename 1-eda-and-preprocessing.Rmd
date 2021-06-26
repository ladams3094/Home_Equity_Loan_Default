---
title: 'EDA and preprocessing'
author: 'Luke Adams'
date: '2021-06-24'
output: rmarkdown::github_document
---

**Setup**

```{r setup, include=FALSE}
# setup
library(knitr)
knitr::opts_chunk$set(cache = TRUE, cache.lazy = FALSE, warning = FALSE,
                      message = FALSE, echo = TRUE, dpi = 180, 
                      fig.width = 10, fig.height = 6)
library(tidyverse)
library(tidymodels)
theme_set(theme_minimal())
update_geom_defaults('rect', list(fill = 'midnightblue', alpha = 0.8))

library(DALEXtra)
library(lime)
library(GGally)     ## ggcor()

library(here)
library(skimr)
library(janitor)

library(caret)     # nearZeroVar
library(visdat)
```

**Read data**

```{r, message=F}
# read data
data_00 <- read_csv(here('data', 'hmeq-data-raw.csv'))
```

## Basic EDA

-   5,960 individual loans

-   12 features with **REASON** and **JOB** being categorical

-   **BAD** is our response variable (1 = default, 0 = no default)

-   NAs are present

```{r}
# quick look at the data
glimpse(data_00, width = 90)
```

**Clean up column names**

```{r}
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

-   **default**, **loan_purpose**, **job** to factor variables

-   Recode **default** factors (1 is yes, 0 is no)

```{r}
data_02 <- 
  data_01 %>% 
  modify_at(c('default', 'loan_purpose', 'job'), as.factor) %>% 
  mutate(default = recode(default, `1` = 'yes', `0` = 'no'))
```

Save model ready data

```{r}
# write_csv(data_02, here('data', 'hmeq-tidy.csv'))
```
