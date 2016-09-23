
reshaping data
==============

Illustrate reshaping a data set from wide form to long form using the built-in `VADeaths` data set.

``` r
# load libraries
library(dplyr)
library(tidyr)
```

The `data()` function creates a list of data sets available in R.

``` r
# What data sets are available in my version of R? 
data()
```

One of these in the `VADeaths` data set. Type `?VADeaths` in the Console to see a description of the data set.

``` r
# Load the data into your workspace
data(VADeaths)
```

`class()` tells us the data set is a matrix.

``` r
class(VADeaths)
## [1] "matrix"
```

Let's print the data set.

``` r
VADeaths
##       Rural Male Rural Female Urban Male Urban Female
## 50-54       11.7          8.7       15.4          8.4
## 55-59       18.1         11.7       24.3         13.6
## 60-64       26.9         20.3       37.0         19.3
## 65-69       41.0         30.9       54.6         35.1
## 70-74       66.0         54.3       71.1         50.0
```

-   I see that the age group data is stored in the row names.
-   the column names contain two pieces of information: geographic location (urban or rural) and sex (male or female).

Before reshaping a data set, plan the final organization. For example, this data set has 4 variables that I'll label `Age_group`, `Geo_region`, `Sex`, and `Death_rate`. Each variable is a column in the final, tidy data set. Each row is one observation.

``` r
# convert the matrix to a data frame
df <- data.frame(VADeaths)
df
##       Rural.Male Rural.Female Urban.Male Urban.Female
## 50-54       11.7          8.7       15.4          8.4
## 55-59       18.1         11.7       24.3         13.6
## 60-64       26.9         20.3       37.0         19.3
## 65-69       41.0         30.9       54.6         35.1
## 70-74       66.0         54.3       71.1         50.0
```

Copy the data in the row names to a new column.

``` r
df <- df %>%
    mutate(Age_group = row.names(df))
df
##       Rural.Male Rural.Female Urban.Male Urban.Female Age_group
## 50-54       11.7          8.7       15.4          8.4     50-54
## 55-59       18.1         11.7       24.3         13.6     55-59
## 60-64       26.9         20.3       37.0         19.3     60-64
## 65-69       41.0         30.9       54.6         35.1     65-69
## 70-74       66.0         54.3       71.1         50.0     70-74
```

-   `mutate()` automatically eliminates the original row names

``` r
# Use select() to arrange columns
df <- df %>%
    select(Age_group, Rural.Male:Urban.Female)
df
##       Age_group Rural.Male Rural.Female Urban.Male Urban.Female
## 50-54     50-54       11.7          8.7       15.4          8.4
## 55-59     55-59       18.1         11.7       24.3         13.6
## 60-64     60-64       26.9         20.3       37.0         19.3
## 65-69     65-69       41.0         30.9       54.6         35.1
## 70-74     70-74       66.0         54.3       71.1         50.0
```

We're ready to use `gather()` to reshape the wide form to long form.

``` r
# gather from wide to long format
df <- df %>%
    gather(Geo_Sex, Death_rate, Rural.Male:Urban.Female)
```

Examine the `gather(Geo_Sex, Death_rate, Rural.Male:Urban.Female)` function one argument at a time

-   `Geo_Sex` is a new column for gathering the *column names* of the original columns labeled `Rural.Male`, `Rural.Female`, etc.
-   `Death_rate` is a new column for gathering the *column data* of the original columns labeled `Rural.Male`, `Rural.Female`, etc.
-   `Rural.Male:Urban.Female` tells R the range of columns to be gathered.

``` r
# examine the long form data frame after gathering
df
##    Age_group      Geo_Sex Death_rate
## 1      50-54   Rural.Male       11.7
## 2      55-59   Rural.Male       18.1
## 3      60-64   Rural.Male       26.9
## 4      65-69   Rural.Male       41.0
## 5      70-74   Rural.Male       66.0
## 6      50-54 Rural.Female        8.7
## 7      55-59 Rural.Female       11.7
## 8      60-64 Rural.Female       20.3
## 9      65-69 Rural.Female       30.9
## 10     70-74 Rural.Female       54.3
## 11     50-54   Urban.Male       15.4
## 12     55-59   Urban.Male       24.3
## 13     60-64   Urban.Male       37.0
## 14     65-69   Urban.Male       54.6
## 15     70-74   Urban.Male       71.1
## 16     50-54 Urban.Female        8.4
## 17     55-59 Urban.Female       13.6
## 18     60-64 Urban.Female       19.3
## 19     65-69 Urban.Female       35.1
## 20     70-74 Urban.Female       50.0
```

