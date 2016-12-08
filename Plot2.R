NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimoreData<-subset(NEI, NEI$fips=="24510") #get baltimore specific data

aggregatedTotalByYear <- aggregate(Emissions ~ year, baltimoreData, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in Baltimore'),main=expression('Total PM'[2.5]*' emissions at various years in Baltimore'))
dev.off()