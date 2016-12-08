#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
#variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer
#this question.
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData<-subset(NEI, NEI$fips=="24510") #get baltimore specific data

aggregatedTotalByYear <- aggregate(Emissions ~ year+type, baltimoreData, sum) # Aggregating the data by year and type

png('plot3.png', width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(year, Emissions, color = type))
g<-g+geom_line() + ggtitle('Total Emissions in Baltimore City, from 1999 to 2008') + xlab("year") +ylab(expression('Total PM'[2.5]*" Emissions"))
print(g)
dev.off()