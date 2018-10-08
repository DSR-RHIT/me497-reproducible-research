
# Case study in tidying data

From section [12.6](http://r4ds.had.co.nz/tidy-data.html#case-study) in
R for Data Science.

The `who` dataset is in the tidyr package, part of the
    tidyverse

``` r
library(tidyverse)
```

    ## -- Attaching packages ---------------------------------------------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.0.0.9000     v purrr   0.2.5     
    ## v tibble  1.4.2          v dplyr   0.7.6     
    ## v tidyr   0.8.1          v stringr 1.3.1     
    ## v readr   1.1.1          v forcats 0.3.0

    ## -- Conflicts ------------------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
glimpse(who)
```

    ## Observations: 7,240
    ## Variables: 60
    ## $ country      <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afg...
    ## $ iso2         <chr> "AF", "AF", "AF", "AF", "AF", "AF", "AF", "AF", "...
    ## $ iso3         <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", ...
    ## $ year         <int> 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1...
    ## $ new_sp_m014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_m65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sp_f65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_m65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_sn_f65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_m65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ new_ep_f65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_m65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f014  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f1524 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f2534 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f3544 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f4554 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f5564 <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ newrel_f65   <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...

  - The first three apprear to be redundant encodings of the country
    name.
  - Year appears to be a variable
  - The remnaining column headings appear to encode another variable

Type `? who` in the Console to see what the authors state are the
variables.

    ? who

The data under the encoded columns are “Counts of new TB cases recorded
by group”.

``` r
who1 <- who %>% 
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)

who1
```

    ## # A tibble: 76,046 x 6
    ##    country     iso2  iso3   year key         cases
    ##  * <chr>       <chr> <chr> <int> <chr>       <int>
    ##  1 Afghanistan AF    AFG    1997 new_sp_m014     0
    ##  2 Afghanistan AF    AFG    1998 new_sp_m014    30
    ##  3 Afghanistan AF    AFG    1999 new_sp_m014     8
    ##  4 Afghanistan AF    AFG    2000 new_sp_m014    52
    ##  5 Afghanistan AF    AFG    2001 new_sp_m014   129
    ##  6 Afghanistan AF    AFG    2002 new_sp_m014    90
    ##  7 Afghanistan AF    AFG    2003 new_sp_m014   127
    ##  8 Afghanistan AF    AFG    2004 new_sp_m014   139
    ##  9 Afghanistan AF    AFG    2005 new_sp_m014   151
    ## 10 Afghanistan AF    AFG    2006 new_sp_m014   193
    ## # ... with 76,036 more rows

Use count to assess the new key column

``` r
who1 %>% 
  count(key)
