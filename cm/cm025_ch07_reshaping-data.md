
reshaping data
==============

-   Please launch the `practiceR` project.
-   Open the `chapter7.Rmd` script and continue adding to it from this tutorial.

``` r
# packages 
library(dplyr)
library(tidyr)
library(WDI)
```

data set
--------

We'll continue with the `WDI` data set we loaded in the previous tutorial. The variables in the data frame include:

-   `iso2c` International 2-character country abbreviation
-   `AG.CON.FERT.ZS` Fertilizer consumption in kg per hectare

Check for NAs using `summary()`

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

We have 454 NAs in the fertilizer consumption column, or 25% of the 1848 observations. Afdter we delete the NA entries, we should end up with 1394 rows.

To delete the NAS rows, start with `is.na()`

``` r
find_NA <- is.na(FertConsumpData$AG.CON.FERT.ZS)
# examine the first 50 entries
find_NA[1:50]
```

    ##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [34] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [45]  TRUE  TRUE  TRUE  TRUE FALSE FALSE

-   `is.na()` returns a logical vector with TRUE identifying the entries that are NA and FALSE identifying the entries that are not NA

We would prefer TRUE for the values to keep (not NA) and FALSE for the values that are NA. To do that, we use the logical NOT (`!`) as follows,

``` r
find_not_NA <- !is.na(FertConsumpData$AG.CON.FERT.ZS)
# examine the first 50 entries
find_not_NA[1:50]
```

    ##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [23]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [34]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [45] FALSE FALSE FALSE FALSE  TRUE  TRUE

-   `!is.na()` is the same as saying, "assign TRUE to data entries that are NOT NA"
-   Compare these 50 results with the previous set and you'll see that we have reversed the position of TRUE and FALSE.
-   **find\_not\_NA** has the same number of rows as the data set

Now we can subset the original data frame by keeping those rows that are indexed in **keep\_these**

``` r
FertConsumpData <- FertConsumpData %>%
    filter(find_not_NA)
```

-   `filter()` keeps rows for which **find\_not\_NA** is TRUE

``` r
summary(FertConsumpData)
```

    ##     iso2c             country          AG.CON.FERT.ZS       year     
    ##  Length:1394        Length:1394        Min.   :    0   Min.   :2005  
    ##  Class :character   Class :character   1st Qu.:   20   1st Qu.:2006  
    ##  Mode  :character   Mode  :character   Median :   87   Median :2008  
    ##                                        Mean   :  229   Mean   :2008  
    ##                                        3rd Qu.:  154   3rd Qu.:2010  
    ##                                        Max.   :16532   Max.   :2011

The NAs are gone.

long to wide
------------

Reshaping data from long form to wide form is useful when you want to create a data table for a report.

Use the `spread()` function to convert the long form `FertConsumpData` to wide form. `spread()` is the dual to `gather()`

![](../resources/images/code-icon.png)

``` r
SpreadFert <- FertConsumpData %>%
    spread(year, AG.CON.FERT.ZS)
```

-   `year` tells `spread()` to take the unique values originally in the **year** column and spread them out as the names of the new columns, e.g. **2005**, **2006**, etc.
-   `AG.CON.FERT.ZS` tells `spread()` that the data in the new columns comes from the original **AG.CON.FERT.ZS** column.

``` r
# examine the result 
glimpse(SpreadFert)
```

    ## Observations: 203
    ## Variables: 9
    ## $ iso2c   <chr> "1A", "1W", "7E", "8S", "AE", "AF", "AG", "AL", "AM", ...
    ## $ country <chr> "Arab World", "World", "Europe & Central Asia (excludi...
    ## $ 2005    <dbl> 68.813, 104.755, 25.661, 124.285, 218.544, 4.240, 6.00...
    ## $ 2006    <dbl> 5.94e+01, 1.08e+02, 3.17e+01, 1.31e+02, 9.11e+02, 6.29...
    ## $ 2007    <dbl> 61.657, 113.608, 33.839, 134.698, 1104.933, 3.619, 0.5...
    ## $ 2008    <dbl> 64.878, 108.481, 33.635, 143.780, 423.643, 2.988, 3.50...
    ## $ 2009    <dbl> 58.08, 107.40, 37.80, 157.76, 1324.85, 4.52, 13.25, 89...
    ## $ 2010    <dbl> 63.24, 116.21, 37.77, 166.44, 674.90, 4.25, 3.00, 97.3...
    ## $ 2011    <dbl> 74.51, 120.55, 41.05, 168.76, 757.65, 6.33, 3.25, 97.1...

