# gather states data and write to file

library(tidyverse)
library(forcats)

# examine the vector of abbreviations
glimpse(state.abb)

# examine the vector of names
glimpse(state.name)

# examine the vector of areas
glimpse(state.area)

# examine the vector of regions
glimpse(state.region)

# examine the vector of regions
x <- as_tibble(state.x77) %>%
	mutate(name = row.names(state.x77))
str(x)


# create a new data frame
us_states <- data_frame(abbr = state.abb,
												name   = state.name,
												area   = state.area,
												region = state.region)

us_states <- left_join(us_states, x, by = "name") %>%
	select(-8) %>%
	select(-9) %>%
	select(-10)
names(us_states) <- tolower(names(us_states))


# recode North central
us_states  <- us_states %>%
	mutate(region = fct_recode(region, "Midwest" = "North Central"))

unique(us_states$region)


glimpse(us_states)

write_csv(us_states, "data/cm5017_state.csv")

