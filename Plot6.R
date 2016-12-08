## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

baltimoreData<-subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD") #get baltimore specific data
LosAngelData<-subset(NEI, NEI$fips=="06037" & NEI$type=="ON-ROAD") #get baltimore specific data

aggregatedBaltimore <- aggregate(Emissions ~ year, baltimoreData, sum)
aggregatedLos <- aggregate(Emissions ~ year, LosAngelData, sum)

png('plot6.png')
par(mfrow=c(2,1))
barplot(height=aggregatedBaltimore$Emissions, names.arg=aggregatedBaltimore$year, xlab="years", ylab=expression('Vehicle related emission in Baltimore'),main=expression('Total vehicle related emissions at various years in Baltimore'), ylim=c(0,4000))
barplot(height=aggregatedLos$Emissions, names.arg=aggregatedLos$year, xlab="years", ylab=expression('Vehicle related emission in LA'),main=expression('Total vehicle related emissions at various years in LA'), ylim=c(0,4000))
dev.off()