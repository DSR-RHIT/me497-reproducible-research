
# dot plot

The *dot plot* by Bill Cleveland is a preferred substitute for data
typically shown in pie charts or bar charts (Robbins, 2013). Dot plots
are suitable for data that have the following attributes:

  - One quantitative variable  
  - One categorical variable, often encoded as a factor
  - Optional: the data may include additional factors that we can use
    for creating graph facets

Recall that in R, factors are categorical variables that have been
encoded with a fixed and known set of possible values.

## data

Create `dot_plot.Rmd` in your `practice_work/exercises/` directory.
Write the code chunks in the tutorial with as much of the prose as you
like to explain the work.

``` r
library(tidyverse)
library(forcats)
```

The base R installation includes US `state` data with all data arranged
according to alphabetical order of the state names. (Learn more by
typing `?state` in your console.) I have tidied the data somewhat and
saved it to the course data directory on GitHub as
`data/cm5017_state.csv`. You can download the file and save it in your
`practice_work/data/` directory.

Once the file is saved on your machine, read the file with your Rmd
script.

``` r
df <- read_csv('data/cm5017_state.csv')
glimpse(df)
## Observations: 50
## Variables: 9
## $ abbr       <chr> "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL...
## $ name       <chr> "Alabama", "Alaska", "Arizona", "Arkansas", "Califo...
## $ area       <int> 51609, 589757, 113909, 53104, 158693, 104247, 5009,...
## $ region     <chr> "South", "West", "West", "South", "West", "West", "...
## $ population <int> 3615, 365, 2212, 2110, 21198, 2541, 3100, 579, 8277...
## $ income     <int> 3624, 6315, 4530, 3378, 5114, 4884, 5348, 4809, 481...
## $ illiteracy <dbl> 2.1, 1.5, 1.8, 1.9, 1.1, 0.7, 1.1, 0.9, 1.3, 2.0, 1...
## $ murder     <dbl> 15.1, 11.3, 7.8, 10.1, 10.3, 6.8, 3.1, 6.2, 10.7, 1...
## $ frost      <int> 20, 152, 15, 65, 20, 166, 139, 103, 11, 60, 0, 126,...
```

You can see we have variable types: character, integer, and double.

## dot plot

Suppose we want to compare the areas of the states.

  - one quantitative variable, `area`
  - one categorical variable, `name`

<!-- end list -->

``` r
ggplot(df, aes(x = area, y = name)) +
    geom_point()
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

With area values in the hundreds of thousands of square miles, the graph
scale will easier to read if we display in thousands of square miles. Of
course, when scaling the axis units like this, I should also add an axis
label to indicate the scaling.

``` r
# create a new column with area in 1000s of sq mi
df <- df %>%
    mutate(scaled_area = area / 1000)

ggplot(df, aes(x = scaled_area, y = name)) +
    geom_point() +
    labs(x = "Area (square miles x 1000)", y = "")
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

The state names are a character variable so they are ordered
alphabetically on the y-axis.

## row ordering with factors

We prefer to order the state names by the state area. First, we’ll show
that name is presently a character variable.

``` r
typeof(df$name)
## [1] "character"
```

