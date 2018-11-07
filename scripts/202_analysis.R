library(scales)
library(tidyverse)

df <- read_csv("results/tidy-experimental-data.csv")
constants <- read_csv("data/constants.csv")
D <- constants$value[1]/1000
L <- constants$value[2]/100
rho <- constants$value[3]
epsilon <- constants$value[4]/1000
mu <- constants$value[5]
V <- 94.64e-6
g <- 9.81

df <- df %>%
  mutate(flow_si = flow/15852)


# Mary, the units of height in the raw data are in mm
# must divide by 1000 to convert to meters before doing the computation 

#calc friction factor(fac) and reynolds number(num)
df <- df %>%
  mutate(h1 = h1/1000, h2 = h2/1000) %>% 
  mutate(fac = (pi^2*D^5*g*(h1-h2))/(8*L*flow_si^2),
         num = (4*rho*flow_si)/(pi*mu*D))



#group mean friction factor and reynolds number by flow rate (1.5, 2.5, 3.5)
dfGrouped <- df %>% group_by(flow) %>% summarise(fac = round(mean(fac), digits = 4),
                                                 num = mean(num))

dfGrouped$num <- dfGrouped$num %>% scientific(digits = 3)

#make it pretty
dfGrouped <- cbind(c("Low", "Medium", "High"), dfGrouped)
colnames(dfGrouped) <- c("Flow rate level", "Flow rate (gpm)", "Mean friction factor", "Reynolds number")

write_csv(dfGrouped, "results/mean-fricfac-reynum.csv")

