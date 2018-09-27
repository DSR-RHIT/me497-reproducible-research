# calendar
# R Layton
# 2018-09-07

suppressPackageStartupMessages(library(tidyverse))
library(knitr)

# ------------------------------------------------------------
# things to remember to add or work with

# workflow, file management, and naming things
# Gandrud Ch. 2 & 4
# Hadley's style guide




# ------------------------------------------------------------

mt40 <- rep("", 42)
the_days <- c("R", "F", rep(c("M", "T", "R", "F"), 10))
df <- tibble(
	w      = mt40,
	d      = mt40,
	agenda = mt40,
	text   = mt40,
	exer   = mt40,
	activities = mt40,
	projects   = mt40,
	due    = mt40
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
	paste0(	# text
		"[1.1 -- 1.6](http://r4ds.had.co.nz/introduction.html)"
		),
	paste0(	# exercises
		"[]()"
		),
	paste0(	# activities
		"[Read&nbsp;syllabus](cm/cm0003_syllabus.md)",
		"<br>",
		"[Install&nbsp;R&nbsp;&&nbsp;RStudio](cm/cm1001_install-R-RStudio.md)",
		"<br>",
		"[Install&nbsp;git](cm/cm1002_install-git.md)",
		"<br>",
		"[Create&nbsp;library](cm/cm1003_library.md)"
		),
	paste0(	# projects
		"[Meet&nbsp;597](cm/cm3301_project-3_start.md)"
		),
	paste0(	# due
		"Meet&nbsp;597"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		"Reproducible workflows [[S](slides/cm4002_principles.pdf)]"
		),
	paste0(	# text
		"[]()"
		),
	paste0(	# exercises
		"[]()"
		),
	paste0(	# activities
		"[Setup&nbsp;GitHub](cm/cm1004_setup-github.md)",
		"<br>",
		"[Create&nbsp;repos](cm/cm1005_create-repo.md)",
		"<br>",
		"[Create&nbsp;Rproj](cm/cm1006_setup-Rproj.md)",
		"<br>",
		"[Create&nbsp;Renviron](cm/cm1007_Renviron.md)"
		),
	paste0(	# projects
		"[Proposal&nbsp;1](cm/cm3101_project-1-select.md)",
		"<br>",
		"[Proposal&nbsp;3](cm/cm3301_project-3_start.md)"
		),
	paste0(	# due
		"Meet&nbsp;597"
	)
)
#  week 1 ---------------------------------------------------- 1
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"1",    # week
	"M",    # day
	paste0( # agenda
		"Starting with R Markdown [[S](slides/cm4003_rmarkdown.pdf)]",
		"<br>",
		"Collaboration basics"
		),
	paste0( # text
		"[27.1 -- 27.6](http://r4ds.had.co.nz/r-markdown.html)",
		"<br>",
		"[[L](cm/cm5005_how-to-collab.md)]"
		),
	paste0( # exercises
		"[](http://r4ds.had.co.nz)"
		),
	paste0( # activities
		"[Setup&nbsp;directories](cm/cm1008_setup-directories.md)",
		"<br>",
		"[Edit&nbsp;gitignore](cm/cm1009_gitignore.md)",
		"<br>",
		"[Invite&nbsp;collaborator](cm/cm1010_invite-collab.md)",
		"<br>",
		"[Commits](cm/cm1011_basic-collab.md)",
		"<br>",
		"[Edit&nbsp;README](cm/cm1012_edit-readme.md)"
		),
	paste0( # projects
		"<br>"
		),
	paste0( # due
		"Meet&nbsp;597"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0( # agenda
		"Intro graphs",
		"<br>",
		"First steps",
		"<br>",
	  "Aesthetics"
		),
	paste0( # text
		"[3.1](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)",
		"<br>",
		"[3.2](http://r4ds.had.co.nz/data-visualisation.html#first-steps)",
	  "<br>",
	  "[3.3](http://r4ds.had.co.nz/data-visualisation.html#aesthetic-mappings)"
	 ),
	paste0( # exercises
		"[]()",
		"<br>",
		"[3.2.4](http://r4ds.had.co.nz/data-visualisation.html#introduction-1)",
		"<br>",
		"[3.3.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-1)"
		),
	paste0( # activities
		"[How to practice](practice_work/exercisess/8001_practice-work-setup.md)",
		"<br>",
		"Browse&nbsp;R1"
		),
	paste0(	# projects
		"[]()"
		),
	paste0(	# due
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
	paste0(	# text
		"[3.5](http://r4ds.had.co.nz/data-visualisation.html#facets)",
		"<br>",
		"[3.6](http://r4ds.had.co.nz/data-visualisation.html#geometric-objects)"
		),
	paste0(	# exercises
		"[3.5.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-2)",
		"<br>",
		"[3.6.1](http://r4ds.had.co.nz/data-visualisation.html#exercisess-3)"
		),
	paste0(	# activities
		"[]()"
		),
	paste0(	# projects
		"[]()"
		),
	paste0(	# due
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
	paste0( # text
		"[4.1](http://r4ds.had.co.nz/workflow-basics.html)",
		"<br>",
		"[4.2](http://r4ds.had.co.nz/workflow-basics.html#whats-in-a-name)",
		"<br>",
		"[4.3](http://r4ds.had.co.nz/workflow-basics.html#calling-functions)"
		),
	paste0( # exercises
		"[4.4](http://r4ds.had.co.nz/workflow-basics.html#practice)"
		),
	paste0( # activities
		"[]()"
		),
	paste0( # projects
		"[]()"
		),
	paste0( # due
		"Proposal&nbsp;1",
		"<br>",
		"Proposal&nbsp;3"
		)
)
#  week 2 ---------------------------------------------------- 2
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"2",    # week
	"M",    # day
	paste0(	# agenda
		"References [[S](slides/cm4004_references-word-styles.pdf)]",
		"<br>",
		"Controlling Word styles"
		),
	paste0(	# text
		"[[L](cm/cm5011_references.md)]",
		"<br>",
		"[[L](https://rmarkdown.rstudio.com/articles_docx.html)]"
		),
	paste0(	# exercises
		"[](http://r4ds.had.co.nz)"
		),
	paste0(	# activities
		"[References](cm/cm1013_references.md)",
		"<br>",
		"[Word&nbsp;styles](cm/cm1014_word-styles.md)",
		"<br>",
		"Study&nbsp;R1"
		),
	paste0(	# projects
		"[P1&nbsp;Draft](cm/cm3102_project-1-draft.md)",
		"<br>",
		"[Feedback response](cm/cm1015_feedback-response.md)"
		),
	paste0(	# due
		"[]()"
		)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"T", # day
	paste0(	# agenda
		"Discuss R1: [What does reproducibility mean?](resources/readings/2016-Goodman-et-al-what-does-RR-mean.pdf)"
	),
	paste0(	# text
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercises
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"R1 [Reading response](resources/readings/reading-response.pdf)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"R", # day
	paste0(	# agenda
		"Data basics: filter(), arrange()"
	),
	paste0(	# text
		"[5.1](http://r4ds.had.co.nz/transform.html#introduction-2)",
		"<br>",
		"[5.2](http://r4ds.had.co.nz/transform.html#filter-rows-with-filter)",
		"<br>",
		"[5.3](http://r4ds.had.co.nz/transform.html#arrange-rows-with-arrange)"
	),
	paste0(	# exercises
		"[]()",
		"<br>",
		"[5.2.4](http://r4ds.had.co.nz/transform.html#exercisess-7)",
		"<br>",
		"[5.3.1](http://r4ds.had.co.nz/transform.html#exercisess-8)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"F", # day
	paste0(	# agenda
		"Data basics: select(), mutate()"
	),
	paste0(	# text
		"[5.4](http://r4ds.had.co.nz/transform.html#select)",
		"<br>",
		"[5.5](http://r4ds.had.co.nz/transform.html#add-new-variables-with-mutate)"
	),
	paste0(	# exercises
		"[5.4.1](http://r4ds.had.co.nz/transform.html#exercisess-9)",
		"<br>",
		"[5.5.2](http://r4ds.had.co.nz/transform.html#exercisess-10)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"Revised proposal 3"
	)
)
#  week 3 ---------------------------------------------------- 3
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"3",  # week
	"M", # day
	paste0(	# agenda
		"Page breaks",
		"<br>",
		"Centering figures",
		"<br>",
		"Numbering figures & tables",
		"<br>",
		"Preparing work for transmittal"
	),
	paste0(	# text
		"[[L](cm/cm5012_page-breaks.md)]",
		"<br>",
		"[[L](cm/cm5013_centering-figs.md)]", #
		"<br>",
		"[[L](cm/cm5014_captioner.md)]", #
		"<br>",
		"L" # [[L](cm/cm5015_report-transmittal.md)]
	),
	paste0(	# exercises
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# activities
		"[Page breaks](cm/cm1016_page-breaks.md)",
		"<br>",
		"[Centering](cm/cm1017_centering-figs.md)",
		"<br>",
		"[Auto-numbering](cm/cm1018_captioner.md)", #
		"<br>",
		"File functions" # [File functions](cm/cm1018_manipulate-files.Rmd)
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"T", # day
	paste0(	# agenda
		"Data basics: summarize()"
	),
	paste0(	# text
		"[5.6](http://r4ds.had.co.nz/transform.html#grouped-summaries-with-summarise)"
	),
	paste0(	# exercises
		"[5.6.7](http://r4ds.had.co.nz/transform.html#exercises-11)"
	),
	paste0( # activities
		"Browse R2"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"R", # day
	paste0(	# agenda
		"R code basics: tibble()"
	),
	paste0(	# text
		"[10.1](http://r4ds.had.co.nz/tibbles.html)",
		"<br>",
		"[10.2](http://r4ds.had.co.nz/tibbles.html#tibbles)",
		"<br>",
		"[10.3](http://r4ds.had.co.nz/tibbles.html#tibbles-vs.data.frame)",
		"<br>",
		"[10.4](http://r4ds.had.co.nz/tibbles.html#interacting-with-older-code)"
	),
	paste0(	# exercises
		"[10.5](http://r4ds.had.co.nz/tibbles.html#exercises-18)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",  # week
	"F", # day
	paste0(	# agenda
		"Read and write data"
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
		),
	paste0(	# activities
		"[Data import](cm/cm1020_readr_exceptions.md)"
	),
	paste0(	# projects
		"[P2&nbsp;selection](cm/cm3201-project-2-candidates.md)",
		"<br>",
		"[P3&nbsp;schedule](cm/cm3302_project-3_meet-week-6-goals.md)"
	),
	paste0(	# due
		"[]()"
	)
)
#  week 4 ---------------------------------------------------- 4
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"4",    # week
	"M",    # day
	paste0(	# agenda
		"Managing version control changes and conflicts"
	),
	paste0(	# text
		"[[L](cm/cm1021_conflict-revert.md)]"
	),
	paste0(	# exercises
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# activities
		"Study R2",
		"<br>",
		"[Resolve v-c conflict](cm/cm1022_conflict-assignment.md)"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		"Discuss R2: [Shining light into black boxes](resources/readings/2012-Morin-Shining-light-into-black-boxes.pdf)"
	),
	paste0(	# text
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# exercises
		"[](http://r4ds.had.co.nz)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"R2 [Reading response](resources/readings/reading-response.pdf)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		"Factors"
	),
	paste0(	# text
		"[15.1](http://r4ds.had.co.nz/factors.html#introduction-9)",
		"<br>",
		"[15.2](http://r4ds.had.co.nz/factors.html#creating-factors)",
		"<br>",
		"[15.3](http://r4ds.had.co.nz/factors.html#general-social-survey)",
		"<br>",
		"[15.4](http://r4ds.had.co.nz/factors.html#modifying-factor-order)",
		"<br>",
		"[15.5](http://r4ds.had.co.nz/factors.html#modifying-factor-levels)"
	),
	paste0(	# exercises
		"<br>",
		"<br>",
		"[15.3.1](http://r4ds.had.co.nz/factors.html#exercise)",
		"<br>",
		"[15.4.1](http://r4ds.had.co.nz/factors.html#exercises-43)",
		"<br>",
		"[15.5.1](http://r4ds.had.co.nz/factors.html#exercises-44s)"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"P2&nbsp;preference"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		"Graph tour"
	),
	paste0(	# text
		"[[L](cm/cm5016_graph-tour-overview.md)]"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week 5 ---------------------------------------------------- 5
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"5",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		""
	),
	paste0(	# projects
		"P2&nbsp;assigned"
	),
	paste0(	# due
		"[P3&nbsp;progress](cm/cm3302_project-3_meet-week-6-goals.md)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Browse&nbsp;R3"
	),
	paste0(	# projects
		"[P2&nbsp;start-up](cm/cm3203_project-2_startup.md)",
		"<br>",
		"[P2&nbsp;schedule](cm/cm3202_project-2_schedule.md)"
	),
	paste0(	# due
		"P1&nbsp;Final&nbsp;report"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week ---------------------------------------------------- 6
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"6",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Study&nbsp;R3"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[P3&nbsp;progress](cm/cm3302_project-3_meet-week-6-goals.md)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		"Discuss R3: [Ten simple rules for reproducible computational  research](resources/readings/2013-Sandve-et-al-Ten-simple-rules.pdf)"
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"R3 [Reading response](resources/readings/reading-response.pdf)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		"break"
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		"break"
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week ---------------------------------------------------- 7
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"7",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[P2&nbsp;progress](cm/cm3202_project-2_schedule.md)",
		"<br>",
		"[P3&nbsp;progress](cm/cm3302_project-3_meet-week-6-goals.md)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Browse&nbsp;R4"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		""
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week ---------------------------------------------------- 8
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"8",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Study&nbsp;R4"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[P2&nbsp;progress](cm/cm3202_project-2_schedule.md)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		"Discuss R4: [Reproducible research can still be wrong](resources/readings/2015-Leek-Peng-RR-can-still-be-wrong.pdf)"
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"R4 [Reading response](resources/readings/reading-response.pdf)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week ---------------------------------------------------- 9
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"9",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[P2&nbsp;progress](cm/cm3202_project-2_schedule.md)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Browse&nbsp;R5"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		""
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
#  week ---------------------------------------------------- 10
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"10",    # week
	"M",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"Study&nbsp;R5"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"T",    # day
	paste0(	# agenda
		"Discuss R5: [Reproducible research: a dissenting opinion](resources/readings/2012-Drummond-RR-dissenting-opinion.pdf) "
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"R5 [Reading response](resources/readings/reading-response.pdf)"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"R",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"[]()"
	)
)
le_row <- le_row + 1 # ----- day
df[le_row, ] <- c(
	"",     # week
	"F",    # day
	paste0(	# agenda
		""
	),
	paste0(	# text
		"[]()"
	),
	paste0(	# exercises
		"[]()"
	),
	paste0(	# activities
		"[]()"
	),
	paste0(	# projects
		"[]()"
	),
	paste0(	# due
		"P2&nbsp;Final&nbsp;report",
		"<br>",
		"P3&nbsp;Final&nbsp;report"
	)
)