Then arrange the rows by country

![](../resources/images/code-icon.png)

``` r
SpreadFert <- SpreadFert %>%
    arrange(country)
head(SpreadFert)
```

    ##   iso2c             country   2005  2006  2007  2008  2009  2010  2011
    ## 1    AF         Afghanistan   4.24  6.29  3.62  2.99  4.52  4.25  6.33
    ## 2    AL             Albania 111.60 85.09 87.17 75.88 89.39 97.32 97.14
    ## 3    DZ             Algeria   7.43 13.26 14.96  8.58 13.99 19.48 17.49
    ## 4    AO              Angola   2.26  3.66  3.31  8.26  5.47  8.43  8.17
    ## 5    AG Antigua and Barbuda   6.00  4.50  0.50  3.50 13.25  3.00  3.25
    ## 6    1A          Arab World  68.81 59.43 61.66 64.88 58.08 63.24 74.51

Summarize, see what we have.

``` r
summary(SpreadFert)
```

    ##     iso2c             country               2005            2006      
    ##  Length:203         Length:203         Min.   :    0   Min.   :    0  
    ##  Class :character   Class :character   1st Qu.:   18   1st Qu.:   20  
    ##  Mode  :character   Mode  :character   Median :   90   Median :   91  
    ##                                        Mean   :  248   Mean   :  284  
    ##                                        3rd Qu.:  152   3rd Qu.:  147  
    ##                                        Max.   :13753   Max.   :16532  
    ##                                        NA's   :6       NA's   :5      
    ##       2007            2008            2009           2010     
    ##  Min.   :    0   Min.   :    0   Min.   :   0   Min.   :   0  
    ##  1st Qu.:   21   1st Qu.:   18   1st Qu.:  20   1st Qu.:  23  
    ##  Median :   90   Median :   87   Median :  77   Median :  84  
    ##  Mean   :  255   Mean   :  231   Mean   : 163   Mean   : 188  
    ##  3rd Qu.:  164   3rd Qu.:  144   3rd Qu.: 129   3rd Qu.: 162  
    ##  Max.   :16243   Max.   :16267   Max.   :4663   Max.   :6226  
    ##  NA's   :5       NA's   :5       NA's   :2      NA's   :2     
    ##       2011      
    ##  Min.   :    0  
    ##  1st Qu.:   27  
    ##  Median :   95  
    ##  Mean   :  235  
    ##  3rd Qu.:  169  
    ##  Max.   :11719  
    ##  NA's   :2

Some NAs have reapperaed! Why?

-   When we spread by year, we find that not all countries have data for all years.
-   R automatically places an NA in those missing data values.

Suppose we decide that we only want to use countries where we have data in every year. I'll use the `complete.cases()` function to remove rows that do not have data entries for all years.