Following the example in
[section 15.4](http://r4ds.had.co.nz/factors.html#modifying-factor-order)
in the text (Wickham & Grolemund, 2016), we encode the state names as
factors, ordered by area.

``` r
df <- df %>% 
  mutate(name = fct_reorder(name, scaled_area)) 
```

`glimpse()` shows us that name is now a factor with 50 levels.

``` r
glimpse(df$name)
##  Factor w/ 50 levels "Rhode Island",..: 22 50 45 24 48 43 3 2 29 30 ...
```

Recall that factors are encoded behind the scenes as integers
\(1, ..., n\). `typeof()` reveals the existence of the integers now
associated with the state names.

``` r
# after fct_reorder(), name is an integer type
typeof(df$name)
## [1] "integer"
```

The order of the integers \(1, ..., n\) is the order of the levels.
Using `levels()`, we see that level 1 is Rhode Island (the smallest
area) and level 50 is Alaska (the largest area).

``` r
levels(df$name)
##  [1] "Rhode Island"   "Delaware"       "Connecticut"    "Hawaii"        
##  [5] "New Jersey"     "Massachusetts"  "New Hampshire"  "Vermont"       
##  [9] "Maryland"       "West Virginia"  "South Carolina" "Maine"         
## [13] "Indiana"        "Kentucky"       "Virginia"       "Ohio"          
## [17] "Tennessee"      "Pennsylvania"   "Mississippi"    "Louisiana"     
## [21] "New York"       "Alabama"        "North Carolina" "Arkansas"      
## [25] "Wisconsin"      "Iowa"           "Illinois"       "Michigan"      
## [29] "Florida"        "Georgia"        "Washington"     "Missouri"      
## [33] "Oklahoma"       "North Dakota"   "South Dakota"   "Nebraska"      
## [37] "Kansas"         "Idaho"          "Minnesota"      "Utah"          
## [41] "Oregon"         "Wyoming"        "Colorado"       "Nevada"        
## [45] "Arizona"        "New Mexico"     "Montana"        "California"    
## [49] "Texas"          "Alaska"
```

Now, using the same plot commands as before, the state names are ordered
by area.

``` r
ggplot(df, aes(x = scaled_area, y = name)) +
    geom_point() +
    labs(x = "Area (square miles x 1000)", y = "")
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

That’s better, but the rows are too close together, so we need to
control the figure size.

## figure sizing

When creating graphs in stand-alone R scripts from your `scripts`
directory, you would typically write your graph to file using `ggsave()`
or possibly `png()`.

In either case, you can set the resolution in dpi and the figure size.

``` r
ggsave(filename = "cm5019-states.png", 
    path   = "results",
    width  = 6, 
    height = 8, 
    units  = "in", # "in", "cm", or "mm"
    dpi    = 600)
```

Then import the figure into the R Markdown document using
`knitr::include_graphics()`.

``` r
include_graphics("../results/cm5019-states.png")
```

![](../results/cm5019-states.png)<!-- -->

I can control the screen view by using the `out.width` argument of the
knitr code chunk.

<pre class="r"><code>```{r out.width = "70%"}
include_graphics("../results/cm5019-states.png")
<code>```</code>
</code></pre>

<img src="../results/cm5019-states.png" width="70%" />

## a second categorical variable

Suppose we want to compare the areas of the states by region.

  - one quantitative variable, `area`
  - one categorical variable, `name`
  - a second categorical variable, `region`

The values for region are:

``` r
unique(df$region)
## [1] "South"     "West"      "Northeast" "Midwest"
typeof(df$region)
## [1] "character"
```

So we have four regions and I want to encode them as factors, ordered by
the total area of all states in the region.

``` r
df <- df %>% 
  mutate(region = fct_reorder(region, scaled_area, sum))

# view the results 
glimpse(df$region)
##  Factor w/ 4 levels "Northeast","Midwest",..: 3 4 4 3 4 4 1 3 3 3 ...

levels(df$region)
## [1] "Northeast" "Midwest"   "South"     "West"
```

Thus `region` is now a factor with `"Northeast"`at level 1 (the smallest
total area) and `"West"` at level 4 (largest total area).

Graph again, adding `facet_grid()` to create one panel per region. We
set the `as.table = FALSE` argument to arrange the levels 1 through 4
from bottom to top. (With `as.table = TRUE`, the levels are arranged in
“table” order, from level 1 to level 4 from top to bottom.)

``` r
f1 <- ggplot(df, aes(x = scaled_area, y = name)) +
  geom_point() +
  labs(x = "Area (square miles x 1000)", y = "") + 
  facet_grid(rows = vars(region), 
      as.table = FALSE)

print(f1)
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

Ouch, that’s ugly.

There a lot of blank rows because a state can be a member of only one
region. To eliminate the names that don’t exist in a region, we add the
`scales = "free_y"` argument.

``` r
f2 <- f1 +
  facet_grid(rows = vars(region), 
      as.table = FALSE, 
      scales = "free_y")

print(f2)
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

That’s better. However, because all the facets have the same height and
the regions have different numbers of states, the gap between rows is
different in every facet. To allow the panel heights to self-adjust for
equal row spacing, we add the `space = "free"` argument.

``` r
f3 <- f2 + 
  facet_grid(rows = vars(region), 
      as.table = FALSE, 
      scales = "free_y", 
      space = "free")

print(f3)
```

![](cm5019_dot-plot_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

Pretty
neat\!

<!-- ## graphics for communication  -->

<!-- Before sharing the graph with an audience, we might make a few more aesthetic edits. Most of these changes are described in [Chapter 28](http://r4ds.had.co.nz/graphics-for-communication.html) of the text.  -->

<!-- First, to help the reader to read the facet headings, we can  -->

<!-- - `theme(strip.text = element_blank())` to delete the vertical panel titles  -->

<!-- - `geom_text()` to label the regions inside each facet  -->

<!-- - `labs(y = "")`  to delete the y-axis title  -->

<!-- ```{r fig.height=8} -->

<!-- f2 <- f1 +  -->

<!--   labs(x = "Area (square miles x 1000)", y = "") +  -->

<!--    theme(strip.text = element_blank()) + -->

<!--   geom_text(data = df, aes(x = 600, y = 2, label = region),  -->

<!--                    size = 6, hjust = "right", color = "gray55") -->

<!-- f2 -->

<!-- ``` -->

<!-- Use a theme to revise the overall look of the graph. -->

<!-- ```{r fig.height=8} -->

<!-- f3 <- f2 + -->

<!--    theme_light() +  -->

<!--   theme(strip.text = element_blank()) -->

<!-- f3 -->

<!-- ``` -->

## references

<!-- Figure 4.3 is from Robbins and the `ggplot2` code is adapted from Zhao & Bryan.   -->

<!-- 1. Naomi Robbins (2013) [*Creating More Effective Graphs*](http://www.nbr-graphs.com/resources/recommended-books/), Chart House.      -->

<!-- 2. Joanna Zhao and Jenny Bryan,  [r-graph-catalog](https://github.com/jennybc/r-graph-catalog), providing ggplot2 scripts for nearly all of the graphs in Robbins' book.     -->

<!-- 3. Winston Chang, [Facets (ggplot2)](http://www.cookbook-r.com/Graphs/Facets_(ggplot2)), [Cookbook for R](http://www.cookbook-r.com/).   -->

<div id="refs" class="references">

<div id="ref-robbins2013">

Robbins, N. (2013). *Creating More Effective Graphs*. Chart House.

</div>

<div id="ref-wickhamgrolemund2016">

Wickham, H., & Grolemund, G. (2016). *R for Data Science*. Sebastopol,
CA: O’Reilly Media, Inc.

</div>

</div>
