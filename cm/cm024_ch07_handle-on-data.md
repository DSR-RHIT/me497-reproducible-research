
data preparation
================

overview of chapter 7
---------------------

This tutorial follows material in Chapter 7 in the text. Topics include:

-   Getting a handle on your data
-   Reshaping your data
-   Renaming variables
-   Ordering variables
-   Subsetting
-   Recoding
-   Creating new variables
-   Factors
-   Changing data types
-   Binding
-   Merging
-   Duplicates
-   Complete or incomplete cases
-   Missing values
-   NAs

start a new script in practiceR
-------------------------------

In `practiceR/scripts/`, start a new Rmd file called `chapter7.Rmd`. Write the code chunks shown below with as much of the prose as you like to explain the work.

![](../resources/images/code-icon.png) Start with the usual code chunk.

    library(knitr)
    opts_knit$set(root.dir = "../")
    opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, collapse = TRUE)

load a new data set for the exercises (section 6.3.4)
-----------------------------------------------------

Install the `WDI` package (World Bank Development Indicators)

In RStudio: *Package &gt; Install &gt; WDI*

![](../resources/images/code-icon.png)

``` r
# load the WDI package 
library(WDI)
```

The `WDI` package includes its own search function.

![](../resources/images/code-icon.png)

``` r
# search for the data on consumption of fertilizer
WDIsearch("fertilizer consumption") 
```

The output of this function is shown below. Recall that code output is shown using a double hashtag `##`. It is shown here so you can check your work...don't copy and paste output like this into your script.

    ##      indicator          
    ## [1,] "AG.CON.FERT.MT"   
    ## [2,] "AG.CON.FERT.PT.ZS"
    ## [3,] "AG.CON.FERT.ZS"   
    ##      name                                                           
    ## [1,] "Fertilizer consumption (metric tons)"                         
    ## [2,] "Fertilizer consumption (% of fertilizer production)"          
    ## [3,] "Fertilizer consumption (kilograms per hectare of arable land)"

The subset we'll use from this data is the `AG.CON.FERT.ZS`.

![](../resources/images/code-icon.png)

``` r
FertConsumpData <- WDI(indicator = "AG.CON.FERT.ZS")
```

Check you Environment pane. You should see the new object **FertConsumpData**. If not, simply use the Run menu and Run All. This executes all the R code in your file independent of the prose.

Our author uses CamelCase for variable names. My current practice generally is to use all lowercase letters separated by underscores, for example, **fert\_consump\_data**. But, because I'm following the text example, I'll use the text convention.

getting a handle on your data (7.1.1)
-------------------------------------

We covered most of the following functions in the calibration report tutorials. Use them to study your data before starting any data tidying

-   `str()`
-   `glimpse()`
-   `dim()`
-   `head()` and `tail()`
-   `summary()`
-   `rownames()` and `colnames()`
-   `nrow()` and `ncol()`
-   `typeof()`
-   `attributes()`
-   `class()`

The data we downloaded looks like this:

![](../resources/images/code-icon.png)

``` r
head(FertConsumpData)
```

    ## NULL

Looks like we have 4 variables. What data structure do we have?

![](../resources/images/code-icon.png)

``` r
library(dplyr)
glimpse(FertConsumpData)
```

    ##  NULL

-   The number of observations is the number of rows.
-   The number of variables is the number of columns.
-   This data set appears to be tidy already.

![](../resources/images/code-icon.png)

``` r
dim(FertConsumpData)
```

    ## NULL

-   `dim()` returns the dimensions of the object
-   Because **FertConsumpData** is a 2-dimensional array, we could also use `nrow()` and `ncol`

![](../resources/images/code-icon.png)

``` r
nrow(FertConsumpData)
```

    ## NULL

``` r
ncol(FertConsumpData)
```

    ## NULL

``` r
colnames(FertConsumpData)
```

    ## NULL

Examine basic statistics of the 4 columns

![](../resources/images/code-icon.png)

``` r
summary(FertConsumpData)
```

    ## Length  Class   Mode 
    ##      0   NULL   NULL

``` r
class(FertConsumpData)
```

    ## [1] "NULL"

-   From the summary, we see that we have missing values (NAs)
-   The object is a data frame (which we like)

------------------------------------------------------------------------

[main page](../README.md)
