
# review of data tools

Here, we briefly review the suite of tools we use for preparing data for
analysis.

``` r
library(tidyverse)
library(stringr)
```

If you subscribe to the [RStudio webinar
notifications](https://www.rstudio.com/resources/webinars/), you can
receive online notices of free webinars put on by Hadley Wickham and
other folks at RStudio. I recommend it.

## read and write

  - `read_csv()` and `write_csv()`
  - `read_lines()` and `write_lines()`
  - `read_table()`

## examining the data structure

  - `str()` displays the internal structure of an R object
  - `glimpse()` like `str()` applied to a data frame but it tries to
    show you as much data as possible
  - `head()` returns the first part of an R object
  - `tail()` returns the last part of an R object
  - `summary()` returns a statistical summary of an object
  - `names()` returns column names
  - `nrow()` returns the number of rows of a data frame
  - `typeof()` tells us what the object is
  - `attributes()` yields metadata about the object
  - `kable()` print a knitr table
  - `print()` write an object in the Console

## basic functions in R

  - `max()` and `min()` are R functions that do the obvious
  - `abs()` absolute value
  - `log10()` for base 10
  - `log()` for base *e*
  - `<=` (less than or equal) and `>=` (greater than or equal) are
    logical operators that return logical values TRUE or FALSE
  - `c()` concatenate elements to create a vector  
  - `unname()` removes the names from named numbers
  - `unlist()`

## subsetting data

  - `select()` keeps only the variables (columns) you list  
  - `filter()` keeps the rows listed
  - `[]` brackets, as in `variable_name[indices]`
  - `[[]]` double brackets subsets a list and returns its components
  - `which()` yields the TRUE indices of a logical object
  - `$` extract

## tidying and transforming data

  - `separate()`
  - `unite()`
  - `gather()`
  - `spread()`
  - `arrange()`  
  - `mutate()`
  - `group_by()` and `summarize()`

## editing strings

  - `tolower()` strings to lower case
  - `str_replace()`
  - `str_detect()`
  - `str_c()` concatenate strings
  - `separate()` turns one column of strings into multiple columns of
    strings

## control of code execution

  - `stopifnot()` stops the code execution and produces an error message
    if any argument returns FALSE

-----

[main page](../README.md)
