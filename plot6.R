setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")}
#dim(NEI);head(NEI)

NEI_LAB_vehicles <- subset(NEI, type == "ON-ROAD" & (fips == "24510"|fips == "06037"))
LAB_vehicles_Emissions <- aggregate(Emissions ~ year + fips, NEI_LAB_vehicles, sum)

ct <- function(t) {
  ifelse(t == "24510", "Baltimore City", "LA County")
}


LAB_vehicles_Emissions <- mutate(LAB_vehicles_Emissions, 
                                 City = ct(LAB_vehicles_Emissions$fips))


g6 <- ggplot(LAB_vehicles_Emissions, aes(year, Emissions, col = City))
g6 + 
  geom_line() + 
  geom_point(aes(size = Emissions)) +
  xlab("Year") + ylab("PM2.5 Emissions in tons") +
  ggtitle('PM 2.5 Emissions in Baltimore City and LA County from motor vehicles')

dev.list()
dev.copy(png,"./Air pollution/plot6.png", width=560, height=480)
dev.list()
dev.off()
