
preventable version control conflicts
=====================================

The root cause of a version control conflict that a few folks encountered recently was actually my fault. I had suggested that everyone keep their `project_name.Rproj` under version control.

I see now why that is a mistake. Every R user is entitled to set up their project options any way they choose. By putting the `project_name.Rproj` under version control and then collaborating as we did on Projects 2 and 3, we are actually inviting this type of conflict to occur.

add .Rproj to gitignore
-----------------------

The solution is simple. First, decide who does the work:

-   On project 2, this would be the primary author (Alice)
-   On Project 3, one person of the author pair team has to volunteer

Here's the task for that one person:

-   Open your local `.gitignore` file in the main project directory
-   Add these lines

<!-- -->

    # exclude the Rproj file from version control  
    *.Rproj

-   Save
-   Commit the `.gitignore` file
-   PUSH to GitHub
-   PULL to make sure everything is OK
-   Tell your collaborators that you have pushed the new version
-   Every other member of the team can now PULL and everyone should have the same version and can continue working.

These steps prevent version control conflicts that arise from local RStudio project or global settings you might use.

possible additions to gitignore
-------------------------------

You might consider excluding `.Renviron` from version control as well, allowing every collaborator to set up their local R environemnt as they wish, just like we did above. If so, every collaborator would need to manually add their own `.Renviron` file to the local project directory.

    # exclude R environment from version control 
    .Renviron 

Additional files you can consider adding to `.gitignore` include the following.

    # exclude the following files and directories from version control

    # temporary holding directories 
    holding
    */holding

    # PPTX files 
    *.pptx
    */*.pptx

    # HTML files 
    *.html
    */*.html

    # R and Rmd management files 
    .Rhistory
    .Rapp.history
    .RData

    # Rmd temporary files 
    *.utf8.md
    *.knit.md

------------------------------------------------------------------------

[main page](../README.md)
