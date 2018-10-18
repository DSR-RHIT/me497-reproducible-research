
``` r
library(knitr)
opts_knit$set(root.dir = "../")
opts_chunk$set(echo=TRUE, collapse=TRUE)
```

# reading messy spreadsheet data

I tried the jailbreakr package, but it isn’t on CRAN and the repo
doesn’t have any useful vignettes. There is a blog post though at
<https://www.brodrigues.co/blog/2017-02-17-how_to_use_jailbreakr/>

``` r
# install just once
# devtools::install_github(c("hadley/xml2",
#                            "rsheets/linen",
#                            "rsheets/cellranger",
#                            "rsheets/rexcel",
#                            "rsheets/jailbreakr"))
```

Following the instructions at the blog,

``` r
library("rexcel")
library("jailbreakr")

path_to_data <- "data/us_income.xlsx"
my_sheet     <- rexcel_read(path_to_data, sheet = "us_income")
tables       <- split_sheet(my_sheet)
```

Not sure what that all is. But keep going

``` r
library(purrr)
list_of_data <-  map(tables, (function(x) (x$values())))
# map(list_of_data, head)
```

The variable `list_of_data` contains the discrete chunks of the messy
spreadsheet.

``` r
j <- 1
dataset_j <- list_of_data[[j]]
dataset_j
##      [,1]                                                                     
## [1,] "CPH-L-131B. Size of Household--Households by Total Money Income in 1989"
##      [,2]       
## [1,] " by State"


j <- 2
dataset_j <- list_of_data[[j]]
dataset_j
##      [,1]                                                                                                             
## [1,] "---------------------------------------------------------------------------------------------------" [truncated]
## [2,] "                              Total"                                                                            
## [3,] "State"                                                                                                          
## [4,] "---------------------------------------------------------------------------------------------------" [truncated]
## [5,] "UNITED STATES"                                                                                                  
##      [,2]         [,3]         [,4]         [,5]         [,6]        
## [1,] NA           NA           NA           NA           NA          
## [2,] "1-Person"   "2-Person"   "3-Person"   "4-Person"   "5-Person"  
## [3,] "households" "households" "households" "households" "households"
## [4,] NA           NA           NA           NA           NA          
## [5,] NA           NA           NA           NA           NA          
##      [,7]         [,8]        
## [1,] NA           NA          
## [2,] "6+-Persons" NA          
## [3,] "households" "households"
## [4,] NA           NA          
## [5,] NA           NA


j <- 3
dataset_j <- list_of_data[[j]]
dataset_j
##       [,1]                   [,2]     [,3]     [,4]     [,5]     [,6]    
##  [1,] "  Total"              91993582 22421114 29379586 15962545 13956079
##  [2,] "Less than $5,000"     5684517  3133102  1110021  654919   424657  
##  [3,] "$5,000 to $9,999"     8529980  4794603  1920691  805991   530572  
##  [4,] "$10,000 to $12,499"   4365873  1870742  1344979  498885   338178  
##  [5,] "$12,500 to $14,999"   3767400  1358942  1324321  470640   320274  
##  [6,] "$15,000 to $17,499"   4260641  1459614  1468477  576427   406782  
##  [7,] "$17,500 to $19,999"   3844339  1155865  1393256  551371   402729  
##  [8,] "$20,000 to $22,499"   4395954  1285519  1541983  652452   506541  
##  [9,] "$22,500 to $24,999"   3622808  884984   1340173  583045   450607  
## [10,] "$25,000 to $27,499"   4105099  1002987  1425362  686877   561145  
## [11,] "$27,500 to $29,999"   3328905  666462   1204774  596197   491490  
## [12,] "$30,000 to $32,499"   4108519  885773   1361887  733251   658529  
## [13,] "$32,500 to $34,999"   3032602  466211   1077753  594171   519004  
## [14,] "$35,000 to $37,499"   3487169  580910   1164752  680884   625873  
## [15,] "$37,500 to $39,999"   2727253  350720   942348   559498   516730  
## [16,] "$40,000 to $42,499"   3254665  457288   1068914  659436   643792  
## [17,] "$42,500 to $44,999"   2360699  233185   801961   516555   482155  
## [18,] "$45,000 to $47,499"   2565438  263880   850189   554800   539779  
## [19,] "$47,500 to $49,999"   2033231  169987   679107   455456   437911  
## [20,] "$50,000 to $54,999"   4078012  348281   1336247  905525   900024  
## [21,] "$55,000 to $59,999"   3135172  196082   1031356  729851   709686  
## [22,] "$60,000 to $74,499"   6564699  371242   2115214  1546459  1517643 
## [23,] "$75,000 to $99,999"   4704808  227985   1499612  1101306  1095433 
## [24,] "$100,000 to $124,999" 1831758  105203   595312   402169   412327  
## [25,] "$125,000 to $149,999" 762010   43063    261200   162726   162316  
## [26,] "$150,000 or more"     1442031  108484   519697   283654   301902  
## [27,] "Median (dollars)"     30056    15091    31130    37119    40873   
##       [,7]    [,8]   
##  [1,] 6445357 3828901
##  [2,] 209023  152795 
##  [3,] 276289  201834 
##  [4,] 180655  132434 
##  [5,] 166569  126654 
##  [6,] 205608  143733 
##  [7,] 201758  139360 
##  [8,] 252123  157336 
##  [9,] 223020  140979 
## [10,] 268740  159988 
## [11,] 232804  137178 
## [12,] 301888  167191 
## [13,] 239822  135641 
## [14,] 283606  151144 
## [15,] 230646  127311 
## [16,] 281285  143950 
## [17,] 212859  113984 
## [18,] 233985  122805 
## [19,] 188287  102483 
## [20,] 385808  202127 
## [21,] 303531  164666 
## [22,] 654966  359175 
## [23,] 488428  292044 
## [24,] 194316  122431 
## [25,] 80455   52250  
## [26,] 148886  79408  
## [27,] 39459   36974

j <- 4
dataset_j <- list_of_data[[j]]
dataset_j
##      [,1]     
## [1,] "ALABAMA"


j <- 5
dataset_j <- list_of_data[[j]]
dataset_j
##       [,1]                   [,2]    [,3]   [,4]   [,5]   [,6]   [,7] 
##  [1,] "  Total"              1506009 354918 478471 284277 237174 99577
##  [2,] "Less than $5,000"     159594  90974  29968  17169  11515  5702 
##  [3,] "$5,000 to $9,999"     178304  84753  52197  19636  11307  5952 
##  [4,] "$10,000 to $12,499"   87687   28920  31201  12628  8321   3967 
##  [5,] "$12,500 to $14,999"   73372   21121  27017  12044  7142   3515 
##  [6,] "$15,000 to $17,499"   80452   21027  28331  14234  9432   4442 
##  [7,] "$17,500 to $19,999"   69295   15826  25202  12398  9068   4383 
##  [8,] "$20,000 to $22,499"   77582   16760  27048  14434  11558  4973 
##  [9,] "$22,500 to $24,999"   60915   10371  22186  12356  9386   4166 
## [10,] "$25,000 to $27,499"   68890   12198  23477  13894  11906  4883 
## [11,] "$27,500 to $29,999"   55259   7546   20042  11552  9738   4465 
## [12,] "$30,000 to $32,499"   66054   10139  21451  13753  13277  5067 
## [13,] "$32,500 to $34,999"   46312   4903   15804  10457  9911   3585 
## [14,] "$35,000 to $37,499"   52327   5291   16857  12454  11456  4456 
## [15,] "$37,500 to $39,999"   40353   3690   13110  9578   8976   3377 
## [16,] "$40,000 to $42,499"   46500   4241   14451  11438  10287  4372 
## [17,] "$42,500 to $44,999"   32960   1932   10670  8477   7669   2891 
## [18,] "$45,000 to $47,499"   34693   2420   10442  8896   8300   3175 
## [19,] "$47,500 to $49,999"   27921   1602   9045   6896   6688   2587 
## [20,] "$50,000 to $54,999"   53863   3037   16479  13166  13707  5413 
## [21,] "$55,000 to $59,999"   40469   1700   12494  10636  10269  3877 
## [22,] "$60,000 to $74,499"   74358   2892   23328  19228  19311  6776 
## [23,] "$75,000 to $99,999"   44820   1840   14885  11304  10793  4126 
## [24,] "$100,000 to $124,999" 15298   662    5737   3567   3362   1405 
## [25,] "$125,000 to $149,999" 6217    305    2378   1424   1113   737  
## [26,] "$150,000 or more"     12514   768    4671   2658   2682   1285 
## [27,] "Median (dollars)"     23597   10150  24559  30326  33998  31648
##       [,8] 
##  [1,] 51592
##  [2,] 4266 
##  [3,] 4459 
##  [4,] 2650 
##  [5,] 2533 
##  [6,] 2986 
##  [7,] 2418 
##  [8,] 2809 
##  [9,] 2450 
## [10,] 2532 
## [11,] 1916 
## [12,] 2367 
## [13,] 1652 
## [14,] 1813 
## [15,] 1622 
## [16,] 1711 
## [17,] 1321 
## [18,] 1460 
## [19,] 1103 
## [20,] 2061 
## [21,] 1493 
## [22,] 2823 
## [23,] 1872 
## [24,] 565  
## [25,] 260  
## [26,] 450  
## [27,] 26210

j <- 6
dataset_j <- list_of_data[[j]]
dataset_j
##      [,1]    
## [1,] "ALASKA"


j <- 7
dataset_j <- list_of_data[[j]]
dataset_j
##       [,1]                   [,2]   [,3]  [,4]  [,5]  [,6]  [,7]  [,8] 
##  [1,] "  Total"              189700 41510 54822 34314 33073 15991 9990 
##  [2,] "Less than $5,000"     6631   3458  1473  760   457   263   220  
##  [3,] "$5,000 to $9,999"     9152   4905  2009  1008  669   308   253  
##  [4,] "$10,000 to $12,499"   6156   2505  1339  1104  652   359   197  
##  [5,] "$12,500 to $14,999"   5972   2215  1302  1009  783   410   253  
##  [6,] "$15,000 to $17,499"   6229   2225  1543  974   837   390   260  
##  [7,] "$17,500 to $19,999"   5900   1788  1636  900   879   378   319  
##  [8,] "$20,000 to $22,499"   6870   2362  1876  981   817   546   288  
##  [9,] "$22,500 to $24,999"   6140   1846  1702  1029  767   448   348  
## [10,] "$25,000 to $27,499"   6952   2050  2007  1063  983   502   347  
## [11,] "$27,500 to $29,999"   6080   1475  1772  1011  990   467   365  
## [12,] "$30,000 to $32,499"   6924   2125  1964  863   1093  566   313  
## [13,] "$32,500 to $34,999"   5917   1344  1685  1145  858   580   305  
## [14,] "$35,000 to $37,499"   6414   1524  1823  1141  1011  553   362  
## [15,] "$37,500 to $39,999"   5836   1162  1800  1010  999   524   341  
## [16,] "$40,000 to $42,499"   6529   1605  1948  1001  1054  596   325  
## [17,] "$42,500 to $44,999"   5268   916   1824  935   883   446   264  
## [18,] "$45,000 to $47,499"   5890   1127  1852  1039  1043  477   352  
## [19,] "$47,500 to $49,999"   5185   766   1586  916   1032  569   316  
## [20,] "$50,000 to $54,999"   10428  1691  2924  1927  2110  1085  691  
## [21,] "$55,000 to $59,999"   8235   847   2452  1711  1946  859   420  
## [22,] "$60,000 to $74,499"   21756  1811  6996  4735  4870  2072  1272 
## [23,] "$75,000 to $99,999"   20626  1090  6742  4634  4901  2074  1185 
## [24,] "$100,000 to $124,999" 7870   321   2461  2010  1774  807   497  
## [25,] "$125,000 to $149,999" 2903   119   954   689   684   286   171  
## [26,] "$150,000 or more"     3837   233   1152  719   981   426   326  
## [27,] "Median (dollars)"     41408  24257 44600 48002 51603 48302 46669
```

