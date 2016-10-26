
working with factors
====================

Continue working with the `factor_play.Rmd` script in the `practiceR/scripts/` directory

unordered factors have an arbitrary order
-----------------------------------------

Suppose I wanted to reorder the integers assigned to the factor levels (useful in ordering the panel locations of multi-panel graphs, for example). For intrinsically *unordered* levels, I can select any order I want, e.g.,

![](../resources/images/code-icon.png)

``` r
first_15_rev <- factor(first_15,
        levels = c("West", "South", "North Central", "Northeast"))
```

-   `levels = c(...)` allows me to rewrite the 4 levels in the new order I want
-   `factor()` maintains the vector as a factor type

Check the new ordering:

![](../resources/images/code-icon.png)

``` r
# levels in their new order match the order I assigned above
levels(first_15_rev)
## [1] "West"          "South"         "North Central" "Northeast"
```

Compare the new integer vector to the one reported earlier:

![](../resources/images/code-icon.png)

``` r
# the integer vector for the first 15 states in their new order 
unclass(first_15_rev)[1:15]
##  [1] 2 1 1 2 1 1 4 2 2 2 1 1 3 3 3

# compared to the original integer encoding 
unclass(first_15)[1:15]
##  [1] 2 4 4 2 4 4 1 2 2 2 4 4 3 3 3
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

ordered factors have an explicit order
--------------------------------------

To explicitly assign order to a factor, we use the `factor()` function and its `order = TRUE` argument. To illustrate, Let's create a data frame listing patients by their initials and their health status.

``` r
# create fictitious patient status data
patient <- c("AB", "EF", "GH", "KL", "PQ", "ST", "YZ")
status  <- factor(c("Poor", "Poor", "Improved", "Good", "Poor", "Good", "Improved"))
patient_status <- data_frame(patient, status) 
```

-   `factor()` creates a factor vector

Examine the data frame.

``` r
# examine the data frame 
glimpse(patient_status)
## Observations: 7
## Variables: 2
## $ patient <chr> "AB", "EF", "GH", "KL", "PQ", "ST", "YZ"
## $ status  <fctr> Poor, Poor, Improved, Good, Poor, Good, Improved
```

In what order did R assign integers to the levels of `status`?

``` r
# confirm that status is a factor 
class(patient_status$status)
## [1] "factor"

# check the levels 
levels(patient_status$status)
## [1] "Good"     "Improved" "Poor"

# still an integer type? 
typeof(patient_status$status)
## [1] "integer"

# what integers are assigned? 
unclass(patient_status$status)[1:7]
## [1] 3 3 2 1 3 1 2
```

So when we constructed the factor vector, R automatically assigned the integer ordering \((1, 2, 3)\) to the levels in alphabetical order (Good, Improved, Poor).

However, patient status could be considered to have an intrinsic order: Poor is the lowest rank (1), Improved is higher (2), and Good is highest (3). We can re-order the factor in two ways.

**First**, we can use the same method shown earlier for unordered variables.

![](../resources/images/code-icon.png)

``` r
# use levels() to reorder the factor 
patient_status$status <- factor(patient_status$status, 
        levels = c("Poor", "Improved", "Good"))

# check the new levels 
levels(patient_status$status)
## [1] "Poor"     "Improved" "Good"

# still an integer type? 
typeof(patient_status$status)
## [1] "integer"

# what integers are assigned now? 
unclass(patient_status$status)[1:7]
## [1] 1 1 2 3 1 3 2
```

**Alternatively**, we can construct a special type of factor called an *ordered factor*. As the name suggests, the ordering is explicit. Using the same example as before, we add the `ordered = TRUE` argument to the `factor()` function:

![](../resources/images/code-icon.png)

``` r
# use levels() to reorder the factor 
patient_status$status <- factor(patient_status$status, 
        levels = c("Poor", "Improved", "Good"), 
        ordered = TRUE)

# check the new levels 
levels(patient_status$status)
## [1] "Poor"     "Improved" "Good"

# still an integer type? 
typeof(patient_status$status)
## [1] "integer"

# what integers are assigned now? 
unclass(patient_status$status)[1:7]
## [1] 1 1 2 3 1 3 2
```

This appears to have the same outcome as the first method, until we check the data frame structure:

``` r
glimpse(patient_status)
## Observations: 7
## Variables: 2
## $ patient <chr> "AB", "EF", "GH", "KL", "PQ", "ST", "YZ"
## $ status  <ord> Poor, Poor, Improved, Good, Poor, Good, Improved
```

What's changed?

-   Earlier we saw `status` labeled as a factor `<fctr>`
-   Here `status` is labeled as an *ordered factor* `<ord>`

converting between factors and characters
-----------------------------------------

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

The edit fails, the abbreviation is replaced with NA, and I get a warning message. The factor levels originally present *are the only values* the elements of the vector can take on.

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

`as. factor()` orders the levels in alphabetical order.

![](../resources/images/code-icon.png)

``` r
# the levels are encoded in alphabetical order
levels(test_df$region)
## [1] "North Central" "Northeast"     "South"         "West"
```

summary
-------

-   Elements of a factor vector are its "levels".
-   The levels of a factor are the only values it can assume.
-   The number of levels \(k\) is the number of unique values in the vector.
-   Levels are encoded as integers representing the level numbers, \(1...k\).
-   Levels can be arbitrarily re-ordered using `factor(..., levels = c())`.
-   An explicitly *ordered factor* is created using the `ordered = TRUE` argument.
-   Many basic R functions automatically convert characters to factors.
-   Use `as.factor()` and `as.character()` for converting between factors and characters.

but wait, there's more
----------------------

The `forcats` package by Hadley Wickham (Sep, 2016) has a great set of tools for working with factors. From the package description:

> Helpers for reordering factor levels (including moving specified levels to front, ordering by first appearance, reversing, and randomly shuffling), and tools for modifying factor levels (including collapsing rare levels into other, 'anonymising', and manually 'recoding').

------------------------------------------------------------------------

[main page](../README.md)
