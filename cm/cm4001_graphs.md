
# graphs: gettings started

R for Data Science online [Sections 3.1
and 3.2](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)

## section 3.1.1

``` r
library(tidyverse)
## -- Attaching packages ------------------------------------------- tidyverse 1.2.1 --
## v ggplot2 3.0.0.9000     v purrr   0.2.5     
## v tibble  1.4.2          v dplyr   0.7.6     
## v tidyr   0.8.1          v stringr 1.3.1     
## v readr   1.1.1          v forcats 0.3.0
## -- Conflicts ---------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

## section 3.2.1

`mpg` is a data set in the tidyverse.

``` r
mpg
## # A tibble: 234 x 11
##    manufacturer model displ  year   cyl trans drv     cty   hwy fl    cla~
##    <chr>        <chr> <dbl> <int> <int> <chr> <chr> <int> <int> <chr> <ch>
##  1 audi         a4      1.8  1999     4 auto~ f        18    29 p     com~
##  2 audi         a4      1.8  1999     4 manu~ f        21    29 p     com~
##  3 audi         a4      2    2008     4 manu~ f        20    31 p     com~
##  4 audi         a4      2    2008     4 auto~ f        21    30 p     com~
##  5 audi         a4      2.8  1999     6 auto~ f        16    26 p     com~
##  6 audi         a4      2.8  1999     6 manu~ f        18    26 p     com~
##  7 audi         a4      3.1  2008     6 auto~ f        18    27 p     com~
##  8 audi         a4 q~   1.8  1999     4 manu~ 4        18    26 p     com~
##  9 audi         a4 q~   1.8  1999     4 auto~ 4        16    25 p     com~
## 10 audi         a4 q~   2    2008     4 manu~ 4        20    28 p     com~
## # ... with 224 more rows
```

## section 3.2.2

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

## exercises 3.2.4

Do the exercises on your own for practice with the concepts

## section 3.3

With `class` mapped to the `color` aesthetic.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

With `class` mapped to the `size` aesthetic—produces a warning.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
## Warning: Using size for a discrete variable is not advised.
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

With `class` mapped to the `alpha` aesthetic—produces a warning.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
## Warning: Using alpha for a discrete variable is not advised.
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

With `class` mapped to the `shape` aesthetic—produces a warning.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
## Warning: The shape palette can deal with a maximum of 6 discrete values
## because more than 6 becomes difficult to discriminate; you have 7.
## Consider specifying shapes manually if you must have them.
## Warning: Removed 62 rows containing missing values (geom_point).
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

Set the aesthetic properties of the geom manually, outside of `aes()`.

``` r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
```

![](cm4001_graphs_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

## exercises 3.3.1

Do the exercises on your own for practice with the concepts
