library(tidyverse)

df <- read.csv("results/mean-fricfac-reynum.csv")

df <- df %>% mutate(Reference.value = c(0.0341, 0.0305, 0.0280),
                    Percent.diff = paste(round(((Mean.friction.factor-Reference.value)/Reference.value)*100, digits = 1), "%", sep="")) %>%
  select(Flow.rate.level, Reference.value, Percent.diff)

colnames(df) <- c("Flow rate level", "Reference value (gpm)", "Percent difference")

write_csv(df, "results/percent-diff.csv")
