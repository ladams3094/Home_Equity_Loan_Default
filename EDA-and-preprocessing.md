---
title: 'EDA and preprocessing'
author: 'Luke Adams'
date: '2021-06-24'
output: rmarkdown::github_document
--- 

# Setup

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
library(GGally)
```

```{r}
# load data
hmeq_data <- 
  read_csv(here('data', 'tidy_data', 'hmeq-tidy.csv')) %>% 
  modify_if(is.character, factor)

glimpse(hmeq_data, width = 85)
```
