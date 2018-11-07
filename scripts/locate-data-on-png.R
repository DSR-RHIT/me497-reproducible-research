# attempt to place data markers to scale on a PNG of a Moody chart
# 2018-09-23
# RAL

library(png)
library(grid)

raster_moody <- readPNG("resources/013_moody-diagram.png")
grid.raster(raster_moody)




# library(pixmap)
# par(pin=c(7, 8.5), oma=c(0, 0, 0, 0), xaxs="i", yaxs="i", cex=.7)



par(pin = c(7, 8.5), oma = c(0, 0, 0, 0))
plot.new()
rect(0, 0, 1, 1, col = "transparent")
rasterImage(raster_moody, 0, 0, 1, 1)

par(new = TRUE, las = 1, yaxp = c(1e+2, 1e+8, 1))
plot(c(1, 100000), c(4.1e+2, 3e+8), type = "l", col = "red", lwd = 2, log="xy")


# plot(lowTideDate, lowTideHour, type="n",
#      ylim=range(mainHours), axes=FALSE, ann=FALSE)
# # dashed reference lines
# abline(v=phases$date,
#        col="white", lty="dashed")
# for (subset in list(1:13, 14:29, 30:31)) {
#   lines(lowTideDate[subset], lowTideHour[subset],
#         lwd=2, col="white")
#   points(lowTideDate[subset], lowTideHour[subset],
#          pch=16, col="white")
# }
# box()
# axis.POSIXct(1, lowTideDate)
# axis.POSIXct(2, at=mainHours, format="%H:%M")
# mtext("Time of Low Tide (NZDT)", side=2, line=4, las=0, cex=.7)
# mtext("Auckland, New Zealand January 2010", side=1, line=3, cex=.7)
# axis(3, at=phases$date, labels=FALSE)
# par(xpd=NA)
# ymax <- par("usr")[4]
# for (i in 1:nrow(phases))
#   moonPhase(phases$date[i], ymax + yinch(.2), 
#             phases$phase[i])
# mtext("Phases of the Moon", side=3, line=3, cex=.7)
# 
# 
# 
# 
# library(grImport)
# 
# 
# 
# grid.moonPhase <- function(x, y, phase, size=unit(.05, "in")) {
#   n <- 17
#   angle <- seq(0, 2*pi, length=n)
#   xx <- x + cos(angle)*size
#   yy <- y + sin(angle)*size
#   if (phase == "New")
#     fill <- "black"
#   else
#     fill <- "white"
#   grid.polygon(xx, yy, gp=gpar(fill=fill))
#   if (phase == "1Q")
#     grid.polygon(xx[(n/4):(n*3/4) + 1],
#                  yy[(n/4):(n*3/4) + 1],
#                  gp=gpar(fill="black"))
#   if (phase == "3Q")
#     grid.polygon(xx[c(1:(n/4 + 1), (n*3/4 + 1):n)],
#                  yy[c(1:(n/4 + 1), (n*3/4 + 1):n)],
#                  gp=gpar(fill="black"))
# }
# 
# # grid.newpage()
# pushViewport(viewport(gp=gpar(cex=0.7)),
#              plotViewport(c(4, 5, 3, 1)),
#              dataViewport(as.numeric(lowTideDate), 
#                           as.numeric(mainHours)))
# vectorMoon <- 
#   readPicture(system.file("extra", "comic_moon.ps.xml",
#                           package="RGraphics"))
# grid.picture(vectorMoon)
# grid.segments(unit(phases$date, "native"), 0,
#               unit(phases$date, "native"), 1,
#               gp=gpar(lty="dashed"))
# for (subset in list(1:13, 14:29, 30:31)) {
#   grid.lines(lowTideDate[subset], lowTideHour[subset],
#              default.units="native", 
#              gp=gpar(lwd=2))
#   grid.points(lowTideDate[subset], lowTideHour[subset],
#               pch=16, size=unit(2, "mm"))
# }
# grid.rect(gp=gpar(fill=NA))
# xTicks <- seq(min(lowTideDate), max(lowTideDate), by="week")
# grid.xaxis(at=xTicks, label=format(xTicks, "%b %d"))
# grid.yaxis(at=mainHours, label=format(mainHours, "%H:%M"))
# grid.text("Time of Low Tide (NZDT)", 
#           x=unit(-4, "lines"), rot=90)
# grid.text("Auckland, New Zealand January 2010", 
#           y=unit(-3, "lines"))
# grid.xaxis(main=FALSE, at=phases$date, label=FALSE)
# for (i in 1:nrow(phases))
#   grid.moonPhase(unit(phases$date[i], "native"),
#                  unit(1, "npc") + unit(1, "lines"), 
#                  phases$phase[i])
# grid.text("Phases of the Moon", 
#           y=unit(1, "npc") + unit(2, "lines"))
# popViewport(2)


