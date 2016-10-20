library(stringr)
library(knitr)
library(rmarkdown)
library(readr)


# array of folders to search for Rmd and Rnw filed to compile
compile_these <- c("cm") # "cm", "print_pages", "slides"

# delete old md files before rendering Rmd to md
# delete_these <- paste0(compile_these, "/*.md")
# sapply(delete_these, function(x) unlink(x))

# compile Rmd to github variant md
Rmd_scripts <- list.files(path = compile_these
																, pattern = "\\.Rmd"
																, full.names = TRUE
)
sapply(Rmd_scripts, function(x) render(x))

# or just do one file
render("cm/cm044_preventable-vc-conflicts.Rmd")

# render Rnw for slides, uses knitr::knit2pdf (takes time)
Rnw_slide_scripts <- list.files(path = compile_these
															 , pattern = "\\.Rnw$"
															 , full.names = TRUE
)
tex_slide_files <- str_replace(Rnw_slide_scripts, 'Rnw$', 'tex')
# knit2pdf takes time and overwrites existing slide-pdfs
# Map(function(x, y) knit2pdf(input = x, output = y), Rnw_slide_scripts, tex_slide_files)
# delete the text file byproducts
sapply(tex_slide_files, function(x) unlink(x))

# delete R byproducts
unlink(".Rhistory")

# delete html byproducts
unlink("*.html")
unlink("*/*.html")
unlink("*/*/*.html") # student-project-level-1
unlink("*/*/*/*.html") # student-project-level-2

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