``` r
find_complete <- complete.cases(SpreadFert)
CompleteSpreadFert <- SpreadFert %>%
    filter(find_complete)
summary(CompleteSpreadFert)
```

    ##     iso2c             country               2005            2006      
    ##  Length:194         Length:194         Min.   :    0   Min.   :    0  
    ##  Class :character   Class :character   1st Qu.:   20   1st Qu.:   20  
    ##  Mode  :character   Mode  :character   Median :   92   Median :   91  
    ##                                        Mean   :  251   Mean   :  288  
    ##                                        3rd Qu.:  152   3rd Qu.:  147  
    ##                                        Max.   :13753   Max.   :16532  
    ##       2007            2008            2009           2010     
    ##  Min.   :    0   Min.   :    0   Min.   :   0   Min.   :   0  
    ##  1st Qu.:   21   1st Qu.:   19   1st Qu.:  21   1st Qu.:  23  
    ##  Median :   90   Median :   87   Median :  77   Median :  85  
    ##  Mean   :  259   Mean   :  234   Mean   : 166   Mean   : 192  
    ##  3rd Qu.:  164   3rd Qu.:  144   3rd Qu.: 129   3rd Qu.: 163  
    ##  Max.   :16243   Max.   :16267   Max.   :4663   Max.   :6226  
    ##       2011      
    ##  Min.   :    0  
    ##  1st Qu.:   27  
    ##  Median :   96  
    ##  Mean   :  241  
    ##  3rd Qu.:  169  
    ##  Max.   :11719

Now those NAs are gone.

Ready to display as a table, omitting the second (country) column to make the table narrower.

``` r
# rond the number to two decimals
CompleteSpreadFert[3:9] <- round(CompleteSpreadFert[3:9], 2)
# all rows, omit column 2
kable(CompleteSpreadFert[ , -2])
```

