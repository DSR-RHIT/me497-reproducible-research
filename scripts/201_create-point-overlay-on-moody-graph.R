library(png)
library(grid)
library(ggplot2)

d <- data.frame(x=c(30,50,70), y= c(40,50,75))

r <- png::readPNG('./resources/013_moody-diagram.png')
rg <- grid::rasterGrob(r, width=unit(1,"npc"), height=unit(1,"npc"))

ggplot(d, aes(x,y)) + 
  annotation_custom(rg) +
  geom_point(colour="red") +
  scale_x_continuous(expand=c(0,0), lim=c(0,100)) +
  scale_y_continuous(expand=c(0,0), lim=c(0,100)) +
  theme_void() +
  theme(aspect.ratio = nrow(r)/ncol(r)) 
