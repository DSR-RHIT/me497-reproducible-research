
grouped observations
====================

getting started
---------------

We are using a database from Starfleet Academy showing the progress of students ever enrolled over a 15 year period.

-   Download the data set from the course repo, `data/cm047_starfleet-students.csv`. Save it to your `practiceR/data/` directory.
-   Launch your `practiceR.Rproj` project.
-   Create a `grouping-data.Rmd` in your `practiceR/scripts/` directory. Write the code chunks in the tutorial with as much of the prose as you like to explain the work.

``` r
# packages we'll use
library(readr)
library(plyr)
library(dplyr)
library(ggplot2)
```

data
----

Read the file and examine it.

``` r
# read the midfield data set 
df0 <- read_csv("data/cm047_starfleet-students.csv") 

# examine it
glimpse(df0)
## Observations: 111,925
## Variables: 5
## $ Sex      <chr> "Male", "Male", "Male", "Male", "Female", "Male", "Fe...
## $ Species  <chr> "Human", "Human", "Human", "Human", "Human", "Human",...
## $ Start    <chr> "Personnel", "Engineering", "Tactical", "Medical", "M...
## $ Finish   <chr> "Resigned", "Marines", "Tactical", "Medical", "Intell...
## $ Transfer <chr> "yes", "no", "yes", "no", "yes", "no", "no", "yes", "...
```

-   The data set is already tidy
-   Each row is one student (one observation)
-   All the data are character type (no numbers)

Let's look at each variable (column) in turn.

The first column is **Sex**. The `table()` function tells us the unique set of entries in the column and how many of each. Here, we find only `Female` and `Male` because those are the only two sex/gender categories used by the institutions at the time the data were collected.

``` r
table(df0$Sex)
## 
## Female   Male 
##  23586  88339
```

A quick check: add the two numbers, \(23586 + 88339 = 111925\), which agrees with the number of observations reported in the `glimpse()` above.

The **Species** variable has four possible values, indicating that any students not in these four classifications have been omitted from the data set.

``` r
table(df0$Species)
## 
##  Bajoran Betazoid    Human   Vulcan 
##     8582     4524    84605    14214
```

Repeat the quick check: the sum of the 4 numbers is 111925, again, as expected.

The **Start** variable indicates the disciplinary track the students declared when they started at the Academy.

``` r
table(df0$Start)
## 
##  Engineering Intelligence      Marines      Medical   Operations 
##        23723         4021        13350        14483         8882 
##    Personnel     Security     Tactical 
##         2811        17659        26996
```

The **Finish** variable states the student destination after 6 years, either the major in which they graduated or `Resigned` if they resigned or washed out.

``` r
table(df0$Finish)
## 
##  Engineering Intelligence      Marines      Medical   Operations 
##        12384         6361         2576         7501         8114 
##    Personnel     Resigned     Security     Tactical 
##         2890        44819        11576        15704
```

The **Transfer** variable value `yes` means that students transferred into the academy from another institution off-planet; `no` means that they were not a transfer student.

``` r
table(df0$Transfer)
## 
##    no   yes 
## 86475 25450
```

We don't see any NA values in the columns, but to be sure, let's check for complete cases:

``` r
unique(complete.cases(df0))
## [1] TRUE
```

Had even one observation been incomplete, the `unique()` function would have returned both a `TRUE` (for complete cases) and `FALSE` (for incomplete cases). I conclude that every observation is complete (no entries blank or missing).

counting
--------

In a data set like this one, we often want to answer a question, "How many students do X?" where "X" could be "started in a discipline", "graduated in a discipline", "switched disciplines", etc.

With a data set this large, we can also disaggregate by Sex, Species, Discipline, and Transfer status. Thus a question could be more detailed, e.g., "In Operations, do Female graduation rates differ by Species and Transfer status?"

To answer questions like these, we have to count how many students are in a category. The `dplyr` package simplifies the process with its `group_by()` and `summarize()` functions.

For example, let's count the number of Males and Females across all species. The result should match the results we got from `table()` earlier.

``` r
# count by sex only 
my_grouping <- group_by(df0, Sex)
df1         <- dplyr::summarize(my_grouping, Count = n())
```

-   `n()` returns the number of instances (or frequency) of the grouped value
-   `Count` is an arbitrary label for the new column, as seen when I print the new data frame `df1` below

``` r
# print the result
df1
## # A tibble: 2 × 2
##      Sex Count
##    <chr> <int>
## 1 Female 23586
## 2   Male 88339
```

We could have grouped by Species.

``` r
# count by ethnicity 
my_grouping <- group_by(df0, Species)
df2         <- dplyr::summarize(my_grouping, Count = n())

# result
df2
## # A tibble: 4 × 2
##    Species Count
##      <chr> <int>
## 1  Bajoran  8582
## 2 Betazoid  4524
## 3    Human 84605
## 4   Vulcan 14214
```

