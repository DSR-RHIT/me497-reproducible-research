# calendar
# R Layton
# 2018-11-09

suppressPackageStartupMessages(library(tidyverse))
library(knitr)

# create base df with weeks and days
the_days   <- rep(1:4, times = 10)
the_weeks  <- rep(1:10, each = 4)
empty_days <- rep("", 40)

df <- tibble(
	week     = the_weeks,
	day      = the_days,
	agenda   = empty_days,
	text     = empty_days,
	exercise = empty_days,
	activity = empty_days,
	project  = empty_days,
	due      = empty_days
)

# read in the functions
source("scripts/week_functions.R")

iweek <- 1
source("scripts/week01.R")







df <- cleanup(df)





