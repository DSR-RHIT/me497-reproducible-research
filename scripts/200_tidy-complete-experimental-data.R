library(tidyverse)

data <- read_csv("./data/complete-experimental-data.csv")
colnames(data) <- c("flow", "h1", "h2", "flow", "h1", "h2", "flow", "h1", "h2")
units <- data[1,]
data <- data[-1,]

data_1.5 <- data[,1:3]
data_2.5 <- data[,4:6]
data_3.5 <- data[,7:9]

data <- rbind(data_1.5, data_2.5, data_3.5)
rownames(data) <- NULL

write_csv(data, "results/tidy-experimental-data.csv")