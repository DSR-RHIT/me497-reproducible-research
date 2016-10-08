
factors
=======

Factors are a special type of vector useful for categorical data. I've found them occasionally useful as conditioning variables in graphs.

As a reminder, the commonly encountered vectors types in R:

-   double (numeric double precision)
-   integer (numeric integers)
-   complex (numbers), e.g., `z <- 2 + 5i`
-   character (strings)
-   factor

start a new script in practiceR
-------------------------------

-   In `practiceR/scripts/`, start a new Rmd file called `factor_play.Rmd`.
-   Copy the code chunks in this tutorial into `factor_play.Rmd` and add as much prose as you like to explain the work.

![](../resources/images/code-icon.png)

``` r
library(dplyr)
library(readr)
```

The standard R installation includes US "state" data sets, with all data arranged according to alphabetical order of the state names. (Learn more by typing `?state` in your Console.) There are 7 data sets, named:

    state.abb 
    state.area 
    state.center 
    state.division 
    state.name 
    state.region 
    state.x77 

Let's take a look at several:

![](../resources/images/code-icon.png)

``` r
# examine the state abbreviations data 
glimpse(state.abb)
##  chr [1:50] "AL" "AK" "AZ" "AR" "CA" "CO" "CT" "DE" ...

# examine the state name data 
glimpse(state.name)
##  chr [1:50] "Alabama" "Alaska" "Arizona" "Arkansas" ...

# summarize the area data 
summary(state.area)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1214   37320   56220   72370   83230  589800
```

Let's collect several of these vectors in a new data frame, renaming the variables to eliminate the "dot" in the variable names. Write the data to file for later use.

![](../resources/images/code-icon.png)

``` r
# create a new data frame
state_df <- data_frame(abbr = state.abb, 
        name   = state.name, 
        area   = state.area, 
        region = state.region)

# write the df to file for later use 
write_csv(state_df, "data/cm034_state.csv")
```

factors
-------

Take a closer look at the new data frame.

![](../resources/images/code-icon.png)

``` r
# examine the data frame
glimpse(state_df)
## Observations: 50
## Variables: 4
## $ abbr   <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "...
## $ name   <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <fctr> South, West, West, South, West, West, Northeast, South...
```

The output includes `region <fctr>` telling us that region is a "factor." Let's look more closely at its attributes. I'll start by extracting the region column as a stand-alone vector.

![](../resources/images/code-icon.png)

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

The `levels` attribute tells us the vector has 4 distinct values, in the order shown:

-   level 1 is "Northeast"
-   level 2 is "South"
-   level 3 is "North Central"
-   level 4 is "West"

Printing out the values, the data appear to be characters:

![](../resources/images/code-icon.png)

``` r
# the region data appear to be characters  
first_15
##  [1] South         West          West          South         West         
##  [6] West          Northeast     South         South         South        
## [11] West          West          North Central North Central North Central
## Levels: Northeast South North Central West
```

But `typeof()` tells us that this vector is composed of integers:

![](../resources/images/code-icon.png)

``` r
# the region data are of type "integer" 
typeof(first_15)
## [1] "integer"
```

We can see the integers themselves by removing the "class" attribute,

![](../resources/images/code-icon.png)

``` r
# the values are actually encoded as integers 
unclass(first_15)[1:15]
##  [1] 2 4 4 2 4 4 1 2 2 2 4 4 3 3 3
```

The integers represent levels, e.g.

-   2 is South (Alabama)
-   4 is West (Alaska)
-   4 is West (Arizona)
-   2 is South (Arkansas)
-   4 is West (California)
-   4 is West (Colorado)
-   1 is Northeast (Connecticut)
-   etc.

reordering factors
------------------

Suppose I wanted to reorder the integers assigned to the factor levels. I can select any order I want, e.g.,

![](../resources/images/code-icon.png)

``` r
first_15 <- factor(first_15,
        levels = c("West", "South", "North Central", "Northeast"))
```

-   `levels = c(...)` allows me to rewrite the 4 levels in the new order I want
-   `factor()` maintains the vector as a factor type

Check the new ordering:

![](../resources/images/code-icon.png)

``` r
# levels in their new order match the order I assigned above
levels(first_15)
## [1] "West"          "South"         "North Central" "Northeast"
```

Compare the new integer vector to the one reported earlier:

![](../resources/images/code-icon.png)

``` r
# the integer vector for the first 15 states in their new order 
unclass(first_15)[1:15]
##  [1] 2 1 1 2 1 1 4 2 2 2 1 1 3 3 3
```

The first few entries encode the same states and regions as before, but the integers encoding the factor levels have changed according to the order I wrote them out in the `levels = c(...)` argument earlier.