Stop here and compare an approach using the tidyverse. At this point I
can pull a matrix for each state.

## using the tidyverse

``` r
library(tidyverse)
## -- Attaching packages --------------------------------------------------------------------------------- tidyverse 1.2.1 --
## v ggplot2 3.0.0.9000     v readr   1.1.1     
## v tibble  1.4.2          v dplyr   0.7.6     
## v tidyr   0.8.1          v stringr 1.3.1     
## v ggplot2 3.0.0.9000     v forcats 0.3.0
## -- Conflicts ------------------------------------------------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

``` r
rawlines <- read_lines("data/us_income.csv")
head(rawlines)
## [1] "CPH-L-131B. Size of Household--Households by Total Money Income in 1989, by State,,,,,,"                            
## [2] ",,,,,,,"                                                                                                            
## [3] ",,,,,,,"                                                                                                            
## [4] ",,,,,,,"                                                                                                            
## [5] "------------------------------------------------------------------------------------------------------------,,,,,,,"
## [6] "                              Total,1-Person,2-Person,3-Person,4-Person,5-Person,6+-Persons,"
```

Find the row with Alabama

``` r
str(rawlines)
##  chr [1:1640] "CPH-L-131B. Size of Household--Households by Total Money Income in 1989, by State,,,,,," ...

