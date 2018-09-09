
# gitignore

The `.gitignore` file lists local files excused from version control and
therefore not shared with collaborators.

I typically list the `manage` folder in `.gitignore` because project
management files are typically not required for research
reproducibility.

You originally created the `.gitignore` file when you set up the repo.
In RStudio, open `.gitignore`. If you set it up to ignore R, the first
few lines of your file should look something like this,

    # History files
    .Rhistory
    .Rapp.history
    
    # Session Data files
    .RData
    
    # Example code in package build process
    *-Ex.R
    
    # Output files from R CMD build
    /*.tar.gz
    
    # Output files from R CMD check
    /*.Rcheck/
    
    # RStudio files
    .Rproj.user/
    
    ... (etc) 

## assignment

If your project directory does not contain `.gitignore` file, you
probably skipped that step when you created the repo. No worries. You
can create the file as follows,

  - In RStudio, *File \> New File \> Text File*  
  - *File \> Save As* to your project main directory with the name
    (starts with a period) `.gitignore`

Once the file exists,

  - Open the `.gitignore` file
  - Add two new lines to tell git to ignore the `manage` directory.

<!-- end list -->

    # Project management files 
    manage

Because your collaborators can render your Rmd files themselves, we can
excuse rendered documents, e.g., HTML files or docx files, from version
control. Add these lines of code to the `.gitignore` file. Save.

    # Possible rendered files in the main directory
    *.html
    *.docx
    
    # Possible rendered files in the sub-directories
    */*.html
    */*.docx

Other commonly encountered files that can be ignored:

    # R history file in the main directory
    .Rhistory
    
    # R session data files in the main directory
    .RData

Anytime you create a folder or a file you want git to ignore, just add
its path to the `.gitignore` file

## repeat

Repeat these steps for all your projects (alternatively, you can copy
and paste your updated `.gitignore` file to the top level of every
project directory).

  - practice\_work
  - project 1
  - project 2
  - project 3 (597 students only)

## check yourself

If you select the `Git` tab in the RStudio pane, all files you
identified in `.gitignore` should disappear from the list of unstaged
files.