-   2 is South (Alabama)
-   1 is West (Alaska)
-   1 is West (Arizona)
-   2 is South (Arkansas)
-   1 is West (California)
-   1 is West (Colorado)
-   4 is Northeast (Connecticut)
-   etc.

factor-character conversion
---------------------------

In early versions of R there was a memory advantage to using factors instead of character vectors. This is no longer the case. However, as a consequence of this legacy:

> *Many basic R functions automatically convert characters to factors when loading data.*

The automatic conversion of characters to factors can cause data carpentry problems if it catches you unaware. To illustrate, let's use `read.csv()` to read the data file we saved earlier,

![](../resources/images/code-icon.png)

``` r
# read a CSV file that has string columns 
test_df <- read.csv("data/cm034_state.csv")

# examine the data 
glimpse(test_df)
## Observations: 50
## Variables: 4
## $ abbr   <fctr> AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN...
## $ name   <fctr> Alabama, Alaska, Arizona, Arkansas, California, Colora...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <fctr> South, West, West, South, West, West, Northeast, South...
```

All of the character variables are now factors.

To illustrate the sorts of problems you might encounter, let's suppose we needed to edit the abbreviation of Alabama from AL to AB.

![](../resources/images/code-icon.png)

``` r
# state abbreviations vector
abbr <- test_df$abbr

# the one I want to edit
abbr[1]
## [1] AL
## 50 Levels: AK AL AR AZ CA CO CT DE FL GA HI IA ID IL IN KS KY LA MA ... WY

# try changing it
abbr[1] <- "AB"
## Warning in `[<-.factor`(`*tmp*`, 1, value = "AB"): invalid factor level, NA
## generated

# examine the result
abbr[1]
## [1] <NA>
## 50 Levels: AK AL AR AZ CA CO CT DE FL GA HI IA ID IL IN KS KY LA MA ... WY
```

The edit fails, the abbreviation is replaced with NA, and I get a warning message. The levels of a factor *are the only values* the elements of the vector can take on.

I can't edit factors like I would characters. If I convert the factors to characters, editing works as we would expect.

![](../resources/images/code-icon.png)

``` r
# state abbreviations vector converted to characters
abbr <- as.character(test_df$abbr)

# the one I want to edit
abbr[1]
## [1] "AL"

# try changing it
abbr[1] <- "AB"

# examine the result
abbr[1]
## [1] "AB"
```

When reading data using `read.csv()`, to prevent the conversion of strings to factors, add the `stringsAsFactors = FALSE` argument.

![](../resources/images/code-icon.png)

``` r
# read a CSV file that has string columns 
test_df <- read.csv("data/cm034_state.csv", stringsAsFactors = FALSE)

# examine the data
glimpse(test_df)
## Observations: 50
## Variables: 4
## $ abbr   <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "...
## $ name   <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <chr> "South", "West", "West", "South", "West", "West", "Nort...
```

Better yet, use `read_csv()` instead. It reads strings as strings.

![](../resources/images/code-icon.png)

``` r
# try read_csv() from the readr package 
test_df <- read_csv("data/cm034_state.csv")

# examine the data
glimpse(test_df)
## Observations: 50
## Variables: 4
## $ abbr   <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "...
## $ name   <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <chr> "South", "West", "West", "South", "West", "West", "Nort...
```

After using `read_csv()`, if we wanted `region` to be a factor, we can explicitly convert it using `as.factor()`.

![](../resources/images/code-icon.png)

``` r
# convert a vector to a factor 
test_df$region <- as.factor(test_df$region)

# examine the result
glimpse(test_df)
## Observations: 50
## Variables: 4
## $ abbr   <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "...
## $ name   <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "California...
## $ area   <dbl> 51609, 589757, 113909, 53104, 158693, 104247, 5009, 205...
## $ region <fctr> South, West, West, South, West, West, Northeast, South...
```

When I convert a character vector to a factor, the levels are arranged in alphabetical order for encoding by the integers \(1...k\).

![](../resources/images/code-icon.png)

``` r
# the levels are encoded in alphabetical order
levels(test_df$region)
## [1] "North Central" "Northeast"     "South"         "West"
```

factor summary
--------------

-   Elements of a factor vector are its "levels".
-   The levels of a factor are the only values it can assume.
-   The number of levels \(k\) is the number of unique values in the vector.
-   Levels are encoded as integers representing the level numbers, \(1...k\).
-   Levels can be re-ordered using `factor(..., levels = c())`.
-   Many basic R functions automatically convert characters to factors.
-   Use `as.factor()` and `as.character()` for converting between factors and characters.

------------------------------------------------------------------------

[main page](../README.md)
