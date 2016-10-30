
run all scripts
===============

When you want to run an entire project's worth of scripts from beginning to end, the "proper" approach is to use *makefiles*. We haven't discussed makefiles in class, but the text gives a good introduction if you are interested.

Makefiles save time by only executing those the scripts that have changed since the last time the makefile was run.

The approach I show you here runs all the scripts every time---so it takes more time than makefiles. For most of our projects, however, the time penalty shouldn't be too annoying.

start
-----

This code will knit all your Rmd scripts in sequence. The assumptions are:

-   we want to compile all the scripts in the `scripts/` directory
-   the Rmd scripts are named to render in order, e.g., filenames start with 01, 02, 03, etc.

Start a new Rmd script `render_scripts.Rmd` and save it to your `scripts/` directory.

Start with the usual knitr initialization.

    library(knitr)
    opts_knit$set(root.dir = "../")
    opts_chunk$set(echo = TRUE)

We need the `rmarkdown` package to knit each script.

``` r
# package
library(rmarkdown)
```

find the Rmd scripts
--------------------

Name the path to the directory that contains the scripts we want to knit.

``` r
#  identify the path to the directory we want 
path_to_Rmds <- "scripts"
```

Use `list.files()` to find all the Rmd scripts in that directory and save them in `Rmd_scripts`, a vector of character strings.

``` r
# find all files that end in .Rmd
Rmd_scripts <- list.files(
    path = path_to_Rmds
    , pattern = "\\.Rmd$"
    , full.names = TRUE
)
```

knit the Rmd scripts
--------------------

For each filename in `Rmd_scripts`, apply the `render()` function one file at a time. The "one-file-at-a-time" process is managed by the `sapply()` function.

``` r
# render each script
sapply(Rmd_scripts, function(x) render(x))
```

run it
------

Run the script and all your Rmds should be rendered in order.

------------------------------------------------------------------------

[main page](../README.md)