grep("Alabama", rawlines, ignore.case = TRUE)
## [1] 40
grep("Alaska", rawlines, ignore.case = TRUE)
## [1] 71
```

Find all 50 state names, using the built-in state data.

``` r
state.name
##  [1] "Alabama"        "Alaska"         "Arizona"        "Arkansas"      
##  [5] "California"     "Colorado"       "Connecticut"    "Delaware"      
##  [9] "Florida"        "Georgia"        "Hawaii"         "Idaho"         
## [13] "Illinois"       "Indiana"        "Iowa"           "Kansas"        
## [17] "Kentucky"       "Louisiana"      "Maine"          "Maryland"      
## [21] "Massachusetts"  "Michigan"       "Minnesota"      "Mississippi"   
## [25] "Missouri"       "Montana"        "Nebraska"       "Nevada"        
## [29] "New Hampshire"  "New Jersey"     "New Mexico"     "New York"      
## [33] "North Carolina" "North Dakota"   "Ohio"           "Oklahoma"      
## [37] "Oregon"         "Pennsylvania"   "Rhode Island"   "South Carolina"
## [41] "South Dakota"   "Tennessee"      "Texas"          "Utah"          
## [45] "Vermont"        "Virginia"       "Washington"     "West Virginia" 
## [49] "Wisconsin"      "Wyoming"
```

``` r
state_name <- state.name
indices <- sapply(state_name, function(x) grep(x, rawlines, ignore.case = TRUE, fixed = FALSE))
str(indices)
## List of 50
##  $ Alabama       : int 40
##  $ Alaska        : int 71
##  $ Arizona       : int 102
##  $ Arkansas      : int 133
##  $ California    : int 164
##  $ Colorado      : int 195
##  $ Connecticut   : int 226
##  $ Delaware      : int 257
##  $ Florida       : int 319
##  $ Georgia       : int 350
##  $ Hawaii        : int 381
##  $ Idaho         : int 412
##  $ Illinois      : int 443
##  $ Indiana       : int 474
##  $ Iowa          : int 505
##  $ Kansas        : int [1:2] 133 536
##  $ Kentucky      : int 567
##  $ Louisiana     : int 598
##  $ Maine         : int 629
##  $ Maryland      : int 660
##  $ Massachusetts : int 691
##  $ Michigan      : int 722
##  $ Minnesota     : int 753
##  $ Mississippi   : int 784
##  $ Missouri      : int 815
##  $ Montana       : int 846
##  $ Nebraska      : int 877
##  $ Nevada        : int 908
##  $ New Hampshire : int 939
##  $ New Jersey    : int 970
##  $ New Mexico    : int 1001
##  $ New York      : int 1032
##  $ North Carolina: int 1063
##  $ North Dakota  : int 1094
##  $ Ohio          : int 1125
##  $ Oklahoma      : int 1156
##  $ Oregon        : int 1187
##  $ Pennsylvania  : int 1218
##  $ Rhode Island  : int 1249
##  $ South Carolina: int 1280
##  $ South Dakota  : int 1311
##  $ Tennessee     : int 1342
##  $ Texas         : int 1373
##  $ Utah          : int 1404
##  $ Vermont       : int 1435
##  $ Virginia      : int [1:2] 1466 1528
##  $ Washington    : int [1:2] 1497 1627
##  $ West Virginia : int 1528
##  $ Wisconsin     : int 1559
##  $ Wyoming       : int 1590
```

Some have two results because “kansas” as a string is also in Arkansas.
Virginia is also in West Virginia. washingtom is in the footnotes

``` r
indices$Kansas     <- indices$Kansas[2]
indices$Virginia   <- indices$Virginia[1]
indices$Washington <- indices$Washington[1]
str(indices)
## List of 50
##  $ Alabama       : int 40
##  $ Alaska        : int 71
##  $ Arizona       : int 102
##  $ Arkansas      : int 133
##  $ California    : int 164
##  $ Colorado      : int 195
##  $ Connecticut   : int 226
##  $ Delaware      : int 257
##  $ Florida       : int 319
##  $ Georgia       : int 350
##  $ Hawaii        : int 381
##  $ Idaho         : int 412
##  $ Illinois      : int 443
##  $ Indiana       : int 474
##  $ Iowa          : int 505
##  $ Kansas        : int 536
##  $ Kentucky      : int 567
##  $ Louisiana     : int 598
##  $ Maine         : int 629
##  $ Maryland      : int 660
##  $ Massachusetts : int 691
##  $ Michigan      : int 722
##  $ Minnesota     : int 753
##  $ Mississippi   : int 784
##  $ Missouri      : int 815
##  $ Montana       : int 846
##  $ Nebraska      : int 877
##  $ Nevada        : int 908
##  $ New Hampshire : int 939
##  $ New Jersey    : int 970
##  $ New Mexico    : int 1001
##  $ New York      : int 1032
##  $ North Carolina: int 1063
##  $ North Dakota  : int 1094
##  $ Ohio          : int 1125
##  $ Oklahoma      : int 1156
##  $ Oregon        : int 1187
##  $ Pennsylvania  : int 1218
##  $ Rhode Island  : int 1249
##  $ South Carolina: int 1280
##  $ South Dakota  : int 1311
##  $ Tennessee     : int 1342
##  $ Texas         : int 1373
##  $ Utah          : int 1404
##  $ Vermont       : int 1435
##  $ Virginia      : int 1466
##  $ Washington    : int 1497
##  $ West Virginia : int 1528
##  $ Wisconsin     : int 1559
##  $ Wyoming       : int 1590
```

``` r
first_row <- unname(unlist(indices))
str(first_row)
##  int [1:50] 40 71 102 133 164 195 226 257 319 350 ...

