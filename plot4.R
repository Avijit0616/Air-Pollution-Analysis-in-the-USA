setwd("D:/R working directory")
if(!file.exists("./Air pollution")){
  dir.create("./Air pollution")}
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")}
dim(NEI);head(NEI)
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")}
dim(SCC);head(SCC)
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}
#dim(NEISCC);head(NEISCC)

req_coal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
req_NEISCC <- NEISCC[req_coal, ]

Coal_emission <- aggregate(Emissions ~ year, req_NEISCC, sum)

g4 <- ggplot(Coal_emission, aes(year,Emissions))
g4 + geom_line() + 
  geom_point(aes(size = Emissions)) +
  xlab("Year") + ylab("PM2.5 Emissions in tons") +
  ggtitle('PM2.5 Emissions in the USA from coal sources')

dev.list()
dev.copy(png,"./Air pollution/plot4.png", width=560, height=480)
dev.list()
dev.off()
