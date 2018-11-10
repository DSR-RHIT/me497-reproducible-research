# functions for creating the calendar

# do this once to create the empty week files
# idx <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10")
# sapply(idx, function(x)
# 	file.copy(from = "scripts/week_blank.R",
# 						to   = str_c("scripts/week", x, ".R"),
# 						overwrite = FALSE
# 	)
# )

# functions
assign_lesson <- function(df, iweek, iday,
													iagenda = NULL, itext = NULL, iexercise = NULL,
													iactivity = NULL, iproject = NULL, idue = NULL) {

	idx <- which(df$week == iweek & df$day == iday)

	df_day <- df[idx, ] %>%
		mutate(agenda   = if_else(is.null(iagenda),   "", iagenda)) %>%
		mutate(text     = if_else(is.null(itext),     "", itext)) %>%
		mutate(exercise = if_else(is.null(iexercise), "", iexercise)) %>%
		mutate(activity = if_else(is.null(iactivity), "", iactivity)) %>%
		mutate(project  = if_else(is.null(iproject),  "", iproject)) %>%
		mutate(due      = if_else(is.null(idue),      "", idue))

	df[idx, ] <- df_day
	return(df)
}

cleanup <- function(df) {
	df <- df %>%
		mutate(week = case_when(
			day == 1 ~ as.character(week),
			day == 2 ~ "",
			day == 3 ~ "",
			day == 4 ~ ""
		)) %>%
		mutate(day = case_when(
			day == 1 ~ "M",
			day == 2 ~ "T",
			day == 3 ~ "R",
			day == 4 ~ "F"
		)) %>%
		replace_na(list(
			agenda   = "",
			text     = "",
			exercise = "",
			activity = "",
			project  = "",
			due      = ""
		))
}