delta <- diff(first_row)
delta <- diff(first_row)[1] - 3
delta
## [1] 28
```

Construct data frame with indices

``` r
df_indices <- data_frame(state = state_name) %>% 
    mutate(first_row = first_row) %>% 
    mutate(last_row = first_row + delta)



glimpse(df_indices)
## Observations: 50
## Variables: 3
## $ state     <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "Califor...
## $ first_row <int> 40, 71, 102, 133, 164, 195, 226, 257, 319, 350, 381,...
## $ last_row  <dbl> 68, 99, 130, 161, 192, 223, 254, 285, 347, 378, 409,...
```

Extract one state and write to file

``` r
j = 6
this_state <- df_indices$state[j]
state_data <- rawlines[df_indices$first_row[j]:df_indices$last_row[j]]
state_data
##  [1] "COLORADO,,,,,,,"                                                                                 
##  [2] ",,,,,,,"                                                                                         
##  [3] "  Total,\"1,285,119\",\"340,413\",\"424,450\",\"213,245\",\"190,935\",\"79,498\",\"36,578\""     
##  [4] "\"Less than $5,000\",\"67,384\",\"37,901\",\"14,738\",\"8,224\",\"3,979\",\"1,662\",880"         
##  [5] "\"$5,000 to $9,999\",\"108,370\",\"64,786\",\"22,653\",\"9,046\",\"6,803\",\"3,278\",\"1,804\""  
##  [6] "\"$10,000 to $12,499\",\"62,779\",\"28,811\",\"18,576\",\"7,044\",\"4,781\",\"2,195\",\"1,372\"" 
##  [7] "\"$12,500 to $14,999\",\"54,159\",\"22,210\",\"17,483\",\"6,395\",\"4,491\",\"2,390\",\"1,190\"" 
##  [8] "\"$15,000 to $17,499\",\"62,295\",\"24,507\",\"20,168\",\"7,565\",\"5,886\",\"2,731\",\"1,438\"" 
##  [9] "\"$17,500 to $19,999\",\"56,158\",\"19,552\",\"19,285\",\"7,484\",\"5,726\",\"2,898\",\"1,213\"" 
## [10] "\"$20,000 to $22,499\",\"64,977\",\"22,096\",\"21,827\",\"8,905\",\"7,057\",\"3,412\",\"1,680\"" 
## [11] "\"$22,500 to $24,999\",\"54,267\",\"15,130\",\"19,879\",\"8,047\",\"6,619\",\"3,060\",\"1,532\"" 
## [12] "\"$25,000 to $27,499\",\"59,657\",\"16,652\",\"21,095\",\"9,363\",\"7,457\",\"3,542\",\"1,548\"" 
## [13] "\"$27,500 to $29,999\",\"49,150\",\"11,483\",\"18,008\",\"8,573\",\"6,702\",\"3,048\",\"1,336\"" 
## [14] "\"$30,000 to $32,499\",\"60,126\",\"14,962\",\"20,106\",\"10,155\",\"9,415\",\"3,795\",\"1,693\""
## [15] "\"$32,500 to $34,999\",\"44,212\",\"8,016\",\"16,357\",\"7,935\",\"7,249\",\"3,336\",\"1,319\""  
## [16] "\"$35,000 to $37,499\",\"49,067\",\"9,238\",\"17,084\",\"9,280\",\"8,544\",\"3,423\",\"1,498\""  
## [17] "\"$37,500 to $39,999\",\"40,033\",\"6,185\",\"14,398\",\"7,709\",\"7,213\",\"3,196\",\"1,332\""  
## [18] "\"$40,000 to $42,499\",\"47,203\",\"7,392\",\"16,143\",\"8,812\",\"9,877\",\"3,465\",\"1,514\""  
## [19] "\"$42,500 to $44,999\",\"34,321\",\"3,950\",\"11,974\",\"7,021\",\"7,374\",\"2,657\",\"1,345\""  
## [20] "\"$45,000 to $47,499\",\"37,278\",\"4,038\",\"13,298\",\"7,805\",\"7,969\",\"2,860\",\"1,308\""  
## [21] "\"$47,500 to $49,999\",\"29,540\",\"2,704\",\"10,894\",\"5,979\",\"6,682\",\"2,260\",\"1,021\""  
## [22] "\"$50,000 to $54,999\",\"58,337\",\"5,648\",\"20,851\",\"12,362\",\"12,583\",\"4,874\",\"2,019\""
## [23] "\"$55,000 to $59,999\",\"44,412\",\"3,248\",\"15,549\",\"9,724\",\"10,387\",\"3,881\",\"1,623\"" 
## [24] "\"$60,000 to $74,499\",\"91,036\",\"5,651\",\"32,898\",\"20,779\",\"20,631\",\"7,631\",\"3,446\""
## [25] "\"$75,000 to $99,999\",\"61,432\",\"3,150\",\"22,283\",\"14,614\",\"13,422\",\"5,596\",\"2,367\""
## [26] "\"$100,000 to $124,999\",\"23,048\",\"1,217\",\"8,761\",\"5,192\",\"4,925\",\"1,768\",\"1,185\"" 
## [27] "\"$125,000 to $149,999\",\"9,261\",615,\"3,551\",\"2,126\",\"1,766\",925,278"                    
## [28] "\"$150,000 or more\",\"16,617\",\"1,271\",\"6,591\",\"3,106\",\"3,397\",\"1,615\",637"           
## [29] "Median (dollars),\"30,140\",\"16,683\",\"32,302\",\"37,125\",\"40,897\",\"38,266\",\"37,143\""

