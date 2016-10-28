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







