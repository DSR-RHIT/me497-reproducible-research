---
output:
  html_document:
    keep_md: yes
  md_document:
    variant: markdown_github
--- 

# tidy the data




```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

How to use this tutorial 

- ![](images/text-icon.png) *add text*: type the prose verbatim into the Rmd file 
- ![](images/code-icon.png) *add code*: insert a code chunk, then transcribe the R code 
- ![](images/knit-icon.png) *knit* after each addition. 
- *Install* packages one time only
- *Load* a package using `library()` every session

Packages used in this tutorial 

- readr
- tidyr 
- stringr
- dplyr 

## open a new Rmd script

Open a new Rmd file, and name it `02_calibr_data-tidy.Rmd`. Save it to the `scripts` directory.

Edit the YAML header:  

    ---
    title: "Load-cell calibration --- tidying the data"
    author: "your name"
    date: "date"
    output: html_document
    ---

Delete the rest of the pre-populated text. 

Insert knitr setup code. 

![](images/code-icon.png) 

    library(knitr)
    opts_knit$set(root.dir = '../')
    opts_chunk$set(echo = TRUE, collapse = TRUE)

Knowing the packages we'll be using, we can load them right away, near the top of the file.

![](images/code-icon.png)


```r
library(readr)
library(tidyr)
library(stringr)
suppressPackageStartupMessages(library(dplyr))
```

## plan the data reshaping

![](images/text-icon.png)

    # Plan the data reshaping

    For analysis, the data set should be in tidy (long) form, with every column a variable and every row an observation. The tidy form will have these variable names:

    - observ (observation number)
    - cycle (cycle number)
    - test\_pt (test point number and direction)
    - input\_lb (applied reference force)
    - output\_mV (sensor readings)

Learn R Markdown:

- `- ` (hyphen, space) creates an itemized list (bullet list). A line space above and below separating the list from other paragraphs is required. 
- To print an underscore in the Rmd prose we have to "escape" the character by writing `\_`. 

![](images/text-icon.png)

    In the reshaped data set, every mV reading will appear in its own row identified by cycle number (from the existing column name) and test point.  Thus the columns with *cycle* in their name  are the ones being gathered. 

The next code chunk finds the columns with `cycle` in their name. 

![](images/code-icon.png)


```r
# active data set
data_received <- read_csv('data/01_calibr_data_active-report.csv')
```

```
## Error: 'data/01_calibr_data_active-report.csv' does not exist in current working directory ('C:/Users/layton/C-Users-layton-docs/courses').
```

```r
# extract the column names
all_col_names <- colnames(data_received)
```

```
## Error in is.data.frame(x): object 'data_received' not found
```

Learn R 

- `colnames()` returns the column names (variable names) of the data frame 

Notes on reproducibility 

- Reading `01_calibr_data-active-report.csv` file is a consequence of DRY (don't repeat yourself). 
- For a full explanation, see the previous tutorial. 


![](images/code-icon.png)


```r
# TF, does the column name include "cycle"
detect_cycle_col <- str_detect(tolower(all_col_names), 'cycle')
```

```
## Error in tolower(all_col_names): object 'all_col_names' not found
```

Learn R 

- `tolower()` returns the vector all in lower case
- `str_detect()` (from `stringr`) returns a logical vector with TRUE for column each name containing `cycle`

![](images/code-icon.png)


```r
# extract indices of TRUE
is_a_cycle_col <- which(detect_cycle_col)
```

```
## Error in which(detect_cycle_col): object 'detect_cycle_col' not found
```

```r
# examine
is_a_cycle_col
```

```
## Error in eval(expr, envir, enclos): object 'is_a_cycle_col' not found
```

















