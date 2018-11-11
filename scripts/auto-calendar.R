# calendar
# R Layton
# 2018-11-09

suppressPackageStartupMessages(library(tidyverse))
library(knitr)

# read in the functions
source("scripts/week_functions.R")

# integer week numbers
weeks <- 1:10

# filenames for sourcing
files <- weeks %>%
	as.character() %>%
	str_c("0", .) %>%
	str_sub(-2) %>%
	str_c("scripts/week", ., ".R")

# week-day data frame for 40 weeks
all_days  <- rep(1:4, times = 10) %>% as.character()
all_weeks <- rep(1:10, each = 4)  %>% as.character()

df <- tibble(
	week     = all_weeks,
	day      = all_days,
	agenda   = "",
	text     = "",
	exercise = "",
	activity = "",
	project  = "",
	due      = ""
)

# add content to calendar data frame
for (j in weeks){
	iweek <- j
	source(files[j])
	}

#
df <- cleanup(df)
df




