
deleting unnecessary files
==========================

As we work on our scripts, we knit Rmd files and create HTML files for local viewing. The HTML files do not have to be version controlled and should be listed in the `.gitignore` file, as we covered in an [earlier lesson](cm008_project-1_gitignore.md).

Because an HTML output file can be recreated by knitting the Rmd source script, we don't really need to keep copies of HTML files locally either.

unlink
------

To periodically delete unnecessary HTML files:

-   I create an R script (*File &gt; New File &gt; R Script*) in my top-level project directory called `runall.R`
-   In the R script, I use `unlink()` to delete HTML files, as shown below
-   Periodically, I'll open and run `runall.R` to clean up the directories
-   Because this file is an R script (not Rmd) you can just type the R code directly (code chunks not needed)

``` r
# delete html files in the main project directory
unlink("*.html")

# delete html files in sub-directories one level down 
unlink("*/*.html")
```

The asterisk (\*) is a "wildcard" that stands for any character. Thus `*.html` tells R to look for any file in the top directory with an `.html` suffix.

**Warning:** `unlink()` permanently deletes files, so use it carefully.

other file manipulation functions in R
--------------------------------------

Section 4.4 in the text covers R code for manipulating files. For example,

-   `getwd()` to determine the current working directory
-   `list.files()` to see all the files and directories in the working directory
-   `dir.create()` to create a new directory
-   `file.create()` to create a new empty file
-   `cat()` to create a new file and put text into it, or add text to an existing file
-   `file.rename()` to rename a file
-   `file.copy()` to copy a file
-   `unlink()` to permanently delete a file

------------------------------------------------------------------------

[main page](../README.md)