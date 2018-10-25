Testing *captioner*
================
RAL
2018-09-17

## The usual setup

``` r
library(knitr)
opts_knit$set(root.dir = "../")
opts_chunk$set(echo = TRUE)
```

## Captioner package

``` r
library(captioner)
```

## Make some data

``` r
df1 <- head(mtcars, n = 5L)
```

## Assign the general prefixes used by captioner

``` r
# ensure you assign these once at the beginning
table_id  <- captioner(prefix = "Table")
figure_id <- captioner(prefix = "Figure")
```

## Assign a specific table caption

``` r
table_id(name = "ref_idx_1", caption = "A descriptive caption for the table.")
```

## Use the table ID in-line

An excerpt of data from our fabulous experiment is shown in Table
1.

## Use the table ID in the code chunk

|  mpg | cyl | disp |  hp | drat |    wt |  qsec | vs | am | gear | carb |
| ---: | --: | ---: | --: | ---: | ----: | ----: | -: | -: | ---: | ---: |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.620 | 16.46 |  0 |  1 |    4 |    4 |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.875 | 17.02 |  0 |  1 |    4 |    4 |
| 22.8 |   4 |  108 |  93 | 3.85 | 2.320 | 18.61 |  1 |  1 |    4 |    1 |
| 21.4 |   6 |  258 | 110 | 3.08 | 3.215 | 19.44 |  1 |  0 |    3 |    1 |
| 18.7 |   8 |  360 | 175 | 3.15 | 3.440 | 17.02 |  0 |  0 |    3 |    2 |

Table 1: A descriptive caption for the
table.

## again

``` r
table_id(name = "another_table", caption = "A better caption")
```

    ## [1] "Table  2: A better caption"

``` r
kable(df1, caption = table_id("another_table"), row.names = FALSE)
```

|  mpg | cyl | disp |  hp | drat |    wt |  qsec | vs | am | gear | carb |
| ---: | --: | ---: | --: | ---: | ----: | ----: | -: | -: | ---: | ---: |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.620 | 16.46 |  0 |  1 |    4 |    4 |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.875 | 17.02 |  0 |  1 |    4 |    4 |
| 22.8 |   4 |  108 |  93 | 3.85 | 2.320 | 18.61 |  1 |  1 |    4 |    1 |
| 21.4 |   6 |  258 | 110 | 3.08 | 3.215 | 19.44 |  1 |  0 |    3 |    1 |
| 18.7 |   8 |  360 | 175 | 3.15 | 3.440 | 17.02 |  0 |  0 |    3 |    2 |

Table 2: A better caption

This sentence refers to Table 2.

This sentence refers to Table
1.

##### page break

###### ![](../resources/images/hockey-stick-graph.png)

###### Figure 1: Michael Mann’s famous hockery-stick graph

``` r
figure_id(name = "hockey", caption = "Michael Mann's famous hockery-stick graph")
```

###### ![](../resources/images/hockey-stick-graph.png)

###### Figure 1: Michael Mann’s famous hockery-stick graph

Using Heading 6 does not center a
table.

###### 

|  mpg | cyl | disp |  hp | drat |    wt |  qsec | vs | am | gear | carb |
| ---: | --: | ---: | --: | ---: | ----: | ----: | -: | -: | ---: | ---: |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.620 | 16.46 |  0 |  1 |    4 |    4 |
| 21.0 |   6 |  160 | 110 | 3.90 | 2.875 | 17.02 |  0 |  1 |    4 |    4 |
| 22.8 |   4 |  108 |  93 | 3.85 | 2.320 | 18.61 |  1 |  1 |    4 |    1 |
| 21.4 |   6 |  258 | 110 | 3.08 | 3.215 | 19.44 |  1 |  0 |    3 |    1 |
| 18.7 |   8 |  360 | 175 | 3.15 | 3.440 | 17.02 |  0 |  0 |    3 |    2 |

Table 2: A better caption
