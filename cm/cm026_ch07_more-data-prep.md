
# more data prep skills

  - Please launch the `practiceR` project.  
  - Open the `chapter7.Rmd` script and continue adding to it from this
    tutorial.

![](../resources/images/code-icon.png)<!-- -->

``` r
# packages 
library(plyr)
library(dplyr)
library(tidyr)
library(stringr)
library(WDI)
```

## data set

We’ll continue with the `WDI` data frame we called **CompleteLongFert**
last time.

## renaming variables (7.1.3)

“Renaming” a variable means changing a data frame column name. We can
use `dplyr::select()` function (we’ve used it before) to rename the
columns using the format `new_name = old_name`. Quotes around the column
names are not needed unless an original column name has a space in it.

![](../resources/images/code-icon.png)<!-- -->

``` r
CompleteLongFert <- CompleteLongFert %>%
    select(Abbr = iso2c, Country = country, Year = year, fert_consump)
head(CompleteLongFert, n = 10L)
```

    ## # A tibble: 10 x 4
    ##    Abbr  Country              Year fert_consump
    ##    <chr> <chr>               <int>        <dbl>
    ##  1 AF    Afghanistan          2005         4.24
    ##  2 AL    Albania              2005       112.  
    ##  3 DZ    Algeria              2005         7.43
    ##  4 AO    Angola               2005         2.26
    ##  5 AG    Antigua and Barbuda  2005         6   
    ##  6 1A    Arab World           2005        68.8 
    ##  7 AR    Argentina            2005        36.4 
    ##  8 AM    Armenia              2005        22.7 
    ##  9 AU    Australia            2005        44.8 
    ## 10 AT    Austria              2005       136.

## ordering data (7.1.4)

We’ve covered this in earlier tutorials. Use `dplyr::arrange()` to order
by row and `dplyr::select()` to order by column.

*By rows.* For example, let’s order the rows of **CompleteLongFert** by
Country, then by year.

![](../resources/images/code-icon.png)<!-- -->

``` r
CompleteLongFert <- CompleteLongFert %>%
    arrange(Country, Year)
# display the top 10 rows
head(CompleteLongFert, n = 10L)
```

    ## # A tibble: 10 x 4
    ##    Abbr  Country      Year fert_consump
    ##    <chr> <chr>       <int>        <dbl>
    ##  1 AF    Afghanistan  2005         4.24
    ##  2 AF    Afghanistan  2006         6.29
    ##  3 AF    Afghanistan  2007         3.62
    ##  4 AF    Afghanistan  2008         2.99
    ##  5 AF    Afghanistan  2009         4.52
    ##  6 AF    Afghanistan  2010         4.25
    ##  7 AF    Afghanistan  2011         6.61
    ##  8 AL    Albania      2005       112.  
    ##  9 AL    Albania      2006        85.1 
    ## 10 AL    Albania      2007        87.2

*By columns.* And we can put the **Year** column first using `select()`,

![](../resources/images/code-icon.png)<!-- -->

``` r
CompleteLongFert <- CompleteLongFert %>%
    select(Year, Abbr, Country, fert_consump)
# display the top 10 rows
head(CompleteLongFert, n = 10L)
```

    ## # A tibble: 10 x 4
    ##     Year Abbr  Country     fert_consump
    ##    <int> <chr> <chr>              <dbl>
    ##  1  2005 AF    Afghanistan         4.24
    ##  2  2006 AF    Afghanistan         6.29
    ##  3  2007 AF    Afghanistan         3.62
    ##  4  2008 AF    Afghanistan         2.99
    ##  5  2009 AF    Afghanistan         4.52
    ##  6  2010 AF    Afghanistan         4.25
    ##  7  2011 AF    Afghanistan         6.61
    ##  8  2005 AL    Albania           112.  
    ##  9  2006 AL    Albania            85.1 
    ## 10  2007 AL    Albania            87.2

## recoding strings (7.1.6)

Quite often, the data entries in the tidy data set have entries that
need recoding.

For example, in the fertilizer data, let’s look at how Korea is
identified,

![](../resources/images/code-icon.png)<!-- -->

``` r
find_Korea <- CompleteLongFert %>%
    filter(str_detect(Country, "Korea"))
find_Korea
```

    ## # A tibble: 7 x 4
    ##    Year Abbr  Country     fert_consump
    ##   <int> <chr> <chr>              <dbl>
    ## 1  2005 KR    Korea, Rep.         643.
    ## 2  2006 KR    Korea, Rep.         470.
    ## 3  2007 KR    Korea, Rep.         511.
    ## 4  2008 KR    Korea, Rep.         441.
    ## 5  2009 KR    Korea, Rep.         332.
    ## 6  2010 KR    Korea, Rep.         336.
    ## 7  2011 KR    Korea, Rep.         335.

