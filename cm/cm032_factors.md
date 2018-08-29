
# introduction to factors

As a reminder, the commonly encountered vectors types in R:

  - double (numeric double precision)
  - integer (numeric integers)
  - complex (numbers), e.g., `z <- 2 + 5i`
  - character (strings)
  - factor `<-` today’s topic

## categorical data

*Categorical variables* in a data set describe qualitative properties.
The range of possible values (or levels) a categorical variable can
assume is finite. Two examples of categorical data and their levels:

  - Category “cardinal directions” has 4 levels (north, west, south,
    east)
  - Category “gender identity” has [58
    levels](http://abcnews.go.com/blogs/headlines/2014/02/heres-a-list-of-58-gender-options-for-facebook-users/)
    (agender, androgyne, androgynous, bigender, cis, cisgender, cis
    female, cis male. etc.). Other sources list even more levels.

Some categorical data have an intrinsic order (*ordinal* data) and
others do not (*nominal* data). For example, the data values “low”,
“medium”, and “high” have an intrinsic order while the data values
“north”, “west”, “south”, and “east” do not.

*Factors* are a data type in R specialized for categorical data, ordered
or unordered.

## start a new script in practiceR

  - In `practiceR/scripts/`, start a new Rmd file called
    `factor_play.Rmd`.
  - Copy the code chunks in this tutorial into `factor_play.Rmd` and add
    as much prose as you like to explain the work.

![](../resources/images/code-icon.png)<!-- -->

``` r
library(dplyr)
library(readr)
```

The standard R installation includes US “state” data sets, with all data
arranged according to alphabetical order of the state names. (Learn more
by typing `?state` in your Console.) There are 7 data sets, named:

    state.abb 
    state.area 
    state.center 
    state.division 
    state.name 
    state.region 
    state.x77 

Let’s take a look at several variables, one numerical (area) and three
that are categorical (abbreviation, name, and region):

![](../resources/images/code-icon.png)<!-- -->

``` r
# examine the vector of abbreviations
glimpse(state.abb)
##  chr [1:50] "AL" "AK" "AZ" "AR" "CA" "CO" "CT" "DE" "FL" "GA" "HI" ...

# examine the vector of names  
glimpse(state.name)
##  chr [1:50] "Alabama" "Alaska" "Arizona" "Arkansas" "California" ...

# examine the vector of areas  
glimpse(state.area)
##  num [1:50] 51609 589757 113909 53104 158693 ...

# examine the vector of regions 
glimpse(state.region)
##  Factor w/ 4 levels "Northeast","South",..: 2 4 4 2 4 4 1 2 2 2 ...
```

Of the categorical variables, two are encoded as characters
(abbreviation and state) and one is encoded as a factor (region).

Let’s collect these 4 vectors in a new data frame, renaming the
variables to eliminate the “dot” in the variable names and writing the
data to file for later use.

![](../resources/images/code-icon.png)<!-- -->

``` r
# create a new data frame
state_df <- data_frame(abbr = state.abb, 
        name   = state.name, 
        area   = state.area, 
        region = state.region)

# write the df to file for later use 
write_csv(state_df, "data/cm034_state.csv")
```

## strings or factors

We saw above that categorical data in R can be represented as strings or
factors. The data frame we created above retained the data types of the
original vectors:

``` r
# examine the new data frame 
glimpse(state_df)
## Observations: 50
## Variables: 4
## $ abbr   <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "...
## $ name   <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <fct> South, West, West, South, West, West, Northeast, South,...
```

  - `abbr <chr>` is a vector of character strings
  - `name <chr>` is a vector of character strings
  - `area <dbl>` is a double-precision number
  - `region <fctr>` is a factor

You will encounter categorical data in both forms, characters and
factors, and should recognize the attributes of both:

  - Character strings are suitable for unordered (nominal) data.
  - Factors are suitable for either type, ordered or unordered.  
  - Factor levels are *viewed* as character strings but are *encoded* as
    integer values \(1...k\).
  - Integer encoding (hidden from casual view) assigns an implicit
    order, even for unordered values.

*Integer encoding* is the aspect of factors that is both useful and
sometimes puzzling if it catches you unaware. Hence this tutorial.

## factors are encoded as integers

Let’s look more closely at the attributes of the factor. I’ll start by
extracting part of the region column as a stand-alone vector.

![](../resources/images/code-icon.png)<!-- -->

``` r
# extract the region column, first fifteen rows  
first_15 <- state_df$region[1:15]

# confirm region is a factor
class(first_15)
## [1] "factor"
 
# factors have levels 
levels(first_15)
## [1] "Northeast"     "South"         "North Central" "West"
```

The `levels` attribute tells us the vector has 4 distinct values, in the
order shown:

  - level 1 is “Northeast”
  - level 2 is “South”
  - level 3 is “North Central”
  - level 4 is “West”

Printing out the values, the data appear to be characters:

![](../resources/images/code-icon.png)<!-- -->

``` r
# the region data appear to be characters  
first_15
##  [1] South         West          West          South         West         
##  [6] West          Northeast     South         South         South        
## [11] West          West          North Central North Central North Central
## Levels: Northeast South North Central West
```

But `typeof()` tells us that this vector is composed of integers:

![](../resources/images/code-icon.png)<!-- -->

``` r
# the region data are of type "integer" 
typeof(first_15)
## [1] "integer"
```

We can see the integers themselves by removing the “class” attribute,

![](../resources/images/code-icon.png)<!-- -->

``` r
# the values are actually encoded as integers 
unclass(first_15)[1:15]
##  [1] 2 4 4 2 4 4 1 2 2 2 4 4 3 3 3
```

The integers represent the factor levels:

  - 2 is South (Alabama)
  - 4 is West (Alaska)
  - 4 is West (Arizona)
  - 2 is South (Arkansas)
  - 4 is West (California)
  - 4 is West (Colorado)
  - 1 is Northeast (Connecticut)
  - etc.

This example illustrates that factors in R always have an implicit
order, even for unordered (nominal) data, because factors are encoded as
integer sequence \(1 ... k\).

## summary

  - Categorical data can be represented in R as strings or factors.
  - Categorical data can be intrinsically ordered or unordered.
  - Elements of a factor vector are its “levels”.
  - The number of levels \(k\) is the number of unique values in the
    vector.
  - Levels are encoded in R as integers representing the level numbers,
    \(1...k\).

-----

[main page](../README.md)
