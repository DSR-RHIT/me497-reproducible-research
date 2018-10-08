
# Case study in tidying data

From section [12.6](http://r4ds.had.co.nz/tidy-data.html#case-study) in
R for Data Science.

I’ve added a few bits that I find useful, especially when attempting to
understand a new data set for the first time.

The `who` dataset is in the tidyr package, part of the
    tidyverse

``` r
library(tidyverse)
```

    ## -- Attaching packages -------------------------------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.0.0.9000     v purrr   0.2.5     
    ## v tibble  1.4.2          v dplyr   0.7.6     
    ## v tidyr   0.8.1          v stringr 1.3.1     
    ## v readr   1.1.1          v forcats 0.3.0

    ## -- Conflicts ----------------------------------------------------------------------- tidyverse_conflicts() --
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
who4 %>% 
    count(sexage) %>% 
  select(sexage) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##    sexage
    ## 1    f014
    ## 2   f1524
    ## 3   f2534
    ## 4   f3544
    ## 5   f4554
    ## 6   f5564
    ## 7     f65
    ## 8    m014
    ## 9   m1524
    ## 10  m2534
    ## 11  m3544
    ## 12  m4554
    ## 13  m5564
    ## 14    m65

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

Fot character variables, summary isn’t much help

``` r
who6 %>% 
    count(country) %>% 
  select(country) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##                                                  country
    ## 1                                            Afghanistan
    ## 2                                                Albania
    ## 3                                                Algeria
    ## 4                                         American Samoa
    ## 5                                                Andorra
    ## 6                                                 Angola
    ## 7                                               Anguilla
    ## 8                                    Antigua and Barbuda
    ## 9                                              Argentina
    ## 10                                               Armenia
    ## 11                                                 Aruba
    ## 12                                             Australia
    ## 13                                               Austria
    ## 14                                            Azerbaijan
    ## 15                                               Bahamas
    ## 16                                               Bahrain
    ## 17                                            Bangladesh
    ## 18                                              Barbados
    ## 19                                               Belarus
    ## 20                                               Belgium
    ## 21                                                Belize
    ## 22                                                 Benin
    ## 23                                               Bermuda
    ## 24                                                Bhutan
    ## 25                      Bolivia (Plurinational State of)
    ## 26                     Bonaire, Saint Eustatius and Saba
    ## 27                                Bosnia and Herzegovina
    ## 28                                              Botswana
    ## 29                                                Brazil
    ## 30                                British Virgin Islands
    ## 31                                     Brunei Darussalam
    ## 32                                              Bulgaria
    ## 33                                          Burkina Faso
    ## 34                                               Burundi
    ## 35                                            Cabo Verde
    ## 36                                              Cambodia
    ## 37                                              Cameroon
    ## 38                                                Canada
    ## 39                                        Cayman Islands
    ## 40                              Central African Republic
    ## 41                                                  Chad
    ## 42                                                 Chile
    ## 43                                                 China
    ## 44                                  China, Hong Kong SAR
    ## 45                                      China, Macao SAR
    ## 46                                              Colombia
    ## 47                                               Comoros
    ## 48                                                 Congo
    ## 49                                          Cook Islands
    ## 50                                            Costa Rica
    ## 51                                         Cote d'Ivoire
    ## 52                                               Croatia
    ## 53                                                  Cuba
    ## 54                                               Curacao
    ## 55                                                Cyprus
    ## 56                                        Czech Republic
    ## 57                 Democratic People's Republic of Korea
    ## 58                      Democratic Republic of the Congo
    ## 59                                               Denmark
    ## 60                                              Djibouti
    ## 61                                              Dominica
    ## 62                                    Dominican Republic
    ## 63                                               Ecuador
    ## 64                                                 Egypt
    ## 65                                           El Salvador
    ## 66                                     Equatorial Guinea
    ## 67                                               Eritrea
    ## 68                                               Estonia
    ## 69                                              Ethiopia
    ## 70                                                  Fiji
    ## 71                                               Finland
    ## 72                                                France
    ## 73                                      French Polynesia
    ## 74                                                 Gabon
    ## 75                                                Gambia
    ## 76                                               Georgia
    ## 77                                               Germany
    ## 78                                                 Ghana
    ## 79                                                Greece
    ## 80                                             Greenland
    ## 81                                               Grenada
    ## 82                                                  Guam
    ## 83                                             Guatemala
    ## 84                                                Guinea
    ## 85                                         Guinea-Bissau
    ## 86                                                Guyana
    ## 87                                                 Haiti
    ## 88                                              Honduras
    ## 89                                               Hungary
    ## 90                                               Iceland
    ## 91                                                 India
    ## 92                                             Indonesia
    ## 93                            Iran (Islamic Republic of)
    ## 94                                                  Iraq
    ## 95                                               Ireland
    ## 96                                                Israel
    ## 97                                                 Italy
    ## 98                                               Jamaica
    ## 99                                                 Japan
    ## 100                                               Jordan
    ## 101                                           Kazakhstan
    ## 102                                                Kenya
    ## 103                                             Kiribati
    ## 104                                               Kuwait
    ## 105                                           Kyrgyzstan
    ## 106                     Lao People's Democratic Republic
    ## 107                                               Latvia
    ## 108                                              Lebanon
    ## 109                                              Lesotho
    ## 110                                              Liberia
    ## 111                                                Libya
    ## 112                                            Lithuania
    ## 113                                           Luxembourg
    ## 114                                           Madagascar
    ## 115                                               Malawi
    ## 116                                             Malaysia
    ## 117                                             Maldives
    ## 118                                                 Mali
    ## 119                                                Malta
    ## 120                                     Marshall Islands
    ## 121                                           Mauritania
    ## 122                                            Mauritius
    ## 123                                               Mexico
    ## 124                     Micronesia (Federated States of)
    ## 125                                               Monaco
    ## 126                                             Mongolia
    ## 127                                           Montenegro
    ## 128                                           Montserrat
    ## 129                                              Morocco
    ## 130                                           Mozambique
    ## 131                                              Myanmar
    ## 132                                              Namibia
    ## 133                                                Nauru
    ## 134                                                Nepal
    ## 135                                          Netherlands
    ## 136                                 Netherlands Antilles
    ## 137                                        New Caledonia
    ## 138                                          New Zealand
    ## 139                                            Nicaragua
    ## 140                                                Niger
    ## 141                                              Nigeria
    ## 142                                                 Niue
    ## 143                             Northern Mariana Islands
    ## 144                                               Norway
    ## 145                                                 Oman
    ## 146                                             Pakistan
    ## 147                                                Palau
    ## 148                                               Panama
    ## 149                                     Papua New Guinea
    ## 150                                             Paraguay
    ## 151                                                 Peru
    ## 152                                          Philippines
    ## 153                                               Poland
    ## 154                                             Portugal
    ## 155                                          Puerto Rico
    ## 156                                                Qatar
    ## 157                                    Republic of Korea
    ## 158                                  Republic of Moldova
    ## 159                                              Romania
    ## 160                                   Russian Federation
    ## 161                                               Rwanda
    ## 162                                Saint Kitts and Nevis
    ## 163                                          Saint Lucia
    ## 164                     Saint Vincent and the Grenadines
    ## 165                                                Samoa
    ## 166                                           San Marino
    ## 167                                Sao Tome and Principe
    ## 168                                         Saudi Arabia
    ## 169                                              Senegal
    ## 170                                               Serbia
    ## 171                                  Serbia & Montenegro
    ## 172                                           Seychelles
    ## 173                                         Sierra Leone
    ## 174                                            Singapore
    ## 175                            Sint Maarten (Dutch part)
    ## 176                                             Slovakia
    ## 177                                             Slovenia
    ## 178                                      Solomon Islands
    ## 179                                              Somalia
    ## 180                                         South Africa
    ## 181                                          South Sudan
    ## 182                                                Spain
    ## 183                                            Sri Lanka
    ## 184                                                Sudan
    ## 185                                             Suriname
    ## 186                                            Swaziland
    ## 187                                               Sweden
    ## 188                                          Switzerland
    ## 189                                 Syrian Arab Republic
    ## 190                                           Tajikistan
    ## 191                                             Thailand
    ## 192            The Former Yugoslav Republic of Macedonia
    ## 193                                          Timor-Leste
    ## 194                                                 Togo
    ## 195                                              Tokelau
    ## 196                                                Tonga
    ## 197                                  Trinidad and Tobago
    ## 198                                              Tunisia
    ## 199                                               Turkey
    ## 200                                         Turkmenistan
    ## 201                             Turks and Caicos Islands
    ## 202                                               Tuvalu
    ## 203                                               Uganda
    ## 204                                              Ukraine
    ## 205                                 United Arab Emirates
    ## 206 United Kingdom of Great Britain and Northern Ireland
    ## 207                          United Republic of Tanzania
    ## 208                             United States of America
    ## 209                                              Uruguay
    ## 210                                    US Virgin Islands
    ## 211                                           Uzbekistan
    ## 212                                              Vanuatu
    ## 213                   Venezuela (Bolivarian Republic of)
    ## 214                                             Viet Nam
    ## 215                            Wallis and Futuna Islands
    ## 216                             West Bank and Gaza Strip
    ## 217                                                Yemen
    ## 218                                               Zambia
    ## 219                                             Zimbabwe

``` r
who6 %>% 
    count(type) %>% 
  select(type) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##             type
    ## 1 extrapulmonary
    ## 2 neg pulm smear
    ## 3 pos pulm smear
    ## 4            rel

``` r
who6 %>% 
    count(age) %>% 
  select(age) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##    age
    ## 1  014
    ## 2 1524
    ## 3 2534
    ## 4 3544
    ## 5 4554
    ## 6 5564
    ## 7   65

``` r
who6 %>% 
    count(sex) %>% 
  select(sex) %>% 
  as.data.frame() %>% 
  unique() %>% 
  print()
```

    ##      sex
    ## 1 female
    ## 2   male

``` r
who7 <- filter(who6, cases > 0)
ggplot(who7, aes(x = cases)) +
    geom_vline(aes(xintercept = median(cases))) +
    geom_density() +
    scale_x_log10(breaks = 10^c(0:5))
```

![](cm5021_case-study_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->