this_path <- paste0("data/", this_state, ".csv")
write_lines(state_data, this_path)
```

Read the file , keep only the columns we need

``` r
df <- read_csv(this_path, skip = 2, col_names = FALSE) %>% 
    mutate(state = this_state) 
## Parsed with column specification:
## cols(
##   X1 = col_character(),
##   X2 = col_number(),
##   X3 = col_number(),
##   X4 = col_number(),
##   X5 = col_number(),
##   X6 = col_number(),
##   X7 = col_number(),
##   X8 = col_number()
## )

kable(df)
```

| X1                   |      X2 |     X3 |     X4 |     X5 |     X6 |    X7 |    X8 | state    |
| :------------------- | ------: | -----: | -----: | -----: | -----: | ----: | ----: | :------- |
| Total                | 1285119 | 340413 | 424450 | 213245 | 190935 | 79498 | 36578 | Colorado |
| Less than $5,000     |   67384 |  37901 |  14738 |   8224 |   3979 |  1662 |   880 | Colorado |
| $5,000 to $9,999     |  108370 |  64786 |  22653 |   9046 |   6803 |  3278 |  1804 | Colorado |
| $10,000 to $12,499   |   62779 |  28811 |  18576 |   7044 |   4781 |  2195 |  1372 | Colorado |
| $12,500 to $14,999   |   54159 |  22210 |  17483 |   6395 |   4491 |  2390 |  1190 | Colorado |
| $15,000 to $17,499   |   62295 |  24507 |  20168 |   7565 |   5886 |  2731 |  1438 | Colorado |
| $17,500 to $19,999   |   56158 |  19552 |  19285 |   7484 |   5726 |  2898 |  1213 | Colorado |
| $20,000 to $22,499   |   64977 |  22096 |  21827 |   8905 |   7057 |  3412 |  1680 | Colorado |
| $22,500 to $24,999   |   54267 |  15130 |  19879 |   8047 |   6619 |  3060 |  1532 | Colorado |
| $25,000 to $27,499   |   59657 |  16652 |  21095 |   9363 |   7457 |  3542 |  1548 | Colorado |
| $27,500 to $29,999   |   49150 |  11483 |  18008 |   8573 |   6702 |  3048 |  1336 | Colorado |
| $30,000 to $32,499   |   60126 |  14962 |  20106 |  10155 |   9415 |  3795 |  1693 | Colorado |
| $32,500 to $34,999   |   44212 |   8016 |  16357 |   7935 |   7249 |  3336 |  1319 | Colorado |
| $35,000 to $37,499   |   49067 |   9238 |  17084 |   9280 |   8544 |  3423 |  1498 | Colorado |
| $37,500 to $39,999   |   40033 |   6185 |  14398 |   7709 |   7213 |  3196 |  1332 | Colorado |
| $40,000 to $42,499   |   47203 |   7392 |  16143 |   8812 |   9877 |  3465 |  1514 | Colorado |
| $42,500 to $44,999   |   34321 |   3950 |  11974 |   7021 |   7374 |  2657 |  1345 | Colorado |
| $45,000 to $47,499   |   37278 |   4038 |  13298 |   7805 |   7969 |  2860 |  1308 | Colorado |
| $47,500 to $49,999   |   29540 |   2704 |  10894 |   5979 |   6682 |  2260 |  1021 | Colorado |
| $50,000 to $54,999   |   58337 |   5648 |  20851 |  12362 |  12583 |  4874 |  2019 | Colorado |
| $55,000 to $59,999   |   44412 |   3248 |  15549 |   9724 |  10387 |  3881 |  1623 | Colorado |
| $60,000 to $74,499   |   91036 |   5651 |  32898 |  20779 |  20631 |  7631 |  3446 | Colorado |
| $75,000 to $99,999   |   61432 |   3150 |  22283 |  14614 |  13422 |  5596 |  2367 | Colorado |
| $100,000 to $124,999 |   23048 |   1217 |   8761 |   5192 |   4925 |  1768 |  1185 | Colorado |
| $125,000 to $149,999 |    9261 |    615 |   3551 |   2126 |   1766 |   925 |   278 | Colorado |
| $150,000 or more     |   16617 |   1271 |   6591 |   3106 |   3397 |  1615 |   637 | Colorado |
| Median (dollars)     |   30140 |  16683 |  32302 |  37125 |  40897 | 38266 | 37143 | Colorado |

At this point I have accomplished just about the same as I did earlier
using jailbreakr.

## tidying the data for one state

Whether I used jailbreakr or readr, I have the data for one state in a
form that can be manipulated to find the data i need.

Extract the first row (total number of households) and last row (median
income). Each column represents a different household size: total
households, 1-person, 2-person, 3-person, etc.

``` r
m = dim(df)[1]
N_households   <- df[1, 2:8]
median_dollars <- df[m, 2:8]


