setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
if(!exists("NEI")){
NEI <- readRDS("summarySCC_PM25.rds");dim(NEI);head(NEI)}
NEI_B <- subset(NEI,fips == "24510");head(NEI_B)
tb <- with(NEI_B,tapply(Emissions/10^3,year,sum));tb
names(tb)
plot(tb, type = "n", xaxt = "n",
     ylim = c(0,4), xlim = c(0.5,4.5),
     xlab = "Year", ylab = "Amount of PM2.5 emitted, in thousand tons",
     main = "PM2.5 levels in the Baltimore City")
axis(1, at = 1:4, labels = names(tb))
lines(tb, col = "blue", lty = 9)
points(tb, pch = 20, cex = 2, col = "red")
#lines(tb, col = "red", type = "h", lwd = 10)
dev.list()
dev.copy(png,"./Air pollution/plot2.png", width=480, height=480)
dev.list()
dev.off()
