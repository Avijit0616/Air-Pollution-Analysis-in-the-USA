setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
if(!exists("NEI")){
NEI <- readRDS("summarySCC_PM25.rds")}
#dim(NEI);head(NEI)
NEI_B <- subset(NEI,fips == "24510")

library(ggplot2)

NEI_B0 <- aggregate(Emissions ~ year + type, NEI_B, sum)
g <- ggplot(NEI_B0, aes(year,Emissions, col = type))
g <- g + 
  geom_line() + 
  geom_point(aes(size = Emissions)) +
  xlab("Year") + ylab("PM2.5 Emissions in tons") +
  ggtitle('PM 2.5 Emissions in Baltimore City(classified by type of source)')
g

dev.list()
dev.copy(png,"./Air pollution/plot3.png", width=560, height=480)
dev.list()
dev.off()

#NEI_B0 <- aggregate(Emissions ~ year + type, NEI_B, sum)
#qplot(year, Emissions, color = type, data = NEI_B0, geom = c("point","line"))
