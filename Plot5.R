## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

baltimoreData<-subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD") #get baltimore specific data

aggregatedBaltimore <- aggregate(Emissions ~ year, baltimoreData, sum)

png('plot5.png')
barplot(height=aggregatedBaltimore$Emissions, names.arg=aggregatedBaltimore$year, xlab="years", ylab=expression('Vehicle related emission in Baltimore'),main=expression('Total vehicle related emissions at various years in Baltimore'))
dev.off()