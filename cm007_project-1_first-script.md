---
output:
  html_document:
    keep_md: yes
  md_document:
    variant: markdown_github
--- 

# start your first script




```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

## tutorial design

You will be writing prose and code in the same document, using R Markdown (Rmd) syntax for prose and R syntax for computing. To help you distinguish between them, I use these icons: 

- ![](images/text-icon.png) *add text*: prose in Rmd syntax  
- ![](images/code-icon.png) *add code*: code in R syntax

The two syntaxes will sometimes use the same characters in different ways, for example,

- in R, the single hash tag (#) denotes a comment
- in Rmd, the single hash tag (#) denotes a level-1 heading

## open a new R markdown script

In your project main directory,

- Launch your project `me497-project-1-YourLastName.Rproj`
- `File > New File > R Markdown`
- `Output Format > HTML`
- `Save As...` to the `scripts/` directory with filename `01_calibr_data-wide.Rmd`

The Rmd file is pre-populated with prose and some markdown syntax. Here's my first text icon to denote that we are editing the Rmd file.

![](images/text-icon.png) In the Rmd file, edit the YAML header.

    ---
    title: "Load-cell calibration --- data in wide form"
    author: "your name"
    date: "your date"
    output: html_document
    ---

Learn R Markdown 

- Read more about YAML headers in the text (p. 49)  


## render the script

You have 3 methods to *Knit* the Rmd file:

1. *You may* click the button ![](images/knit-html.png)
2. *or* use the menu *File > Knit Document*
3. *or* use a keyboard shortcut `Ctrl + Shift + K`

The output should appear in the RStudio Viewer pane. If you compare the pre-populated Rmd file with the rendered output document, you'll see example of commonly-needed syntax to:

- write headings and paragraphs
- include executable chunks of R code
- link to a URL
- mark bold text
- create a graph

We'll see most of these Rmd structures again as we work through the tutorials.


## output to alternative formats

If you have MS Word installed on your machine (or Libre/Open Office on Unix-alikes), you can render the Rmd to Word using the Knit pull-down menu.

- If you have Word installed, ![](images/knit-word.png). Did a Word doc open?

If you have TeX installed on your machine (MiKTeX on Windows, MacTeX 2013+ on OS X, TeX Live 2013+ on Unix-alikes), you can render the Rmd to PDF.

- If you have TeX installed, ![](images/knit-pdf.png). Did a PDF doc open?

However, HTML output renders quickly and we can put off worrying about pagination.

- For now, we'll use HTML output, ![](images/knit-html.png).


## cleanup

In the Rmd file,

- Leave the YAML header in place
- Delete everything else below the header
- Save

In the `scripts/` directory,

- Delete the docx and pdf output files (if any)

## write your first code chunk

To include lines of R code in our Rmd file, we place them in a *code chunk*. A code chunk opens and closes with

<pre><code>```{r}

<code>```</code>
</code></pre>

and we write the R code in between. You have 4 methods creating the code chunk delimiters. Choose the one that suits you:

1. *You may* click the ![](images/insert-code.png) icon
2. *or* use the menu `Code > Insert Chunk`
3. *or* use a keyboard shortcut `Ctrl + Alt + I`
4. *or* type the delimiters directly ("back ticks", not single-quotes)


**Add a code chunk after the header** 

Here’s my first code icon. Use one of the methods above to create the code chunk delimiters then copy the R code to the code chunk. These lines of R code set a couple of `knitr` options.

![](images/code-icon.png)

    library(knitr)
    opts_knit$set(root.dir = '../')
    opts_chunk$set(echo = TRUE, collapse = TRUE)

Learning R and knitr:

- `library()` is how we load packages to gain access to their functions
- [`knitr`](http://yihui.name/knitr/) is an important R package for reproducibility; it processes the Rmd file (mixture of text and code) and replaces the R code with its output (results or graphs)
- `root.dir = '../'` matches the `knitr` working directory to the RStudio project working directory
- `echo = TRUE` applies to all subsequent code chunks in the script, printing your R code verbatim to the output document---useful during exploratory computing.
- `collapse = TRUE` keeps code plus code results together in a box in the output document 
 

Edit the **code chunk header** as follows:

    {r, setup, include = FALSE}

- `setup` is a chunk label. Labels are optional, but if used, must be unique.
- `include = FALSE` suppresses printing for this chunk. The code runs, but results  are not displayed.

Writing readable code (see [Wickham](http://adv-r.had.co.nz/Style.html) a comprehensive style guide)

- One space on either side of  `=`
- No space before a comma, one space after a comma (just like written English)

Save and ![](images/knit-icon.png) *knit* the document after every change to check that your script is behaving as you expect.

## check yourself

Your directories should contain these files:

    data\
      `-- 007_wide-data.csv

    reports\

    resources\
      `-- load-cell-setup-786x989px.png

    results\

    scripts\
      `-- 01_calibr_data-wide.Rmd


If you compiled the Rmd script, your `scripts/` directory will also contain an output file of the same name, e.g., `01_calibr_data-wide.html`.

Read more about how the software works in section 3.3 (omitting 3.3.7 on "hooks"). 

## push to github

For reproducibility, Rmd scripts are pushed to GitHub, but the output files in HTML, PDF, or DOCX are generally not.

These steps can only be taken if you have successfully set up RStudio, Git, and GitHub to talk to each other.

- In RStudio, in the upper-right pane, select the `Git` tab
- Check the `Staged` box for the `scripts/` directory and the `01_calibr_data-wide.Rmd` file
- Click the `Commit` button
- Type a commit message, e.g., `script 01 initial commit`
- `Commit`
- `Close`
- `Push`
- `Close`

## check yourself

Online, navigate to your project repo on GitHub. There you should find a scripts folder containing the Rmd file.


---

[main page](../README.md)




