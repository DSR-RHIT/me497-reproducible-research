# start week --------------------------------------------------------- 01 -----
df <- assign_lesson(
	df, iweek = iweek, iday = 1,
	iagenda   = str_c(
		"Course introduction [[S](slides/cm4001_introduction.pdf)]",
		"Review calendar",
		sep = "<br>"),
	itext     = str_c(
		"[1.1 -- 1.6](http://r4ds.had.co.nz/introduction.html)",
		sep = "<br>"),
	iexercise = str_c(
		"",
		sep = "<br>"),
	iactivity = str_c(
		"[Read syllabus](cm/cm0003_syllabus.md)",
		"[Install R & RStudio](cm/cm1001_install-R-RStudio.md)",
		"[Install git](cm/cm1002_install-git.md)",
		"[Create library](cm/cm1003_library.md)",
		sep = "<br>"),
	iproject  = str_c(
		"[Meet 597](cm/cm3301_project-3_start.md)",
		sep = "<br>"),
	idue      = str_c(
		"Meet 597",
		sep = "<br>")
)

# assign one lesson to the df
df <- assign_lesson(
	df, iweek = iweek, iday = 2,
	iagenda   = str_c(
		"Reproducible workflows [[S](slides/cm4002_principles.pdf)]",
		sep = "<br>"),
	itext     = str_c(
		"", sep = "<br>"),
	iexercise = str_c(
		"", sep = "<br>"),
	iactivity = str_c(
		"[Setup GitHub](cm/cm1004_setup-github.md)",
		"[Create repos](cm/cm1005_create-repo.md)",
		"[Create Rproj](cm/cm1006_setup-Rproj.md)",
		"[Create Renviron](cm/cm1007_Renviron.md)",
		sep = "<br>"),
	iproject  = str_c(
		"[Proposal 1](cm/cm3101_project-1-select.md)",
		"[Proposal 3](cm/cm3301_project-3_start.md)",
		sep = "<br>"),
	idue      = str_c(
		"Meet 597", sep = "<br>")
)

# assign one lesson to the df
df <- assign_lesson(
	df, iweek = iweek, iday = 3,
	iagenda   = str_c(
		"Starting with R Markdown [[S](slides/cm4003_rmarkdown.pdf)]",
		"Collaboration basics",
		sep = "<br>"),
	itext     = str_c(
		"[27.1 -- 27.6](http://r4ds.had.co.nz/r-markdown.html)",
		"[[L](cm/cm5005_how-to-collab.md)]",
		sep = "<br>"),
	iexercise = str_c(
		"", sep = "<br>"),
	iactivity = str_c(
		"[Setup directories](cm/cm1008_setup-directories.md)",
		"[Edit gitignore](cm/cm1009_gitignore.md)",
		"[Invite collaborator](cm/cm1010_invite-collab.md)",
		"[Commits](cm/cm1011_basic-collab.md)",
		"[Edit README](cm/cm1012_edit-readme.md)",
		sep = "<br>"),
	iproject  = str_c(
		"", sep = "<br>"),
	idue      = str_c(
		"Meet 597", sep = "<br>")
)

# assign one lesson to the df
df <- assign_lesson(
	df, iweek = iweek, iday = 4,
	iagenda   = str_c(
		"", sep = "<br>"),
	itext     = str_c(
		"", sep = "<br>"),
	iexercise = str_c(
		"", sep = "<br>"),
	iactivity = str_c(
		"", sep = "<br>"),
	iproject  = str_c(
		"", sep = "<br>"),
	idue      = str_c(
		"", sep = "<br>")
)
