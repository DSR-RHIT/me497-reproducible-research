
# find all Rmd scripts in the cm directory
# compile them using uses rmarkdown::render()
# not as good as a makefile but does the job

library(rmarkdown)

# find all files that end in .Rmd
Rmd_scripts <- list.files(
	path = "cm"
	, pattern = "\\.Rmd$"
	, full.names = TRUE
)

# render each
sapply(Rmd_scripts, function(x) render(x))

