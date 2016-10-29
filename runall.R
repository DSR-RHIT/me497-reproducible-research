library(stringr)
library(knitr)
library(rmarkdown)
library(readr)

# render all Rmd files in CM folder
compile_these <- c("cm")

# compile Rmd to github variant md
Rmd_scripts <- list.files(path = compile_these
																, pattern = "\\.Rmd"
																, full.names = TRUE
)
sapply(Rmd_scripts, function(x) render(x))






# or just do one file
# library(rmarkdown)
# render("cm/cm050_Rmd-to-docx_table-numbers.Rmd")
#
# # render Rnw for slides, uses knitr::knit2pdf (takes time)
# Rnw_slide_scripts <- list.files(path = compile_these
# 															 , pattern = "\\.Rnw$"
# 															 , full.names = TRUE
# )
# tex_slide_files <- str_replace(Rnw_slide_scripts, 'Rnw$', 'tex')
# # knit2pdf takes time and overwrites existing slide-pdfs
# # Map(function(x, y) knit2pdf(input = x, output = y), Rnw_slide_scripts, tex_slide_files)
# # delete the text file byproducts
# sapply(tex_slide_files, function(x) unlink(x))