Next, let's count by Sex and Species.

``` r
# count by sex and ethnicity 
my_grouping <- group_by(df0, Sex, Species)
df3         <- dplyr::summarize(my_grouping, Count = n())

# print the result
df3
## Source: local data frame [8 x 3]
## Groups: Sex [?]
## 
##      Sex  Species Count
##    <chr>    <chr> <int>
## 1 Female  Bajoran  1936
## 2 Female Betazoid   956
## 3 Female    Human 15663
## 4 Female   Vulcan  5031
## 5   Male  Bajoran  6646
## 6   Male Betazoid  3568
## 7   Male    Human 68942
## 8   Male   Vulcan  9183
```

Or, by Sex and Discipline at graduation.

``` r
# count by sex and finish  
my_grouping <- group_by(df0, Sex, Finish)
df3         <- dplyr::summarize(my_grouping, Count = n())

# print the result
df3
## Source: local data frame [18 x 3]
## Groups: Sex [?]
## 
##       Sex       Finish Count
##     <chr>        <chr> <int>
## 1  Female  Engineering  1779
## 2  Female Intelligence  1599
## 3  Female      Marines   429
## 4  Female      Medical  2761
## 5  Female   Operations  2973
## 6  Female    Personnel   811
## 7  Female     Resigned  8627
## 8  Female     Security  2457
## 9  Female     Tactical  2150
## 10   Male  Engineering 10605
## 11   Male Intelligence  4762
## 12   Male      Marines  2147
## 13   Male      Medical  4740
## 14   Male   Operations  5141
## 15   Male    Personnel  2079
## 16   Male     Resigned 36192
## 17   Male     Security  9119
## 18   Male     Tactical 13554
```

As you can see, we can group by any combination of variables we are interested in.

example
-------

Suppose we want to compare the demographic distribution of students by Sex and Species at graduation in 5 most popular disciplines (Tactical, Engineering, Security, Medical, and Operations). In other words, what does the graduating class in each discipline look like?

We start by subsetting the data for these majors only.

``` r
df4 <- df0 %>%
    filter(Finish %in% c("Tactical", "Engineering", "Security", "Medical", "Operations"))
```

Next, let's combine Sex and Species into a single variable called `Specgen`.

``` r
df4 <- df4 %>%
    mutate(Specgen = paste(Species, Sex)) %>%
    select(Specgen, Finish) 

glimpse(df4)
## Observations: 55,279
## Variables: 2
## $ Specgen <chr> "Human Male", "Human Male", "Human Female", "Human Mal...
## $ Finish  <chr> "Tactical", "Medical", "Medical", "Engineering", "Engi...
```

I kept only the two columns `Specgen` and `Finish`. Note the number of observations is 55279. Each row is still one student.

Now we can count using the `group_by()` and `summarize()`functions from `dplyr`. (I use the syntax `dplyr::summarize()` to ensure that the dplyr version of summarize is used rather than the plyr version of summarize.)

``` r
# count by sex only 
my_grouping <- group_by(df4, Specgen, Finish)
df5         <- dplyr::summarize(my_grouping, Count = n())

# examine the result
glimpse(df5)
## Observations: 40
## Variables: 3
## $ Specgen <chr> "Bajoran Female", "Bajoran Female", "Bajoran Female", ...
## $ Finish  <chr> "Engineering", "Medical", "Operations", "Security", "T...
## $ Count   <int> 242, 274, 303, 130, 135, 1436, 387, 475, 304, 774, 67,...
```

The number of observations is 40 because by summarizing, we now have 8 Species groups in each of 5 disciplines.

Before graphing the data, I know we'll want to order the rows and panels by the counts. So we convert the character variables to factors and order them by count (a topic covered in detail in the line graph tutorial).

``` r
# make the two categorical vectors into factors, ordered by count
df5$Specgen <- factor(df5$Specgen, 
  levels = unique(df5$Specgen[order(df5$Count)])
  )

df5$Finish <- factor(df5$Finish, 
  levels = unique(df5$Finish[order(df5$Count)])
  )
```

I'd like to use this data frame in a subsequent tutorial, so I'll write it to file.

``` r
write_csv(df5, "data/cm047_starfleet-students-top5.csv")
```

graph
-----

A dot plot is suitable for these type of data. The sex/ethnicity groups are the rows, the major is the panel (conditioning variable) and the number of students is the the common horizontal scale.

``` r
fig <- ggplot(data = df5, aes(x = Count/1000, y = Specgen)) + 
    geom_point() + 
    facet_wrap(~Finish, ncol = 1) + 
    labs(x = "Graduates in discipline (x1000)", y = "")

ggsave("results/cm047_destinations.png", plot = fig, 
             width = 4, height = 6.5, units = "in", dpi = 125)
```

![](../results/cm047_destinations.png)

------------------------------------------------------------------------

[main page](../README.md)
