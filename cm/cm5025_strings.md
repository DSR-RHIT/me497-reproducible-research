
# strings

Based on [Chapter 14](http://r4ds.had.co.nz/strings.html) in (Wickham &
Grolemund, [2016](#ref-wickhamgrolemund2016)).

``` r
library(tidyverse)
library(stringr)
```

I recommend a focus on these sections:

  - 14.2.1 `str_length()`  
  - 14.2.2 `str_c()`  
  - 14.2.3 `str_sub()`
  - 14.3.1 basic matches using regular expressions
  - 14.3.2 anchor the regular expression
  - 14.4.1 `str_detect()`
  - 14.4.5 `str_replace()`
  - 14.4.6 `str_split()`

## basics

``` r
string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'

string1
## [1] "This is a string"

string2
## [1] "If I want to include a \"quote\" inside a string, I use single quotes"
```

Or juse a backslash to inmclude the
string

``` r
string3 <- "Or I can use a backslash to \"escape\" the quotes inside a string"

string3
## [1] "Or I can use a backslash to \"escape\" the quotes inside a string"
```

Note that the output of the string shows the backslashes. To see just
the string, use `writeLines()`

``` r
writeLines(string3)
## Or I can use a backslash to "escape" the quotes inside a string
```

## special characters

  - `\n` newline
  - `\t` tab
  - `\\` backslash
  - `\'` single quote (apostrophe)
  - `\"` quote mark

Unicode character codes when used in strings in R will print special
characters on all platforms. This is just a sample, more codes can be
found
[here](https://www.rapidtables.com/code/text/unicode-characters.html).

  - `\u03B1` α
  - `\u03B2` β
  - `\u20AC` €
  - `\u00A5` ¥
  - `\u00A9` ©

## combine strings

Combine strings with `str_c()`.

``` r
str_c("x", "y")
## [1] "xy"

str_c("x", "y", "z")
## [1] "xyz"
```

If you ant them separated, use the `sep` arguments

``` r
str_c("x", "y", sep = ", ")
## [1] "x, y"
```

Vectorized

``` r
str_c("prefix-", c("a", "b", "c"), "-suffix")
## [1] "prefix-a-suffix" "prefix-b-suffix" "prefix-c-suffix"
```

To collapse a vector of strings into a single string, use `collapse`:

``` r
a <- c("x", "y", "z")

length(a)
## [1] 3

b <- str_c(a, collapse = ", ")

b
## [1] "x, y, z"

length(b)
## [1] 1
```

## collapse a string with `|` (or) to search

Collapse is also useful for creating a string for OR searches. For
example, I can create a searchable state data frame,

``` r
df <- as.data.frame(state.x77)
df$State <- row.names(state.x77)
df <- as_tibble(df)
df
## # A tibble: 50 x 9
##    Population Income Illiteracy `Life Exp` Murder `HS Grad` Frost   Area
##  *      <dbl>  <dbl>      <dbl>      <dbl>  <dbl>     <dbl> <dbl>  <dbl>
##  1       3615   3624        2.1       69.0   15.1      41.3    20  50708
##  2        365   6315        1.5       69.3   11.3      66.7   152 566432
##  3       2212   4530        1.8       70.6    7.8      58.1    15 113417
##  4       2110   3378        1.9       70.7   10.1      39.9    65  51945
##  5      21198   5114        1.1       71.7   10.3      62.6    20 156361
##  6       2541   4884        0.7       72.1    6.8      63.9   166 103766
##  7       3100   5348        1.1       72.5    3.1      56     139   4862
##  8        579   4809        0.9       70.1    6.2      54.6   103   1982
##  9       8277   4815        1.3       70.7   10.7      52.6    11  54090
## 10       4931   4091        2         68.5   13.9      40.6    60  58073
## # ... with 40 more rows, and 1 more variable: State <chr>
```

Then use collapse to create a search string with the OR operator `|`

``` r
search_terms <- c("California", "Oregon", "Washington")
search_string <- str_c(search_terms, collapse = "|")
search_string 
## [1] "California|Oregon|Washington"
```

Then filter by detecting any of the terms in any column. `filter_all()`
and `any_vars()` are dplyr functions.

``` r
filter_all(df, any_vars(str_detect(., search_string)))
## # A tibble: 3 x 9
##   Population Income Illiteracy `Life Exp` Murder `HS Grad` Frost   Area
##        <dbl>  <dbl>      <dbl>      <dbl>  <dbl>     <dbl> <dbl>  <dbl>
## 1      21198   5114        1.1       71.7   10.3      62.6    20 156361
## 2       2284   4660        0.6       72.1    4.2      60      44  96184
## 3       3559   4864        0.6       71.7    4.3      63.5    32  66570
## # ... with 1 more variable: State <chr>
```

Note also the use of `.` as a placeholder for `df`

## references

<div id="refs" class="references">

<div id="ref-wickhamgrolemund2016">

Wickham, H., & Grolemund, G. (2016). *R for Data Science*. Sebastopol,
CA: O’Reilly Media, Inc.

</div>

</div>
