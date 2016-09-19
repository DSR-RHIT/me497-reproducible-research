---
output:
  html_document:
    keep_md: yes
  md_document:
    variant: markdown_github
--- 

# having Git ignore files

## read

*Having Git ignore files* (p. 99) explains what the `.gitignore` file is, why we use it, and what the syntax means.  

## set up gitignore

In RStudio, in the lower-right pane, 

- Select the `Files` tab 
- Navigate to the project main directory 
- A `.gitnore` file should be present in the main project directory 

**Skip this step if you see a gitignore file** 

Your main directory would not have a `.gitignore` file if you skipped that step when creating your project repo on GitHub. 

To create a .gitignore file: 

- In RStudio, *File > New File > Text File* 
- *File > Save As* to your project main directory with the name (starts with a period) `.gitignore` 


**Continue here** 

- Open `.gitignore` in RStudio  

We use this file to list files we want Git to ignore. For example, we don't need to push HTML files to Git. Add these lines of code to the `.gitignore` file. Save. 

```
# ignore HTML files in the main directory
*.html

# ignore HTML files in all sub-directories one level down
*/*.html
```

Other commonly encountered files that can be ignored: 

```
# ignore the R history file
.Rhistory

# ignore the R session Data files
.RData
```


## check yourself 

Save the gitignore file.

If you select the `Git` tab in the upper-right pane, all files you identified in `.gitignore` should disappear from the list of unstaged files. 

---

[main page](../README.md)




