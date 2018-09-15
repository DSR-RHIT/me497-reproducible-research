
# page breaks

R Markdown does not have a feature for page breaks, but we can use the
Word styles-reference document for a work-around for docx output.

## use heading 5

For page breaks, I suggest modifying the rarely used *Heading 5* as
suggested by Norbert Köhler, in his article [R Markdown: How to insert
page breaks in a MS Word
document](http://datascienceplus.com/r-markdown-how-to-insert-page-breaks-in-a-ms-word-document/).

Follow Norbert’s instructions to modify and save the number `nn` version
of your Word Styles reference file, `word-styles-reference-nn.docx`.

Then update the YAML header in your Rmd file

    ---
    output:
      word_document:
        reference_docx: "../resources/word-styles-reference-nn.docx"
    ---

Once this work is complete, type the following heading in your Rmd
script at the location yuo want a page break,

    ##### page break

Rmd treats this as a level-5 heading but because of its formatting, a
page break is created followed by the words “page break” printed in a
negligibly small white typeface.

## suggestions

  - Avoid inserting page breaks until you are preparing the document for
    final submission