N_households
## # A tibble: 1 x 7
##        X2     X3     X4     X5     X6    X7    X8
##     <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl>
## 1 1285119 340413 424450 213245 190935 79498 36578
median_dollars
## # A tibble: 1 x 7
##      X2    X3    X4    X5    X6    X7    X8
##   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
## 1 30140 16683 32302 37125 40897 38266 37143
```

Summarize the number of households total and the median income.

``` r
N_households <- unname(unlist(N_households[1, 1]))
N_households
## [1] 1285119
median_dollars <- unname(unlist(median_dollars[1, 1]))
median_dollars
## [1] 30140
```

Omit the first and last row, add the median column

``` r
df <- df[2:(m-1), ] %>% 
    mutate(median_income =  median_dollars) %>% 
    select(state, X2, median_income, X1) %>% 
    rename(bracket = X1, households = X2)

m = dim(df)[1]
knitr::kable(df)
```

| state    | households | median\_income | bracket              |
| :------- | ---------: | -------------: | :------------------- |
| Colorado |      67384 |          30140 | Less than $5,000     |
| Colorado |     108370 |          30140 | $5,000 to $9,999     |
| Colorado |      62779 |          30140 | $10,000 to $12,499   |
| Colorado |      54159 |          30140 | $12,500 to $14,999   |
| Colorado |      62295 |          30140 | $15,000 to $17,499   |
| Colorado |      56158 |          30140 | $17,500 to $19,999   |
| Colorado |      64977 |          30140 | $20,000 to $22,499   |
| Colorado |      54267 |          30140 | $22,500 to $24,999   |
| Colorado |      59657 |          30140 | $25,000 to $27,499   |
| Colorado |      49150 |          30140 | $27,500 to $29,999   |
| Colorado |      60126 |          30140 | $30,000 to $32,499   |
| Colorado |      44212 |          30140 | $32,500 to $34,999   |
| Colorado |      49067 |          30140 | $35,000 to $37,499   |
| Colorado |      40033 |          30140 | $37,500 to $39,999   |
| Colorado |      47203 |          30140 | $40,000 to $42,499   |
| Colorado |      34321 |          30140 | $42,500 to $44,999   |
| Colorado |      37278 |          30140 | $45,000 to $47,499   |
| Colorado |      29540 |          30140 | $47,500 to $49,999   |
| Colorado |      58337 |          30140 | $50,000 to $54,999   |
| Colorado |      44412 |          30140 | $55,000 to $59,999   |
| Colorado |      91036 |          30140 | $60,000 to $74,499   |
| Colorado |      61432 |          30140 | $75,000 to $99,999   |
| Colorado |      23048 |          30140 | $100,000 to $124,999 |
| Colorado |       9261 |          30140 | $125,000 to $149,999 |
| Colorado |      16617 |          30140 | $150,000 or more     |

Separate the brackets

``` r
df <- df %>%
    separate(bracket, into = c("lower", "upper"), sep = "to")
## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 2 rows [1,
## 25].

knitr::kable(df)
```

| state    | households | median\_income | lower            | upper    |
| :------- | ---------: | -------------: | :--------------- | :------- |
| Colorado |      67384 |          30140 | Less than $5,000 | NA       |
| Colorado |     108370 |          30140 | $5,000           | $9,999   |
| Colorado |      62779 |          30140 | $10,000          | $12,499  |
| Colorado |      54159 |          30140 | $12,500          | $14,999  |
| Colorado |      62295 |          30140 | $15,000          | $17,499  |
| Colorado |      56158 |          30140 | $17,500          | $19,999  |
| Colorado |      64977 |          30140 | $20,000          | $22,499  |
| Colorado |      54267 |          30140 | $22,500          | $24,999  |
| Colorado |      59657 |          30140 | $25,000          | $27,499  |
| Colorado |      49150 |          30140 | $27,500          | $29,999  |
| Colorado |      60126 |          30140 | $30,000          | $32,499  |
| Colorado |      44212 |          30140 | $32,500          | $34,999  |
| Colorado |      49067 |          30140 | $35,000          | $37,499  |
| Colorado |      40033 |          30140 | $37,500          | $39,999  |
| Colorado |      47203 |          30140 | $40,000          | $42,499  |
| Colorado |      34321 |          30140 | $42,500          | $44,999  |
| Colorado |      37278 |          30140 | $45,000          | $47,499  |
| Colorado |      29540 |          30140 | $47,500          | $49,999  |
| Colorado |      58337 |          30140 | $50,000          | $54,999  |
| Colorado |      44412 |          30140 | $55,000          | $59,999  |
| Colorado |      91036 |          30140 | $60,000          | $74,499  |
| Colorado |      61432 |          30140 | $75,000          | $99,999  |
| Colorado |      23048 |          30140 | $100,000         | $124,999 |
| Colorado |       9261 |          30140 | $125,000         | $149,999 |
| Colorado |      16617 |          30140 | $150,000 or more | NA       |

Move the first row “less than”

``` r
df <- df %>% 
    mutate(lower = str_replace(lower, "Less than", "")) %>% 
    mutate(lower = str_replace(lower, "or more", ""))

df$upper[1] <- df$lower[1]
df$lower[1] <- 0
df$upper[m] <- NA

