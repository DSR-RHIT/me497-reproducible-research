
# run all Rmd scripts

When you want to run an entire project’s worth of R markdown scripts
from beginning to end, the “proper” approach is to use *makefiles*.
Makefiles save time by only executing those the scripts that have
changed since the last time the makefile was run.

We won’t discuss makefiles in class, but Gandrud
([2014](#ref-gandrud2014)) gives a good introduction if you are
interested.

The approach I show you here runs all the scripts every time—so it takes
more time than makefiles. For most of our projects, however, the time
penalty shouldn’t be too annoying.

## start

This code will knit all your Rmd scripts in sequence. The assumptions
are:

  - we want to compile all the Rmd scripts in the `reports/` directory
  - Rmd files are sequentially named, starting with a number such as
    001, 002, 003, etc.

Start a new Rmd script `render_reports.Rmd` and save it to your main
project directory. (Alternatively, you can place all the code in an r
script if you prefer.)

Initialize knitr. This time the root directory is the main project
directory.

    library(knitr)
    opts_knit$set(root.dir = ".")
    opts_chunk$set(echo = TRUE)

We need the `rmarkdown` package to knit each script.

``` r
# package
library(rmarkdown)
```

## find the Rmd scripts

Name the path to the directory that contains the scripts we want to
knit.

``` r
#  identify the path to the directory we want 
path_to_Rmds <- "reports"
```

Use `list.files()` to find all the Rmd scripts in that directory and
save them in `Rmd_scripts`, a vector of character strings.

``` r
# find all files that end in .Rmd
report_filenames <- list.files(
    path = path_to_Rmds
    , pattern = "\\.Rmd$"
    , full.names = TRUE
)
```

## knit the Rmd scripts

For each filename in `Rmd_scripts`, apply the `render()` function one
file at a time. The “one-file-at-a-time” process is managed by the
`sapply()` function.

``` r
# render each script
sapply(report_filenames, function(x) render(x))
```

## cleanup

If the Rmd scripts produce HTML files that you don’t really need, you
can remove them using `unlink()`.

``` r
unlink("reports/*.html")
```

## references

<div id="refs" class="references">

<div id="ref-gandrud2014">

Gandrud, C. (2014). *Reproducible research with R and RStudio*. CRC
Press, Taylor & Francis Group.

</div>

</div>
