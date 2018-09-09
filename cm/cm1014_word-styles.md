
# controlling Word styles

As you’ve seen, you can work reproducibly with Rmd scripts to produce
documents in docx format. Often, this is the only format acceptable to
your collaborators.

What we haven’t looked at yet is how to use Word styles reproducibly for
*document design.*

## getting started

The basics of controlling Word styles

  - [Happy collaboration with Rmd to
    docx](http://rmarkdown.rstudio.com/articles_docx.html)

## assignment

For project 1

  - Create a Word style reference document named `word-styles-01.docx`
  - Save it in your `resources/` directory
  - Edit the YAML header to include

<!-- end list -->

    ---
    output:
      word_document:  
        reference_docx: "../resources/word-styles-01.docx"
    ---

  - Make some formatting changes to this style reference document
  - Knit your report to confirm that the formatting changes appear

As time goes on and you want to experiment with styles, you can make a
copy of your current reference file and rename it, e.g.,
`word-styles-02.docx`, leaving the prior version alone (you know it
works). If the experiment fails, you can always revert to the earlier
reference file.

## tips and tricks

Later, you may find these useful

  - [R Markdown: How to insert page breaks in a MS Word
    document](http://datascienceplus.com/r-markdown-how-to-insert-page-breaks-in-a-ms-word-document/),
    how to format a style to produce a page break.  
  - [Centering figures and captions](cm042_docx-center-figure.md)
  - [Math in R
    Markdown](http://www.stat.cmu.edu/~cshalizi/rmarkdown/#math-in-r-markdown)
    An excellent introduction to writing mathematics in Rmd.
  - [Using R Markdown for class
    reports](http://www.stat.cmu.edu/~cshalizi/rmarkdown/) Lots of good
    tips (including the math link above).

If you find additional methods, or develop tricks of your own, let me
know and I’ll add them to the list.
