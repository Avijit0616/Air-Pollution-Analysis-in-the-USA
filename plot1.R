setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
NEI <- readRDS("summarySCC_PM25.rds");dim(NEI);head(NEI)
t <- tapply(NEI$Emissions/10^6,NEI$year,sum);t
names(t)
plot(t, type = "n", xaxt = "n",
     ylim = c(2,8), xlim = c(0.5,4.5),
     xlab = "Year", ylab = "Amount of PM2.5 emitted, in million tons",
     main = "PM2.5 levels in the United States")
axis(1, at = 1:4, labels = names(t))
lines(t, col = "blue", lty = 9)
points(t, pch = 20, cex = 2, col = "red")
#lines(t, col = "red", type = "h", lwd = 10)
dev.list()
dev.copy(png,"./Air pollution/plot1.png", width=480, height=480)
dev.list()
dev.off()
