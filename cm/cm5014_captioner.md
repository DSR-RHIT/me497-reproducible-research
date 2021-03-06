
# auto-numbering tables and figures

Using the captioner package for auto-numbering tables and figures

## setup

``` r
library(knitr)
opts_knit$set(root.dir = "../")
opts_chunk$set(echo=TRUE, collapse=TRUE)
```

Use the captioner package

``` r
library(captioner)
```

Create a data frame to display in a numbered table.

``` r
df1 <- head(mtcars[ , c(1:5)], n = 5L)
```

## tables

Near the top of your script, add a code chunk to

  - assign your preferred table caption prefix (here, I use `"Table"`)
  - create the object (here, `table_id`) that is your personalized
    captioner function for creating auto-numbered figure captions.

<!-- end list -->

``` r
table_id  <- captioner(prefix = "Table")
```

Assign a character string to

  - unique cross-reference label (the `name` argument)
  - caption (the `caption`
argument)

<!-- end list -->

``` r
table_id(name = "ref_idx_1", caption = "A descriptive caption for the table.")
```

    ## [1] "Table  1: A descriptive caption for the table."

As shown in the output line above, `table_id()` prints the table caption
to the output document. To omit this superfluous output, use the
`results = 'hide'` argument in the code-chunk header.

<pre class="r"><code>```{r results='hide'}
</code></pre>

<br> **Print the table with caption**. Use `kable()` and its `caption`
argument with `table_id("cross_reference_label")`to assign the caption
you defined earlier.

``` r
kable(df1, caption = table_id("ref_idx_1"))
```

|                   |  mpg | cyl | disp |  hp | drat |
| ----------------- | ---: | --: | ---: | --: | ---: |
| Mazda RX4         | 21.0 |   6 |  160 | 110 | 3.90 |
| Mazda RX4 Wag     | 21.0 |   6 |  160 | 110 | 3.90 |
| Datsun 710        | 22.8 |   4 |  108 |  93 | 3.85 |
| Hornet 4 Drive    | 21.4 |   6 |  258 | 110 | 3.08 |
| Hornet Sportabout | 18.7 |   8 |  360 | 175 | 3.15 |

Table 1: A descriptive caption for the table.

<br> The first column has no header because the `mtcars` data set is not
tidy—the model types are encoded as row names, not a named variable.

<br> **Referring to the table in the text**. Use `table_id()` in an
inline code chunk and its `display` argument set to `"cite"`. For
example, the following script

`An excerpt of data from our fabulous experiment is`  
`shown in` `` `r table_id("ref_idx_1", display = "cite")` ``.

produces this output:

An excerpt of data from our fabulous experiment is shown in Table 1.

<br> **A second table is automatically numbered as Figure 2**

For the next table, assign a unique cross-reference label.

``` r
table_id(name = "another_table", caption = "A better caption")
kable(df1, caption = table_id("another_table"))
```

|                   |  mpg | cyl | disp |  hp | drat |
| ----------------- | ---: | --: | ---: | --: | ---: |
| Mazda RX4         | 21.0 |   6 |  160 | 110 | 3.90 |
| Mazda RX4 Wag     | 21.0 |   6 |  160 | 110 | 3.90 |
| Datsun 710        | 22.8 |   4 |  108 |  93 | 3.85 |
| Hornet 4 Drive    | 21.4 |   6 |  258 | 110 | 3.08 |
| Hornet Sportabout | 18.7 |   8 |  360 | 175 | 3.15 |

Table 2: A better caption

<br> **Referring to the table in the text**. Use the table ID in-line.
The following text with inline code

`This sentence refers to` `` `r table_id("another_table", display =
"cite")` ``.

produces this output:

This sentence refers to Table 2.

<br> **Using Heading 6 does not center a table**. Below I attempt to
center the table using the Heading 6 Word style we created earlier.
However, in the Wpord output, the table is not centered.

``###### `r kable(df1, caption = table_id("another_table"), row.names =
FALSE)` ``

###### 

|  mpg | cyl | disp |  hp | drat |
| ---: | --: | ---: | --: | ---: |
| 21.0 |   6 |  160 | 110 | 3.90 |
| 21.0 |   6 |  160 | 110 | 3.90 |
| 22.8 |   4 |  108 |  93 | 3.85 |
| 21.4 |   6 |  258 | 110 | 3.08 |
| 18.7 |   8 |  360 | 175 | 3.15 |

Table 2: A better caption

## figures

At the top of your script in the same code chunk in which you assign
your table caption information, do the same for your figure:

  - assign your preferred figure caption prefix (here, I use `"Figure"`)
  - create the object (here, `figure_id`) that is your personalized
    captioner function for creating auto-numbered figure captions.

<!-- end list -->

``` r
figure_id <- captioner(prefix = "Figure")
```

Assign a cross-reference label and a caption for the first
figure.

``` r
figure_id(name = "hockey", caption = "Michael Mann's famous hockey-stick graph")
```

Using our heading 6 Word style `######` to import the PNG figure, center
it, and and auto-number the figure. The figure and caption are not
centered in this github output but they are centered in the docx output
document.

    ###### ![](../resources/images/hockey-stick-graph.png)
    ###### `r figure_id("hockey")` 

###### ![](../resources/images/hockey-stick-graph.png)

###### Figure 1: Michael Mann’s famous hockey-stick graph