```

    ## # A tibble: 56 x 2
    ##    key              n
    ##    <chr>        <int>
    ##  1 new_ep_f014   1032
    ##  2 new_ep_f1524  1021
    ##  3 new_ep_f2534  1021
    ##  4 new_ep_f3544  1021
    ##  5 new_ep_f4554  1017
    ##  6 new_ep_f5564  1017
    ##  7 new_ep_f65    1014
    ##  8 new_ep_m014   1038
    ##  9 new_ep_m1524  1026
    ## 10 new_ep_m2534  1020
    ## # ... with 46 more rows

From the help page:

> The data uses the original codes given by the World Health
> Organization.
> 
> The column names for columns five through 60 are made by combining
> new\_ to a code for method of diagnosis new = new cases, old = old
> cases
> 
> type of TB rel = relapse  
> sn = negative pulmonary smear  
> sp = positive pulmonary smear  
> ep = extrapulmonary
> 
> Sex  
> f = female  
> m = male
> 
> Age group  
> 014 = 0-14 yrs of age  
> 1524 = 15-24 years of age  
> 2534 = 25 to 34 years of age  
> 3544 = 35 to 44 years of age  
> 4554 = 45 to 54 years of age  
> 5564 = 55 to 64 years of age  
> 65 = 65 years of age or older

Let’s look for unique values of “key”. We find an error in the data
encoding

``` r
who1 %>% 
  count(key) %>% 
  select(key) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##             key
    ## 1   new_ep_f014
    ## 2  new_ep_f1524
    ## 3  new_ep_f2534
    ## 4  new_ep_f3544
    ## 5  new_ep_f4554
    ## 6  new_ep_f5564
    ## 7    new_ep_f65
    ## 8   new_ep_m014
    ## 9  new_ep_m1524
    ## 10 new_ep_m2534
    ## 11 new_ep_m3544
    ## 12 new_ep_m4554
    ## 13 new_ep_m5564
    ## 14   new_ep_m65
    ## 15  new_sn_f014
    ## 16 new_sn_f1524
    ## 17 new_sn_f2534
    ## 18 new_sn_f3544
    ## 19 new_sn_f4554
    ## 20 new_sn_f5564
    ## 21   new_sn_f65
    ## 22  new_sn_m014
    ## 23 new_sn_m1524
    ## 24 new_sn_m2534
    ## 25 new_sn_m3544
    ## 26 new_sn_m4554
    ## 27 new_sn_m5564
    ## 28   new_sn_m65
    ## 29  new_sp_f014
    ## 30 new_sp_f1524
    ## 31 new_sp_f2534
    ## 32 new_sp_f3544
    ## 33 new_sp_f4554
    ## 34 new_sp_f5564
    ## 35   new_sp_f65
    ## 36  new_sp_m014
    ## 37 new_sp_m1524
    ## 38 new_sp_m2534
    ## 39 new_sp_m3544
    ## 40 new_sp_m4554
    ## 41 new_sp_m5564
    ## 42   new_sp_m65
    ## 43  newrel_f014
    ## 44 newrel_f1524
    ## 45 newrel_f2534
    ## 46 newrel_f3544
    ## 47 newrel_f4554
    ## 48 newrel_f5564
    ## 49   newrel_f65
    ## 50  newrel_m014
    ## 51 newrel_m1524
    ## 52 newrel_m2534
    ## 53 newrel_m3544
    ## 54 newrel_m4554
    ## 55 newrel_m5564
    ## 56   newrel_m65

``` r
who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who2
```

    ## # A tibble: 76,046 x 6
    ##    country     iso2  iso3   year key         cases
    ##    <chr>       <chr> <chr> <int> <chr>       <int>
    ##  1 Afghanistan AF    AFG    1997 new_sp_m014     0
    ##  2 Afghanistan AF    AFG    1998 new_sp_m014    30
    ##  3 Afghanistan AF    AFG    1999 new_sp_m014     8
    ##  4 Afghanistan AF    AFG    2000 new_sp_m014    52
    ##  5 Afghanistan AF    AFG    2001 new_sp_m014   129
    ##  6 Afghanistan AF    AFG    2002 new_sp_m014    90
    ##  7 Afghanistan AF    AFG    2003 new_sp_m014   127
    ##  8 Afghanistan AF    AFG    2004 new_sp_m014   139
    ##  9 Afghanistan AF    AFG    2005 new_sp_m014   151
    ## 10 Afghanistan AF    AFG    2006 new_sp_m014   193
    ## # ... with 76,036 more rows

We can separate the values in each code with two passes of separate().
The first pass will split the codes at each underscore.

``` r
who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")

who3
```

    ## # A tibble: 76,046 x 8
    ##    country     iso2  iso3   year new   type  sexage cases
    ##    <chr>       <chr> <chr> <int> <chr> <chr> <chr>  <int>
    ##  1 Afghanistan AF    AFG    1997 new   sp    m014       0
    ##  2 Afghanistan AF    AFG    1998 new   sp    m014      30
    ##  3 Afghanistan AF    AFG    1999 new   sp    m014       8
    ##  4 Afghanistan AF    AFG    2000 new   sp    m014      52
    ##  5 Afghanistan AF    AFG    2001 new   sp    m014     129
    ##  6 Afghanistan AF    AFG    2002 new   sp    m014      90
    ##  7 Afghanistan AF    AFG    2003 new   sp    m014     127
    ##  8 Afghanistan AF    AFG    2004 new   sp    m014     139
    ##  9 Afghanistan AF    AFG    2005 new   sp    m014     151
    ## 10 Afghanistan AF    AFG    2006 new   sp    m014     193
    ## # ... with 76,036 more rows

Then we might as well drop the new column because it’s constant in this
dataset.

