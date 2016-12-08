## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEISCC<-merge(NEI,SCC,by="SCC")
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

FinalMatchingSet<-NEISCC[coalMatches,]
aggregatedTotalByYear <- aggregate(Emissions ~ year, FinalMatchingSet, sum)

png('plot4.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('Coal related emission'),main=expression('Total coal related emissions at various years'))
dev.off()