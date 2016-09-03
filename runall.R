library(stringr)
library(knitr)

# render Rnw for slides, uses knitr::knit2pdf (takes time)
# Rnw_slide_scripts <- list.files(path = "week_00"
# 															 , pattern = "\\.Rnw$"
# 															 , full.names = TRUE
# )
# tex_slide_files <- str_replace(Rnw_slide_scripts, 'Rnw$', 'tex')
# Map(function(x, y) knit2pdf(input = x, output = y), Rnw_slide_scripts, tex_slide_files)

# delete R byproducts
unlink(".Rhistory")

# delete html byproducts
unlink("*.html")
unlink("*/*.html")

# delete tex byproducts
unlink("*/*.toc")
unlink("*/*concordance*")
unlink("*/*.snm")
unlink("*/*.nav")
unlink("*/*.gz")
unlink("*/*.log")
unlink("*/*.aux")
unlink("*/*.out")
unlink("*/*.vrb")





sapply(tex_slide_files, function(x) unlink(x))





