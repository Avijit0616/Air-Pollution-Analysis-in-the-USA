setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")}
#dim(NEI);head(NEI)

NEI_B_vehicles <- subset(NEI, type == "ON-ROAD" & fips == "24510")
B_vehicles_Emissions <- aggregate(Emissions ~ year, NEI_B_vehicles, sum)

g5 <- ggplot(B_vehicles_Emissions, aes(year,Emissions))
g5 + geom_line() + 
  geom_point(aes(size = Emissions)) +
  xlab("Year") + ylab("PM2.5 Emissions in tons") +
  ggtitle('PM2.5 Emissions in Baltimore city from motor vehicles')

dev.list()
dev.copy(png,"./Air pollution/plot5.png", width=560, height=480)
dev.list()
dev.off()