-   Note that the `Age_group` column from the original data frame is repeated as many times as necessary in the new long form.

Next, we separate the two pieces of information in the `Geo_Sex` column into separate columns (separate variables).

``` r
# separate the two types of data in Geo_Sex to two columns
df <- df %>%
    separate(Geo_Sex, into = c('Geo_region', 'Sex'), sep = '\\.')
```

The character the denotes the separation (in this case) is a period. If you look at the help page for `separate()`, you'll see that the separation character has to be a regular expression., thus we have to "escape" the period by writing `sep = '\.'`. This creates an error too because we have to escape the backslash, hence `sep = '\\.'`.

``` r
# examine data frame after separating geography from sex
df
##    Age_group Geo_region    Sex Death_rate
## 1      50-54      Rural   Male       11.7
## 2      55-59      Rural   Male       18.1
## 3      60-64      Rural   Male       26.9
## 4      65-69      Rural   Male       41.0
## 5      70-74      Rural   Male       66.0
## 6      50-54      Rural Female        8.7
## 7      55-59      Rural Female       11.7
## 8      60-64      Rural Female       20.3
## 9      65-69      Rural Female       30.9
## 10     70-74      Rural Female       54.3
## 11     50-54      Urban   Male       15.4
## 12     55-59      Urban   Male       24.3
## 13     60-64      Urban   Male       37.0
## 14     65-69      Urban   Male       54.6
## 15     70-74      Urban   Male       71.1
## 16     50-54      Urban Female        8.4
## 17     55-59      Urban Female       13.6
## 18     60-64      Urban Female       19.3
## 19     65-69      Urban Female       35.1
## 20     70-74      Urban Female       50.0
```

We can rearrange the data frame by rows and columns if that helps readability.

``` r
# use arrange() to arrange by row 
# use select() to arrange by columns
df <- df %>%
    arrange(Sex, Geo_region, Age_group) %>%
    select(Sex, Geo_region, Age_group, Death_rate)
df
##       Sex Geo_region Age_group Death_rate
## 1  Female      Rural     50-54        8.7
## 2  Female      Rural     55-59       11.7
## 3  Female      Rural     60-64       20.3
## 4  Female      Rural     65-69       30.9
## 5  Female      Rural     70-74       54.3
## 6  Female      Urban     50-54        8.4
## 7  Female      Urban     55-59       13.6
## 8  Female      Urban     60-64       19.3
## 9  Female      Urban     65-69       35.1
## 10 Female      Urban     70-74       50.0
## 11   Male      Rural     50-54       11.7
## 12   Male      Rural     55-59       18.1
## 13   Male      Rural     60-64       26.9
## 14   Male      Rural     65-69       41.0
## 15   Male      Rural     70-74       66.0
## 16   Male      Urban     50-54       15.4
## 17   Male      Urban     55-59       24.3
## 18   Male      Urban     60-64       37.0
## 19   Male      Urban     65-69       54.6
## 20   Male      Urban     70-74       71.1
```

Take one last check of the types of data in this data set.

``` r
glimpse(df)
## Observations: 20
## Variables: 4
## $ Sex        <chr> "Female", "Female", "Female", "Female", "Female", "...
## $ Geo_region <chr> "Rural", "Rural", "Rural", "Rural", "Rural", "Urban...
## $ Age_group  <chr> "50-54", "55-59", "60-64", "65-69", "70-74", "50-54...
## $ Death_rate <dbl> 8.7, 11.7, 20.3, 30.9, 54.3, 8.4, 13.6, 19.3, 35.1,...
```

------------------------------------------------------------------------

[main page](../README.md)