knitr::kable(df)
```

| state    | households | median\_income | lower    | upper    |
| :------- | ---------: | -------------: | :------- | :------- |
| Colorado |      67384 |          30140 | 0        | $5,000   |
| Colorado |     108370 |          30140 | $5,000   | $9,999   |
| Colorado |      62779 |          30140 | $10,000  | $12,499  |
| Colorado |      54159 |          30140 | $12,500  | $14,999  |
| Colorado |      62295 |          30140 | $15,000  | $17,499  |
| Colorado |      56158 |          30140 | $17,500  | $19,999  |
| Colorado |      64977 |          30140 | $20,000  | $22,499  |
| Colorado |      54267 |          30140 | $22,500  | $24,999  |
| Colorado |      59657 |          30140 | $25,000  | $27,499  |
| Colorado |      49150 |          30140 | $27,500  | $29,999  |
| Colorado |      60126 |          30140 | $30,000  | $32,499  |
| Colorado |      44212 |          30140 | $32,500  | $34,999  |
| Colorado |      49067 |          30140 | $35,000  | $37,499  |
| Colorado |      40033 |          30140 | $37,500  | $39,999  |
| Colorado |      47203 |          30140 | $40,000  | $42,499  |
| Colorado |      34321 |          30140 | $42,500  | $44,999  |
| Colorado |      37278 |          30140 | $45,000  | $47,499  |
| Colorado |      29540 |          30140 | $47,500  | $49,999  |
| Colorado |      58337 |          30140 | $50,000  | $54,999  |
| Colorado |      44412 |          30140 | $55,000  | $59,999  |
| Colorado |      91036 |          30140 | $60,000  | $74,499  |
| Colorado |      61432 |          30140 | $75,000  | $99,999  |
| Colorado |      23048 |          30140 | $100,000 | $124,999 |
| Colorado |       9261 |          30140 | $125,000 | $149,999 |
| Colorado |      16617 |          30140 | $150,000 | NA       |

Now remove all the dollar signs

``` r
df <- df %>% 
    mutate(lower = str_replace(lower, "\\$", "")) %>% 
    mutate(lower = str_replace(lower, ",", "")) %>% 
    mutate(lower = as.integer(lower))

df <- df %>% 
    mutate(upper = str_replace(upper, "\\$", "")) %>% 
    mutate(upper = str_replace(upper, ",", "")) %>% 
    mutate(upper = as.integer(upper))

glimpse(df)
## Observations: 25
## Variables: 5
## $ state         <chr> "Colorado", "Colorado", "Colorado", "Colorado", ...
## $ households    <dbl> 67384, 108370, 62779, 54159, 62295, 56158, 64977...
## $ median_income <dbl> 30140, 30140, 30140, 30140, 30140, 30140, 30140,...
## $ lower         <int> 0, 5000, 10000, 12500, 15000, 17500, 20000, 2250...
## $ upper         <int> 5000, 9999, 12499, 14999, 17499, 19999, 22499, 2...

knitr::kable(df)
```

| state    | households | median\_income |  lower |  upper |
| :------- | ---------: | -------------: | -----: | -----: |
| Colorado |      67384 |          30140 |      0 |   5000 |
| Colorado |     108370 |          30140 |   5000 |   9999 |
| Colorado |      62779 |          30140 |  10000 |  12499 |
| Colorado |      54159 |          30140 |  12500 |  14999 |
| Colorado |      62295 |          30140 |  15000 |  17499 |
| Colorado |      56158 |          30140 |  17500 |  19999 |
| Colorado |      64977 |          30140 |  20000 |  22499 |
| Colorado |      54267 |          30140 |  22500 |  24999 |
| Colorado |      59657 |          30140 |  25000 |  27499 |
| Colorado |      49150 |          30140 |  27500 |  29999 |
| Colorado |      60126 |          30140 |  30000 |  32499 |
| Colorado |      44212 |          30140 |  32500 |  34999 |
| Colorado |      49067 |          30140 |  35000 |  37499 |
| Colorado |      40033 |          30140 |  37500 |  39999 |
| Colorado |      47203 |          30140 |  40000 |  42499 |
| Colorado |      34321 |          30140 |  42500 |  44999 |
| Colorado |      37278 |          30140 |  45000 |  47499 |
| Colorado |      29540 |          30140 |  47500 |  49999 |
| Colorado |      58337 |          30140 |  50000 |  54999 |
| Colorado |      44412 |          30140 |  55000 |  59999 |
| Colorado |      91036 |          30140 |  60000 |  74499 |
| Colorado |      61432 |          30140 |  75000 |  99999 |
| Colorado |      23048 |          30140 | 100000 | 124999 |
| Colorado |       9261 |          30140 | 125000 | 149999 |
| Colorado |      16617 |          30140 | 150000 |     NA |

The data are now tidy and can be used to compute the income inequality
values I’m looking for.

This is a point at which i would write the state data to file and repeat
(using a for loop for example) for all 50 states.

## analysis

My goal is to determine income inequality of the state, defined as the
ratio of the total income of all households earning the state median
income or less to the total income of all households in the state.

The max bracket can’t be averaged because there is no upper limit, so
I’ll just assign lower to upper for that row.

``` r
df$upper[m] <- df$lower[m]
```

use the mean of the bracket to estimate the income for that bracket’s
households.

``` r
df <- df %>%
    mutate(bracket_mean = round((lower + upper) / 2, 0))

