
# set up an R project

In this course, plan on having a separate R project for each of the
reproducibility projects (2 projects for ME 497 and 3 projects for ME
597) plus an additional R project for practice course work and
tutorials.

## directories

I suggest that you create a course directory (folder) with sub-folders
as shown:

    me497_reproducible_research
      |-- practice_work
      |-- project_1
      `-- project_2

For 597 students, I suggest:

    me597_reproducible_research
      |-- practice_work
      |-- project_1
      |-- project_2
      `-- project_3

Each subfolder will become a separate R project. To create an R project
for `practice_work`

  - Open RStudio. *File menu \> New Project \> Existing Directory*. Use
    the Browse button to find the `practice_work` folder you just
    created, then *Select \> Create Project*.
  - In the future, repeat the steps to create R projects for each of
    your reproducibility projects.
  - In practice, you would create an R project for any specific piece of
    work that creates one or more reports, for example, an article, a
    contract, a workshop, a course—whatever you wish to define as a
    project.

## test it

  - Close RStudio

  - Open RStudio. No error statements should appear (we hope).

  - If an RStudio project is open, *File \> Close Project*. No errors?

  - Open an RStudio project with *File \> Open Project*. No errors?

## create top level library for packages

Packages are like “apps” for R. If we store packages in a directory
separate from the base R installation, then when you update the R
version you are using, you don’t have to reinstall every package, saving
a lot of time.

At the top level of your drive, create a new directory named “R”. In
that directory create a new folder named “library”, for example,

  - Windows: `C:/R/library`
  - Linux: `~/R/library`

## the *.Renviron* file

The `.Renviron` file is a text file that directs R packages to be
installed in the *R/library* directory you just created.

To create the file, with RStudio open, create a new text file,

*File menu \> New File \> Text File*.

Save the file to your project directory using the filename *.Renviron*

In this file, write one line of text,

  - Windows: `R_LIBS_USER="C:/R/library"`

  - Linux: `R_LIBS_USER="~/R/library"`

Whenever you create a new RStudio Project, paste a copy of the
*.Renviron* file in the project root directory.

At this point, your `practice_work` directory should include:

    practice_work
        |-- practice_work.Rproj
        `-- .Renviron

## test it

  - Now let’s see if the library path you made works. The RStudio
    interface is divided into 4 window panes. In the lower right pane,
    select *Packages \> Install*

  - In the dialog box that appears, the Install to Library strip should
    show the path to the *library* directory you created earlier, for
    example, Windows should show `C:/R/library [Default]` and Linux
    should show `~/R/library [Default]`.

  - In the Packages entry box, type `plyr` and click Install. If all
    goes well, you’ll see something like this in the lower left pane
    (the R Console).

<!-- end list -->

``` r
Installing package into "C:/R/library" (as "lib" is unspecified)
trying URL "http://ftp.ussg.iu.edu/CRAN/bin/windows/contrib/3.1/plyr_1.8.1.zip"
Content type "application/zip" length 1149242 bytes (1.1 Mb)
opened URL
downloaded 1.1 Mb

package "plyr" successfully unpacked and MD5 sums checked

>
```

## install the tidyverse

Once you have successfully completed this work, install the
[tidyverse](https://www.tidyverse.org/) for a set of packages we will
use regularly.

-----

[main page](../README.md)
