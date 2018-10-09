
# setup directories

## prerequisites

You should have already created these R projects with version control
and initialized them with README and gitignore files

  - practice work
  - project 1
  - project 2
  - project 3 (597 students only)

## directories for shorter projects

All we are going to do is create a set of empty sub-directories
(folders).

  - First, open the R project for project 1.

Next, use one of these two approaches

  - In your OS, use your usual method for creating folders manually
  - In RStudio, find *Files* in the pane ribbon and select *New Folder*

Using either approach, create new folders for `data`, `manage`, etc.
When done, the directory tree should look like this (you might have
additional files such as `.gitignore` or `README.md`)

    project_folder/
        |-- data/
        |-- manage/
        |-- reports/
        |-- resources/
        |-- results/
        |-- scripts/
        |-- .Renviron
        `-- project_name.Rproj

Repeat this organization for

  - practice\_work

## directories for substantive projects

For substantive projects, students have found it useful to separate raw
data from tidy data by having two data directories.

  - The `raw` folder is for data as first obtained in whatever form it
    happens to be.
  - Raw data are never operated on manually.  
  - R scripts operate on raw data to create tidy data frames which are
    written to the `tidy` directory.  
  - R scripts operate on the tidy data for analysis and to produce
    graphs.

Some practitioners like this arrangement because they can omit the raw
folder from version control because the raw data files are so large.

    project_folder/
        |-- manage/
        |-- raw/
        |-- reports/
        |-- resources/
        |-- results/
        |-- scripts/
        |-- tidy/
        |-- .Renviron
        `-- project_name.Rproj

Create this directory structure for

  - project 2
  - project 3 (597 students only)

If you prefer of course you could use this directory structure for all
your projects.