``` r
who3 %>% 
  count(new)
```

    ## # A tibble: 1 x 2
    ##   new       n
    ##   <chr> <int>
    ## 1 new   76046

While we’re dropping columns, let’s also drop iso2 and iso3 since
they’re redundant.

``` r
who4 <- who3 %>% 
  select(-new, -iso2, -iso3)

glimpse(who4)
```

    ## Observations: 76,046
    ## Variables: 5
    ## $ country <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanis...
    ## $ year    <int> 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, ...
    ## $ type    <chr> "sp", "sp", "sp", "sp", "sp", "sp", "sp", "sp", "sp", ...
    ## $ sexage  <chr> "m014", "m014", "m014", "m014", "m014", "m014", "m014"...
    ## $ cases   <int> 0, 30, 8, 52, 129, 90, 127, 139, 151, 193, 186, 187, 2...

Next we’ll separate sexage into sex and age by splitting after the first
character:

``` r
who5 <- who4 %>% 
  separate(sexage, c("sex", "age"), sep = 1)

who5
```

    ## # A tibble: 76,046 x 6
    ##    country      year type  sex   age   cases
    ##    <chr>       <int> <chr> <chr> <chr> <int>
    ##  1 Afghanistan  1997 sp    m     014       0
    ##  2 Afghanistan  1998 sp    m     014      30
    ##  3 Afghanistan  1999 sp    m     014       8
    ##  4 Afghanistan  2000 sp    m     014      52
    ##  5 Afghanistan  2001 sp    m     014     129
    ##  6 Afghanistan  2002 sp    m     014      90
    ##  7 Afghanistan  2003 sp    m     014     127
    ##  8 Afghanistan  2004 sp    m     014     139
    ##  9 Afghanistan  2005 sp    m     014     151
    ## 10 Afghanistan  2006 sp    m     014     193
    ## # ... with 76,036 more rows

Lastly, we’rte in tidy form, let’s recode the entries.

``` r
who6 <- who5 %>% 
    mutate(
    sex = recode(sex
      , "m" = "male"
      , "f" = "female"
    )
    ) %>% 
    mutate(
    type = recode(type
      , "sp" = "pos pulm smear"
      , "sn" = "neg pulm smear"
      , "ep" = "extrapulmonary"
    )
    )   


who6
```

    ## # A tibble: 76,046 x 6
    ##    country      year type           sex   age   cases
    ##    <chr>       <int> <chr>          <chr> <chr> <int>
    ##  1 Afghanistan  1997 pos pulm smear male  014       0
    ##  2 Afghanistan  1998 pos pulm smear male  014      30
    ##  3 Afghanistan  1999 pos pulm smear male  014       8
    ##  4 Afghanistan  2000 pos pulm smear male  014      52
    ##  5 Afghanistan  2001 pos pulm smear male  014     129
    ##  6 Afghanistan  2002 pos pulm smear male  014      90
    ##  7 Afghanistan  2003 pos pulm smear male  014     127
    ##  8 Afghanistan  2004 pos pulm smear male  014     139
    ##  9 Afghanistan  2005 pos pulm smear male  014     151
    ## 10 Afghanistan  2006 pos pulm smear male  014     193
    ## # ... with 76,036 more rows

Summary

``` r
summary(who6)
```

    ##    country               year          type               sex           
    ##  Length:76046       Min.   :1980   Length:76046       Length:76046      
    ##  Class :character   1st Qu.:2003   Class :character   Class :character  
    ##  Mode  :character   Median :2007   Mode  :character   Mode  :character  
    ##                     Mean   :2006                                        
    ##                     3rd Qu.:2010                                        
    ##                     Max.   :2013                                        
    ##      age                cases         
    ##  Length:76046       Min.   :     0.0  
    ##  Class :character   1st Qu.:     3.0  
    ##  Mode  :character   Median :    26.0  
    ##                     Mean   :   570.7  
    ##                     3rd Qu.:   184.0  
    ##                     Max.   :250051.0

``` r
who7 <- filter(who6, cases > 0)
ggplot(who7, aes(x = cases)) +
    geom_density() +
    scale_x_log10(breaks = 10^c(0:5)) +
    geom_vline(data = who7, mapping = aes(xintercept = median(cases)))
```

![](tidy-data-case-study_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->