The output tells us that Korea is listed in the data set as Korea, Rep.,
that is, what we usually refer to as South Korea.

To recode this data entry, we use `mutate()` and `replace()`

![](../resources/images/code-icon.png)<!-- -->

``` r
CompleteLongFert <- CompleteLongFert %>%
    mutate(Country = replace(Country, Country == "Korea, Rep.", "South Korea"))
```

  - `mutate()` creates a new column or overwrites an existing column
  - `replace()` overwrites existing text entries identified by column
    (`Country`) and entry (`"Korea, Rep."`) with the new string (‘“South
    Korea”’).

Check the result.

![](../resources/images/code-icon.png)<!-- -->

``` r
find_Korea <- CompleteLongFert %>%
    filter(str_detect(Country, "Korea"))
find_Korea
```

    ## # A tibble: 7 x 4
    ##    Year Abbr  Country     fert_consump
    ##   <int> <chr> <chr>              <dbl>
    ## 1  2005 KR    South Korea         643.
    ## 2  2006 KR    South Korea         470.
    ## 3  2007 KR    South Korea         511.
    ## 4  2008 KR    South Korea         441.
    ## 5  2009 KR    South Korea         332.
    ## 6  2010 KR    South Korea         336.
    ## 7  2011 KR    South Korea         335.

Good\!

## creating new variable (7.1.7)

Data in existing columns can be used in computations to create new
variables in new columns. We use `mutate()` again.

For example, it might be useful to compute the log-base-10 of the
fertilizer consumption values so that we could show both large and small
numbers on the same graph scale.

![](../resources/images/code-icon.png)<!-- -->

``` r
CompleteLongFert <- CompleteLongFert %>%
    mutate(log10_consump = log10(fert_consump))
head(CompleteLongFert, n = 10L)
```

    ## # A tibble: 10 x 5
    ##     Year Abbr  Country     fert_consump log10_consump
    ##    <int> <chr> <chr>              <dbl>         <dbl>
    ##  1  2005 AF    Afghanistan         4.24         0.627
    ##  2  2006 AF    Afghanistan         6.29         0.799
    ##  3  2007 AF    Afghanistan         3.62         0.559
    ##  4  2008 AF    Afghanistan         2.99         0.476
    ##  5  2009 AF    Afghanistan         4.52         0.655
    ##  6  2010 AF    Afghanistan         4.25         0.628
    ##  7  2011 AF    Afghanistan         6.61         0.820
    ##  8  2005 AL    Albania           112.           2.05 
    ##  9  2006 AL    Albania            85.1          1.93 
    ## 10  2007 AL    Albania            87.2          1.94

Note that R computes the result for each row and places the result in
the correct row in the data frame. This is one of the great advantages
of having data in tidy (or long) form.

Let’s look at a summary of our new variable.

![](../resources/images/code-icon.png)<!-- -->

``` r
# summarize the log-scaled data
summary(CompleteLongFert$log10_consump)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    -Inf    1.33    1.94    -Inf    2.20    4.22

We have some `-Inf` results. That’s because R returns `-Inf` for the
\(log_{10}(0)\).

  - We could drop those observations before taking the log
  - Or we can replace zero consumption with a very small number, e.g.,
    0.001, before taking the log

![](../resources/images/code-icon.png)<!-- -->

``` r
# find the locations of fertilizer consumption = 0
fert_consump_0 <- CompleteLongFert$fert_consump == 0

# use those indices to replace 0 with 0.001
CompleteLongFert$fert_consump[fert_consump_0] <- 0.001

# now do the log calculation over agin
CompleteLongFert <- CompleteLongFert %>%
    mutate(log10_consump = log10(fert_consump))

# examine the result
summary(CompleteLongFert$log10_consump)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   -3.00    1.33    1.94    1.76    2.20    4.22

And the `-Inf` values are gone.

This example illustrates the importance of examining a summary of any
new variables you compute. You want to catch any strange results as soon
as they appear.

## summary of functions used

  - `arrange()`
  - `select()`
  - `filter()`
  - `str_detect()`
  - `replace()`
  - `mutate()`
  - `summary()`

-----

[main page](../README.md)
