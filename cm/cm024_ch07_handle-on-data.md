
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

In `practiceR/scripts/`, start a new Rmd file called `chapter7.Rmd`. Write the code chunks shown below with as much of the prose as yo9u like to explain the work.

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

Check you Environment pane. You should see the new object **FertConsumpData**.

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

    ##   iso2c    country AG.CON.FERT.ZS year
    ## 1    1A Arab World           74.5 2011
    ## 2    1A Arab World           63.2 2010
    ## 3    1A Arab World           58.1 2009
    ## 4    1A Arab World           64.9 2008
    ## 5    1A Arab World           61.7 2007
    ## 6    1A Arab World           59.4 2006

Looks like we have 4 variables. What data structure do we have?

![](../resources/images/code-icon.png)

``` r
library(dplyr)
glimpse(FertConsumpData)
```

    ## Observations: 1,848
    ## Variables: 4
    ## $ iso2c          <chr> "1A", "1A", "1A", "1A", "1A", "1A", "1A", "S3",...
    ## $ country        <chr> "Arab World", "Arab World", "Arab World", "Arab...
    ## $ AG.CON.FERT.ZS <dbl> 74.5, 63.2, 58.1, 64.9, 61.7, 59.4, 68.8, 74.1,...
    ## $ year           <dbl> 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2011,...

-   The number of observations is the number of rows.
-   The number of variables is the number of columns.
-   This data set appears to be tidy already.

![](../resources/images/code-icon.png)

``` r
dim(FertConsumpData)
```

    ## [1] 1848    4

-   `dim()` returns the dimensions of the object
-   Because **FertConsumpData** is a 2-dimensional array, we could also use `nrow()` and `ncol`

![](../resources/images/code-icon.png)

``` r
nrow(FertConsumpData)
```

    ## [1] 1848

``` r
ncol(FertConsumpData)
```

    ## [1] 4

``` r
colnames(FertConsumpData)
```

    ## [1] "iso2c"          "country"        "AG.CON.FERT.ZS" "year"

Examine basic statistics of the 4 columns

![](../resources/images/code-icon.png)

``` r
summary(FertConsumpData)
```

    ##     iso2c             country          AG.CON.FERT.ZS       year     
    ##  Length:1848        Length:1848        Min.   :    0   Min.   :2005  
    ##  Class :character   Class :character   1st Qu.:   20   1st Qu.:2006  
    ##  Mode  :character   Mode  :character   Median :   87   Median :2008  
    ##                                        Mean   :  229   Mean   :2008  
    ##                                        3rd Qu.:  154   3rd Qu.:2010  
    ##                                        Max.   :16532   Max.   :2011  
    ##                                        NA's   :454

``` r
class(FertConsumpData)
```

    ## [1] "data.frame"

-   From the summary, we see that we have missing values (NAs)
-   The object is a data frame (which we like)

------------------------------------------------------------------------

[main page](../README.md)
