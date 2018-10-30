# web scraping text files
# not HTML

library(tidyverse)

# This works for online data that is text only,
# not encoded as an HTML or XML table.
url <- "http://www.prdh.umontreal.ca/BDLC/data/alb/Population.txt"
df  <- read.table(url, skip = 2, header = TRUE, stringsAsFactors = FALSE) %>%
	as_tibble() %>%
	filter(Year == 1990)

df