| iso2c |      2005|      2006|      2007|      2008|     2009|     2010|      2011|
|:------|---------:|---------:|---------:|---------:|--------:|--------:|---------:|
| AF    |      4.24|      6.29|      3.62|      2.99|     4.52|     4.25|      6.33|
| AL    |    111.60|     85.09|     87.17|     75.88|    89.39|    97.32|     97.14|
| DZ    |      7.43|     13.26|     14.96|      8.58|    13.99|    19.48|     17.49|
| AO    |      2.26|      3.66|      3.31|      8.26|     5.47|     8.43|      8.17|
| AG    |      6.00|      4.50|      0.50|      3.50|    13.25|     3.00|      3.25|
| 1A    |     68.81|     59.43|     61.66|     64.88|    58.08|    63.24|     74.51|
| AR    |     36.40|     41.41|     49.26|     35.21|    22.98|    39.18|     41.72|
| AM    |     22.69|     27.84|     15.33|     18.15|    29.67|    24.20|     27.37|
| AU    |     44.85|     43.46|     46.81|     42.60|    36.25|    46.32|     45.28|
| AT    |    135.72|    130.68|    110.25|    110.05|    83.41|   108.49|    103.38|
| AZ    |     13.36|     13.34|     10.64|     20.94|    13.41|     9.95|     15.57|
| BH    |   2906.67|   9436.55|    798.57|   1993.33|   947.79|  1721.25|   1178.12|
| BD    |    197.75|    193.19|    184.41|    200.06|   188.85|   212.96|    271.31|
| BB    |    109.08|    139.00|    133.62|    135.15|    77.00|   135.08|     96.27|
| BY    |    167.70|    231.97|    218.35|    237.42|   281.11|   270.46|    303.89|
| BE    |    329.14|    316.45|    316.39|    328.91|   246.54|   279.17|    286.54|
| BZ    |     81.00|     89.26|     60.87|     49.76|   121.44|    58.01|    234.71|
| BJ    |      0.45|      0.01|      0.25|      0.31|     6.68|     8.99|      5.42|
| BT    |      7.56|      7.62|      9.01|     11.66|    23.96|    10.04|     13.05|
| BO    |      6.47|      4.01|      6.25|      4.98|     5.57|     7.86|      8.36|
| BA    |     24.64|     15.48|     21.30|     11.87|    72.71|    81.53|    103.84|
| BR    |    120.10|    124.03|    165.17|    141.84|   118.26|   156.19|    183.01|
| BN    |    308.50|     66.00|    377.00|    112.67|   103.00|   431.75|    117.50|
| BG    |     74.23|     73.94|    102.01|    111.24|   104.60|    97.05|    133.08|
| BF    |     15.24|     13.40|     10.10|      9.53|     9.45|     9.43|     10.70|
| BI    |      3.55|      3.34|      2.02|      2.17|     1.86|     3.63|      5.63|
| KH    |      8.11|      7.79|      8.75|      7.25|     9.58|    11.51|     15.47|
| CM    |      8.00|      9.03|      8.62|      6.56|     7.00|     9.24|     11.10|
| CA    |     61.82|     46.99|     68.60|     63.96|    62.21|    69.18|     85.24|
| S3    |     57.87|     87.92|     48.09|    114.62|    58.03|    81.27|     74.06|
| B8    |    106.61|    108.36|    120.13|    112.63|    96.59|   113.38|    115.24|
| CL    |    434.76|    475.81|    532.41|    691.46|   610.55|   373.25|    562.19|
| CN    |    308.47|    325.82|    332.19|    335.58|   342.73|   349.35|    357.28|
| CO    |    445.13|    571.25|    544.29|    486.73|   497.27|   585.19|    745.30|
| CD    |      0.07|      0.45|      0.63|      0.94|     0.80|     1.10|      1.58|
| CG    |      0.07|      0.05|      0.36|      0.75|     4.58|     0.54|      0.40|
| CR    |    980.88|    826.70|    790.20|    707.48|   753.24|   544.99|    712.54|
| CI    |     17.78|     22.77|     23.99|     18.21|    15.31|    32.09|     19.37|
| HR    |    294.51|    380.79|    410.06|    495.23|   164.68|   297.31|    310.99|
| CU    |     22.38|     32.12|     35.70|     43.58|    17.60|    29.90|     41.59|
| CY    |    108.98|    109.03|    109.84|    112.01|   181.45|   204.01|    151.20|
| CZ    |     89.56|     94.27|    100.17|     87.26|    88.52|    95.85|    100.58|
| DK    |    137.12|    138.58|    142.41|    147.68|   102.92|   113.71|    112.85|
| DM    |    207.80|    134.20|    276.00|     44.60|    58.17|    52.17|     78.00|
| DO    |     58.24|     80.47|     94.76|     80.40|    80.56|   107.01|     94.78|
| V2    |    100.42|    105.09|    108.94|    109.52|   115.45|   122.21|    125.37|
| Z4    |    214.42|    222.40|    234.86|    230.26|   228.55|   239.81|    240.77|
| EC    |    150.83|    207.79|    199.11|    214.12|   187.28|   252.07|    275.36|
| EG    |    672.88|    492.12|    521.79|    696.59|   502.83|   602.99|    600.47|
| SV    |    130.60|    108.77|    152.61|    127.90|   117.32|   179.36|    186.78|
| EE    |     61.03|     75.80|     76.04|    100.33|    69.46|    68.39|     71.56|
| ET    |     10.90|     11.13|     16.04|     17.20|    17.66|    21.85|     20.82|
| XC    |    179.40|    174.52|    187.12|    144.08|   128.85|   156.05|    150.12|
| Z7    |     70.03|     72.54|     77.39|     67.39|    65.66|    72.88|     73.70|
| 7E    |     25.66|     31.72|     33.84|     33.63|    37.80|    37.77|     41.05|
| T7    |     33.34|     39.17|     42.05|     41.17|    43.50|    44.96|     47.77|
| EU    |    160.19|    156.83|    169.08|    138.45|   124.69|   147.06|    143.75|
| FJ    |     39.18|     25.12|     23.94|     41.12|    21.81|    16.35|     57.45|
| FI    |    134.22|    134.50|    123.50|    130.58|   107.98|   124.08|    150.97|
| FR    |    192.49|    190.39|    209.34|    152.45|   120.56|   150.51|    141.30|
| PF    |    251.33|    262.00|    279.67|    307.33|   272.40|   326.40|    305.20|
| GA    |      8.34|      8.46|      9.06|     10.52|    12.02|     3.16|     10.00|
| GM    |      9.76|     10.83|      8.98|      4.26|     6.34|     7.30|     10.28|
| GE    |     53.29|     47.53|     41.34|     37.53|    43.25|    33.65|     63.29|
| DE    |    208.76|    194.42|    221.87|    159.58|   181.41|   211.60|    191.49|
| GH    |      6.00|     20.06|     17.76|     14.55|    18.98|    18.70|     13.23|
| GR    |    143.04|    124.63|     96.90|    119.05|    63.10|   122.50|    159.71|
| GT    |    141.69|    136.04|    123.77|     92.01|   127.07|   189.15|    223.19|
| GN    |      0.92|      0.88|      1.21|      1.30|     0.63|     0.93|      3.60|
| GY    |     22.10|     32.58|     32.65|     56.80|    20.25|    39.32|     27.84|
| XE    |      8.16|      9.10|     10.02|      9.14|     8.77|    11.21|     11.61|
| XD    |    127.10|    127.01|    133.46|    116.35|   106.96|   120.61|    125.46|
| HN    |    160.85|    188.84|    178.00|    107.73|    62.32|    64.72|    104.07|
| HK    |    365.80|    390.00|    421.00|     99.00|    38.00|   616.29|    790.57|
| HU    |     85.20|     99.20|    110.41|     96.70|    77.48|    84.33|     93.29|
| XF    |    117.74|    122.90|    131.10|    130.74|   130.62|   140.68|    146.15|
| IS    |    133.56|    167.82|    194.17|    199.88|   123.85|   148.70|    159.17|
| ZT    |     98.22|    102.60|    108.43|    107.58|   108.99|   116.21|    120.40|
| XH    |     69.78|     76.45|     75.01|     73.38|    92.38|    86.15|     80.56|
| XI    |     18.74|     19.58|     20.25|     19.33|    18.47|    21.58|     25.52|
| XG    |     37.42|     41.11|     40.70|     39.09|    44.44|    44.29|     45.11|
| IN    |    127.61|    136.40|    142.84|    153.35|   167.46|   179.04|    180.75|
| ID    |    143.99|    158.02|    181.46|    184.53|   181.64|   181.52|    198.42|
| IR    |     95.05|    113.96|     90.04|     99.85|    76.74|    58.25|     31.26|
| IQ    |     41.61|     46.25|     37.57|     56.94|    72.49|    34.29|     39.10|
| IE    |    458.04|    431.88|    427.52|    378.11|   477.37|   462.44|    430.48|
| IL    |    292.60|    304.95|    345.00|    280.61|   200.46|   206.40|    229.96|
| IT    |    171.75|    177.03|    190.23|    143.48|   120.11|   122.75|    134.32|
| JM    |    115.84|     63.52|     36.22|     37.64|    58.19|    62.62|     71.17|
| JP    |    347.97|    332.83|    350.47|    278.23|   238.93|   259.83|    268.31|
| JO    |    784.02|    693.47|   1007.78|    337.44|   394.86|   187.72|   1227.59|
| KZ    |      1.43|      1.45|      2.06|      1.08|     1.97|     2.05|      3.00|
| KE    |     34.33|     33.15|     36.40|     33.29|    31.86|    30.35|     43.58|
| KR    |    643.36|    469.85|    511.04|    441.05|   331.96|   336.05|    334.91|
| KW    |   4349.09|   2090.91|      0.00|   1261.95|    57.14|   884.00|    971.81|
| KG    |     24.63|     22.20|     22.45|     18.97|    22.07|    22.66|     19.17|
| V3    |    137.89|    142.31|    154.00|    149.71|   147.16|   158.45|    165.45|
| ZJ    |     97.00|     99.51|    120.08|    103.40|    89.11|   112.87|    129.35|
| XJ    |    108.95|    111.30|    136.98|    116.63|   101.91|   132.48|    152.43|
| T2    |     98.79|    101.08|    122.01|    104.73|    90.68|   114.63|    131.15|
| LV    |     68.04|     62.66|     67.72|     66.95|    64.88|    77.65|     83.23|
| LB    |    313.76|    297.87|    320.10|    219.59|   234.29|   296.74|    409.10|
| LY    |     67.13|     42.31|     60.96|     27.27|    33.67|    18.66|     38.61|
| LT    |     97.56|    102.17|     90.07|     86.68|    44.26|   103.53|     77.63|
| XO    |     98.49|    102.95|    108.64|    108.21|   110.52|   117.62|    121.90|
| XM    |      6.93|      7.67|      8.41|      8.03|     7.90|    10.30|     10.44|
| XN    |     94.24|     98.37|    102.75|    107.58|   116.13|   121.57|    124.55|
| LU    |    313.15|    293.63|    276.41|    250.52|   244.58|   258.19|    270.61|
| MK    |     62.02|     57.47|     67.12|     56.16|    56.70|    67.11|     63.62|
| MG    |      5.45|      2.47|      3.19|      4.14|     2.27|     2.42|      3.16|
| MW    |     30.49|     36.82|     41.72|     34.87|    30.85|    35.38|     29.52|
| MY    |   1457.36|   1662.10|   1836.52|   2026.90|  1527.60|  2002.72|   1869.88|
| MV    |     29.67|    117.67|     87.33|     16.75|    66.50|    63.33|    102.82|
| ML    |     15.69|     17.50|     31.05|     22.48|     6.09|    19.60|     22.01|
| MT    |    105.61|    148.00|    110.75|     74.00|    54.25|    63.77|     71.70|
| MU    |    352.15|    257.87|    282.22|    228.78|   227.96|   163.20|    243.23|
| MX    |     79.19|     69.03|     75.04|     52.16|    51.92|    75.06|     72.88|
| ZQ    |    100.73|     97.17|     92.47|     99.07|    82.52|    81.68|     84.18|
| XQ    |     98.04|     93.81|     86.76|     98.34|    81.85|    77.62|     74.83|
| T3    |     98.04|     93.81|     86.76|     98.34|    81.85|    77.62|     74.83|
| XP    |    108.81|    113.69|    120.23|    120.23|   123.11|   131.05|    136.10|
| MD    |      9.00|      8.46|     11.02|     12.45|     9.36|    11.06|     13.05|
| MN    |      5.26|      9.36|      8.56|      8.32|    12.17|    18.05|     22.86|
| MA    |     63.79|     60.17|     58.83|     53.83|    41.07|    57.17|     54.70|
| MZ    |      1.43|      4.64|      2.66|     11.42|     4.03|     8.20|      7.36|
| MM    |      6.52|      9.02|     15.77|      7.61|     6.24|     6.64|     15.22|
| NA    |      1.91|      2.85|      2.46|      0.29|     1.59|     4.43|      6.61|
| NP    |      3.57|      5.64|      1.61|      1.36|    18.20|    25.09|     34.88|
| NL    |    337.81|    353.15|    302.14|    267.71|   238.17|   293.33|    246.81|
| NC    |    282.50|    240.00|    267.65|    199.41|    99.41|   150.00|    171.69|
| NZ    |   2718.69|   2494.98|   2304.61|   1726.61|  1271.82|  1270.64|   1780.61|
| NI    |     28.11|     32.63|     31.47|     27.11|    34.69|    34.74|     51.57|
| NE    |      0.39|      0.53|      0.35|      0.15|     0.35|     0.50|      0.49|
| NG    |      7.20|     10.04|      4.21|      5.88|     5.26|    12.21|      6.56|
| XU    |    106.38|    108.81|    111.44|    102.02|    98.44|   106.68|    116.30|
| NO    |    218.87|    216.42|    220.42|    213.56|   179.10|   169.98|    192.63|
| OE    |    121.07|    120.28|    126.29|    108.88|   103.21|   115.25|    119.61|
| OM    |   1365.82|   1063.62|    363.75|    724.10|   632.43|   113.88|    653.60|
| PK    |    123.48|    125.73|    118.42|    119.15|   144.33|   138.30|    128.53|
| PA    |     34.42|     38.40|     34.09|     35.81|    47.55|    63.76|     67.46|
| PG    |     71.41|     58.89|     75.85|     70.70|   103.85|   109.48|     85.48|
| PY    |     65.76|     72.72|     94.31|     74.70|    62.73|    82.10|     97.64|
| PE    |     76.72|     85.42|    100.56|     74.07|    93.16|    89.52|     98.64|
| PH    |    152.16|    138.56|    159.31|    104.97|   121.45|   151.44|    144.00|
| PL    |    161.94|    159.34|    181.17|    157.72|   147.27|   180.48|    169.74|
| PT    |    207.12|    135.29|    209.44|    161.61|   119.38|   150.08|    132.13|
| V4    |    113.16|    114.05|    119.81|    105.53|    97.30|   109.66|    114.78|
| V1    |      8.39|      9.31|      8.25|      8.71|     8.67|    10.92|     10.62|
| QA    |    633.53|      0.00|   5413.85|    217.13|  3039.68|  6225.78|  11718.93|
| RO    |     51.35|     40.60|     44.64|     45.64|    48.49|    52.55|     54.13|
| RU    |     11.79|     12.48|     14.25|     15.88|    15.62|    16.07|     16.41|
| RW    |      3.14|      3.52|      7.91|      9.62|     1.29|     0.08|      0.10|
| WS    |      3.36|      2.31|      3.80|      5.44|     4.43|     2.00|      1.88|
| SA    |     93.90|     98.78|    118.82|     77.60|    43.82|    92.04|    148.32|
| SN    |      9.87|      2.31|      2.11|      2.27|     6.29|     8.10|      7.67|
| SC    |     34.00|     11.00|     30.00|     34.00|    52.00|    32.22|    562.50|
| SG    |  13753.03|  16532.31|  16242.86|  16266.67|  4663.33|  3131.25|   4373.02|
| SK    |     80.50|     91.78|     89.95|     75.08|    78.31|    85.06|     95.94|
| SI    |    329.55|    322.01|    324.53|    285.14|   246.19|   288.94|    281.25|
| ZA    |     47.33|     62.34|     61.02|     56.29|    60.25|    53.78|     60.34|
| 8S    |    124.29|    131.39|    134.70|    143.78|   157.76|   166.44|    168.76|
| T5    |    124.29|    131.39|    134.70|    143.78|   157.76|   166.44|    168.76|
| ES    |    142.14|    142.33|    157.72|    106.54|    96.93|   130.68|    122.62|
| LK    |    255.29|    291.32|    288.52|    311.71|   281.38|   229.05|    256.12|
| KN    |     13.85|     22.61|     12.53|     20.50|    12.75|    11.33|     10.40|
| ZG    |     10.95|     13.06|     12.53|     12.25|    12.50|    15.06|     14.56|
| ZF    |     10.95|     13.06|     12.53|     12.25|    12.50|    15.06|     14.56|
| T6    |     10.95|     13.06|     12.53|     12.25|    12.50|    15.06|     14.56|
| SD    |      2.68|      2.55|      3.59|      3.84|     8.43|    10.79|      9.41|
| SR    |    106.37|    183.33|    149.43|    548.66|   158.29|   211.93|    206.29|
| SE    |     87.90|     86.42|     89.47|     99.16|    64.01|    81.85|     85.33|
| CH    |    227.96|    228.65|    229.90|    227.27|   190.83|   218.38|    212.16|
| SY    |     84.95|     84.54|     80.65|     87.99|    65.42|    33.02|     49.42|
| TJ    |     37.82|     73.95|     74.13|     70.45|    64.93|    54.22|     59.39|
| TZ    |      5.75|      5.40|      5.07|      4.68|     7.52|     8.79|      8.61|
| TH    |    112.73|    117.40|    124.95|    130.52|   122.06|   162.16|    159.80|
| TG    |      9.68|      5.48|      6.28|      0.00|     6.16|     8.96|     10.20|
| TO    |     95.00|     48.93|     10.13|     10.80|   277.75|   254.12|    115.12|
| TT    |    160.84|    939.80|     67.84|    868.00|   274.96|   659.68|     87.64|
| TN    |     64.09|     34.54|     27.12|     34.38|    43.53|    40.40|     51.42|
| TR    |     86.76|     91.84|     90.34|     71.97|   104.57|    98.38|    105.39|
| UG    |      0.97|      1.25|      1.20|      2.94|     2.08|     1.72|      1.76|
| UA    |     17.19|     21.55|     27.64|     32.79|    27.30|    32.66|     38.87|
| AE    |    218.54|    911.46|   1104.93|    423.64|  1324.85|   674.90|    757.65|
| GB    |    272.82|    254.18|    254.07|    208.16|   239.87|   251.93|    238.70|
| US    |    118.60|    126.20|    123.27|    112.43|   108.49|   117.12|    125.10|
| XT    |    120.49|    126.14|    134.52|    130.57|   128.76|   138.78|    145.48|
| UY    |    140.56|    148.70|    139.51|    104.41|    93.93|   145.78|    131.59|
| VE    |    166.75|    122.72|    135.50|    177.97|   166.18|   170.69|    170.37|
| VN    |    292.27|    300.17|    353.01|    305.70|   407.72|   323.34|    311.46|
| 1W    |    104.76|    107.79|    113.61|    108.48|   107.40|   116.21|    120.55|
| YE    |      3.81|      8.42|     21.41|     14.63|    12.04|    19.46|     12.40|
| ZM    |     27.98|     25.68|     32.33|     38.66|    25.78|    29.17|     46.15|
| ZW    |     21.80|     32.36|     27.04|     21.99|    28.78|    34.08|     29.45|

