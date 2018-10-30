

# mary's data
# try tsv

library(tidyverse)

df <- read_delim("data/population-alberta.txt", delim = "\t", skip = 2)


df <- df %>%
	filter(Year == 1990)

df


# actual data
# 1990       0      21052.78     22085.59     43138.37

# A tibble: 111 x 5
# Year Age   Female  Male  Total
# <int> <chr>  <dbl> <dbl>  <dbl>
# 	1  1990 0     21053. 2086. 43138.





my_lines <- read_lines("data/population-alberta.txt")
glimpse(my_lines)

my_lines <- str_squish(my_lines)
my_lines <- my_lines[-c(1, 2)]
write_lines(my_lines, "data/population-alberta-2.txt")


df <- read_delim("data/population-alberta-2.txt", delim = " ")
df <- df %>%
	filter(Year == 1990)

df


