# calendar
# R Layton
# 2018-09-07

library(tidyverse)
library(knitr)

mt40 <- rep("", 42)
the_days <- c("R", "F", rep(c("M", "T", "R", "F"), 10))
df <- tibble(
	wk         = mt40,
	dy         = mt40,
	agenda     = mt40,
	book       = mt40,
	exercises  = mt40,
	activities = mt40,
	projects   = mt40,
	due = mt40
	)

le_row <- 0
#  week 0 ---------------------------------------------------- 0
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"0",    # week
	"R",    # day
	paste0(	# agenda
		"Course introduction [[S](slides/cm4001_introduction.pdf)]",
		"<br>",
		"Review calendar"
		),
	paste0(	# book
		"[1.1--1.6](http://r4ds.had.co.nz/introduction.html)"
		),
	paste0(	# exercise
		"[]()"
		),
	paste0(	# activity
		"[Read syllabus](cm/cm0003_syllabus.md)",
		"<br>",
		"[Install R & RStudio](cm/cm1001_install-R-RStudio.md)",
		"<br>",
		"[Install git](cm/cm1002_install-git.md)"
		),
	paste0(	# project
		"[Meet 597](cm/cm3301_project-3_start.md)"
		),
	paste0(	# milestones
		"Meet 597"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		"Reproducible workflows [[S](slides/cm4002_principles.pdf)]"
		),
	paste0(	# book
		""#"[](http://r4ds.had.co.nz)"
		),
	paste0(	# exercise
		""#"[](http://r4ds.had.co.nz)"
		),
	paste0(	# activity
		"[Setup GitHub](cm/cm1003_setup-github.md)",
		"<br>",
		"[Create repo](cm/cm1004_create-repo.md)",
		"<br>",
		"[Repo to Rproj](cm/cm1005_setup-Rproj.md)",
		"<br>",
		""#"[Proj 1 dir]()"
		),
	paste0(	# project
		"[Proposal 1](cm/cm3101_project-1_start.md)",
		"<br>",
		"[Proposal 3](cm/cm3301_project-3_start.md)"
		),
	paste0(	# milestones
		"Meet 597"
	)
)
#  week 1 ---------------------------------------------------- 1
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"1",    # week
	"M",    # day
	paste0( # agenda
		"Starting with R Markdown [[S](slides/cm4003_rmarkdown.pdf)]"
		),
	paste0( # book
		"[27.1--27.7](http://r4ds.had.co.nz/r-markdown.html)"
		),
	paste0( # exercise
		"[](http://r4ds.had.co.nz)"
		),
	paste0( # to-do
		""#"[GH collabor]()"
		),
	paste0( # project
		"",#"[Proj 1 Rmd]()",
		"<br>",
		""#"[README]()"
		),
	paste0( # milestones
		"Meet 597"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0( # agenda
		"",#"[How to do practice work](practice_work/exercises/8001_practice-work-setup.md)",
		"<br>",
		"Graphs basics",
		"<br>",
		"First steps",
		"<br>",
	  "Aesthetic mappings"
		),
	paste0( # book
		"[3.1](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)",
		"<br>",
		"[3.2](http://r4ds.had.co.nz/data-visualisation.html#first-steps)",
	  "<br>",
	  "[3.3](http://r4ds.had.co.nz/data-visualisation.html#aesthetic-mappings)"
	 ),
	paste0( # exercise
		"[3.2.4](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)",
		"<br>",
		"[3.3.1](http://r4ds.had.co.nz/data-visualisation.html#exercises-1)"
		),
	paste0( # to-do
		"Browse R1"
		),
	paste0(	# project
		"[]()"
		),
	paste0(	# milestones
		"[]()"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		"Facets",
		"<br>",
		"Geoms"
		),
	paste0(	# book
		"[3.5](http://r4ds.had.co.nz/data-visualisation.html#facets)",
		"<br>",
		"[3.6](http://r4ds.had.co.nz/data-visualisation.html#geometric-objects)"
		),
	paste0(	# exercise
		"[3.5.1](http://r4ds.had.co.nz/data-visualisation.html#exercises-2)",
		"<br>",
		"[3.6.1](http://r4ds.had.co.nz/data-visualisation.html#exercises-3)"
		),
	paste0(	# to-do
		"[]()"
		),
	paste0(	# project
		"[]()"
		),
	paste0(	# milestones
		"[]()"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0( # agenda
		"R coding basics"
		),
	paste0( # book
		"[4.1--4.3](http://r4ds.had.co.nz/workflow-basics.html)"
		),
	paste0( # exercise
		"[4.4](http://r4ds.had.co.nz/workflow-basics.html#practice)"
		),
	paste0( # to-do
		"[]()"
		),
	paste0( # project
		"[]()"
		),
	paste0( # milestones
		"Proposal 1",
		"<br>",
		"Proposal 3"
		)
)
#  week 2 ---------------------------------------------------- 2
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"2",    # week
	"M",    # day
	paste0(	# agenda
		"[]()"
		),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
		),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
		),
	paste0(	# to-do
		"[]()"
		),
	paste0(	# project
		"[]()"
		),
	paste0(	# milestones
		"[]()"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"T", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"R", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"F", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
#  week 3 ---------------------------------------------------- 3
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"3",  # week
	"M", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"T", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"R", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"F", # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
#  week 4 ---------------------------------------------------- 4
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"4",    # week
	"M",    # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		"[]()"
	),
	paste0(	# book
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercise
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# to-do
		"[]()"
	),
	paste0(	# project
		"[]()"
	),
	paste0(	# milestones
		"[]()"
	)
)
