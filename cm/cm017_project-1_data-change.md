
when the data change
====================

How to use this tutorial

-   ![](../resources/images/text-icon.png) *add text*: type the prose verbatim into the Rmd file
-   ![](../resources/images/code-icon.png) *add code*: insert a code chunk, then transcribe the R code
-   ![](../resources/images/knit-icon.png) *knit* after each addition.

### download a new data set

The lab sends us an updated data set with additional test cycles. Our job is to revise the calibration report to account for the new data.

To retrieve the new data file and place it in the appropriate directory:

-   Make sure you have a live Internet connection
-   Launch your RStudio project.
-   Copy these lines of R code, paste into the Console, and `Enter`.

``` r
url <- "https://raw.githubusercontent.com/DSR-RHIT/creating-reproducible-reports/gh-pages/data/008_wide-data_6-cycles.csv"
destination <- "data/008_wide-data_6-cycles.csv"
download.file(url, destination)
```

### check yourself

Your data directory should contain these files:

    data\
      |-- 007_wide-data.csv
      |-- 008_wide-data_6-cycles.csv
      |-- 01_calibr_data_active-report.csv
      `-- 02_calibr_data-tidy.csv

If not, navigate to <https://github.com/DSR-RHIT/creating-reproducible-reports/tree/gh-pages/resources/downloads> and follow the instructions.

### open the first script

In RStudio, open the script `scripts/01_calibr_data-wide.Rmd`

Find the line of code that reads the data.

    data_received <- read_csv('data/007_wide-data.csv') 

![](../resources/images/code-icon.png) Comment-out that line and add a new line to read the new data set.

    # comment out the original read_csv() function 
    # data_received <- read_csv('data/007_wide-data.csv')

    # read the new data set 
    data_received <- read_csv('data/008_wide-data_6-cycles.csv')
    glimpse(data_received)

### re-compile all the scripts in order

Because we

-   were careful not to repeat ourselves (DRY)
-   avoided hard coding numbers
-   planned for reproducibility from the start

the one line of code we edited above is the only change we have to make to revise every number and result in the report.

Open these Rmd files and re-run them in order

     scripts\
      |-- 01_calibr_data-wide.Rmd 
      |-- 02_calibr_data-tidy.Rmd 
      |-- 03_calibr_graph.Rmd
      `-- 04_calibr_regression.Rmd
      
    reports\
      `-- 05_calibr_report.Rmd 

### check yourself

When the new docx file appears, compare it to the original.

-   You identified "manual operations" on your original hard copy of the report.
-   Compare your markup with the new revised report on screen.
-   Did you correctly identify the data-dependent elements of the report?
-   Did some things change that you missed in your original markup?

------------------------------------------------------------------------

[main page](../README.md)