In a report, we might list the full table in an appaendix with possibly an subset shown in the main report to show representative values.

wide to long
------------

We covered this last week using the VADeaths data set.

-   [Reshaping data from wide to long form](cm021_reshaping-data.md)
-   [Visual interpretation of the gather function](../slides/slides004_visual-gather.pdf) (slides)

For practice, we can reshape the fertilizer consumptioon data from wide back to long.

``` r
CompleteLongFert <- CompleteSpreadFert %>%
    gather(year, fert_consump, 3:9)
# look at the result
head(CompleteLongFert)
```

    ##   iso2c             country year fert_consump
    ## 1    AF         Afghanistan 2005         4.24
    ## 2    AL             Albania 2005       111.60
    ## 3    DZ             Algeria 2005         7.43
    ## 4    AO              Angola 2005         2.26
    ## 5    AG Antigua and Barbuda 2005         6.00
    ## 6    1A          Arab World 2005        68.81

``` r
glimpse(CompleteLongFert)
```

    ## Observations: 1,358
    ## Variables: 4
    ## $ iso2c        <chr> "AF", "AL", "DZ", "AO", "AG", "1A", "AR", "AM", "...
    ## $ country      <chr> "Afghanistan", "Albania", "Algeria", "Angola", "A...
    ## $ year         <chr> "2005", "2005", "2005", "2005", "2005", "2005", "...
    ## $ fert_consump <dbl> 4.24, 111.60, 7.43, 2.26, 6.00, 68.81, 36.40, 22....

Convert **year** back to a number

``` r
CompleteLongFert$year <- as.numeric(CompleteLongFert$year)
glimpse(CompleteLongFert)
```

    ## Observations: 1,358
    ## Variables: 4
    ## $ iso2c        <chr> "AF", "AL", "DZ", "AO", "AG", "1A", "AR", "AM", "...
    ## $ country      <chr> "Afghanistan", "Albania", "Algeria", "Angola", "A...
    ## $ year         <dbl> 2005, 2005, 2005, 2005, 2005, 2005, 2005, 2005, 2...
    ## $ fert_consump <dbl> 4.24, 111.60, 7.43, 2.26, 6.00, 68.81, 36.40, 22....

``` r
head(CompleteLongFert)
```

    ##   iso2c             country year fert_consump
    ## 1    AF         Afghanistan 2005         4.24
    ## 2    AL             Albania 2005       111.60
    ## 3    DZ             Algeria 2005         7.43
    ## 4    AO              Angola 2005         2.26
    ## 5    AG Antigua and Barbuda 2005         6.00
    ## 6    1A          Arab World 2005        68.81

Cool!

------------------------------------------------------------------------

[main page](../README.md)