knitr::kable(df)
```

| state    | households | median\_income |  lower |  upper | bracket\_mean |
| :------- | ---------: | -------------: | -----: | -----: | ------------: |
| Colorado |      67384 |          30140 |      0 |   5000 |          2500 |
| Colorado |     108370 |          30140 |   5000 |   9999 |          7500 |
| Colorado |      62779 |          30140 |  10000 |  12499 |         11250 |
| Colorado |      54159 |          30140 |  12500 |  14999 |         13750 |
| Colorado |      62295 |          30140 |  15000 |  17499 |         16250 |
| Colorado |      56158 |          30140 |  17500 |  19999 |         18750 |
| Colorado |      64977 |          30140 |  20000 |  22499 |         21250 |
| Colorado |      54267 |          30140 |  22500 |  24999 |         23750 |
| Colorado |      59657 |          30140 |  25000 |  27499 |         26250 |
| Colorado |      49150 |          30140 |  27500 |  29999 |         28750 |
| Colorado |      60126 |          30140 |  30000 |  32499 |         31250 |
| Colorado |      44212 |          30140 |  32500 |  34999 |         33750 |
| Colorado |      49067 |          30140 |  35000 |  37499 |         36250 |
| Colorado |      40033 |          30140 |  37500 |  39999 |         38750 |
| Colorado |      47203 |          30140 |  40000 |  42499 |         41250 |
| Colorado |      34321 |          30140 |  42500 |  44999 |         43750 |
| Colorado |      37278 |          30140 |  45000 |  47499 |         46250 |
| Colorado |      29540 |          30140 |  47500 |  49999 |         48750 |
| Colorado |      58337 |          30140 |  50000 |  54999 |         52500 |
| Colorado |      44412 |          30140 |  55000 |  59999 |         57500 |
| Colorado |      91036 |          30140 |  60000 |  74499 |         67250 |
| Colorado |      61432 |          30140 |  75000 |  99999 |         87500 |
| Colorado |      23048 |          30140 | 100000 | 124999 |        112500 |
| Colorado |       9261 |          30140 | 125000 | 149999 |        137500 |
| Colorado |      16617 |          30140 | 150000 | 150000 |        150000 |

Finally, the product of mean income and the number of households gives a
total income for each bracket. Use these results to find the total
income.

``` r
df <- df %>% 
    mutate(bracket_income = households * bracket_mean)

knitr::kable(df)
```

| state    | households | median\_income |  lower |  upper | bracket\_mean | bracket\_income |
| :------- | ---------: | -------------: | -----: | -----: | ------------: | --------------: |
| Colorado |      67384 |          30140 |      0 |   5000 |          2500 |       168460000 |
| Colorado |     108370 |          30140 |   5000 |   9999 |          7500 |       812775000 |
| Colorado |      62779 |          30140 |  10000 |  12499 |         11250 |       706263750 |
| Colorado |      54159 |          30140 |  12500 |  14999 |         13750 |       744686250 |
| Colorado |      62295 |          30140 |  15000 |  17499 |         16250 |      1012293750 |
| Colorado |      56158 |          30140 |  17500 |  19999 |         18750 |      1052962500 |
| Colorado |      64977 |          30140 |  20000 |  22499 |         21250 |      1380761250 |
| Colorado |      54267 |          30140 |  22500 |  24999 |         23750 |      1288841250 |
| Colorado |      59657 |          30140 |  25000 |  27499 |         26250 |      1565996250 |
| Colorado |      49150 |          30140 |  27500 |  29999 |         28750 |      1413062500 |
| Colorado |      60126 |          30140 |  30000 |  32499 |         31250 |      1878937500 |
| Colorado |      44212 |          30140 |  32500 |  34999 |         33750 |      1492155000 |
| Colorado |      49067 |          30140 |  35000 |  37499 |         36250 |      1778678750 |
| Colorado |      40033 |          30140 |  37500 |  39999 |         38750 |      1551278750 |
| Colorado |      47203 |          30140 |  40000 |  42499 |         41250 |      1947123750 |
| Colorado |      34321 |          30140 |  42500 |  44999 |         43750 |      1501543750 |
| Colorado |      37278 |          30140 |  45000 |  47499 |         46250 |      1724107500 |
| Colorado |      29540 |          30140 |  47500 |  49999 |         48750 |      1440075000 |
| Colorado |      58337 |          30140 |  50000 |  54999 |         52500 |      3062692500 |
| Colorado |      44412 |          30140 |  55000 |  59999 |         57500 |      2553690000 |
| Colorado |      91036 |          30140 |  60000 |  74499 |         67250 |      6122171000 |
| Colorado |      61432 |          30140 |  75000 |  99999 |         87500 |      5375300000 |
| Colorado |      23048 |          30140 | 100000 | 124999 |        112500 |      2592900000 |
| Colorado |       9261 |          30140 | 125000 | 149999 |        137500 |      1273387500 |
| Colorado |      16617 |          30140 | 150000 | 150000 |        150000 |      2492550000 |

Group and summarize

``` r
all_income <- df %>% 
    group_by(state) %>% 
    summarize(all_income_M = sum(bracket_income) / 1e+6)

all_income 
## # A tibble: 1 x 2
##   state    all_income_M
##   <chr>           <dbl>
## 1 Colorado       46933.
```

Filter for all households with income less than or equal to the median.
Use these results to find the total income of low-income households.
Income is now in millions of dollars.

``` r
low_income <- df %>% 
    filter(lower <= median_income)%>% 
    group_by(state) %>% 
    summarize(low_income_M = sum(bracket_income) / 1e+6)

low_income
## # A tibble: 1 x 2
##   state    low_income_M
##   <chr>           <dbl>
## 1 Colorado       12025.
```

Join the two df

``` r
inequality_df <- left_join(low_income, all_income, by = "state") %>% 
    mutate(ineq = round(low_income_M / all_income_M, 3))

kable(inequality_df)
```

| state    | low\_income\_M | all\_income\_M |  ineq |
| :------- | -------------: | -------------: | ----: |
| Colorado |       12025.04 |       46932.69 | 0.256 |

Write this to file or add it as a new row to a data frame used for
collecting each state or province in a loop.
