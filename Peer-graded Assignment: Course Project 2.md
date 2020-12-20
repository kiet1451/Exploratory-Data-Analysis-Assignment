#Peer-graded Assignment: Course Project 2
By Kiet Huynh

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008
#Import RDS files to NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Create the sum of Emissions based on year of NEI data
NEIplot <- with(NEI,aggregate(Emissions, list(year = year),sum))
colnames(NEIplot)[2] <-'Emissions'
#Plot the data of total emissions per year
par(mfrow=c(1,1))
plot(NEIplot$year,NEIplot$Emissions/10000, type='o',pch =19, col ='blue',main = 
'PM2.5 Emissions in the United States in 1999-2008', xlab = 'Year in 1999-2008', ylab = 'Total 
Emissions PM2.5(Tons)' )
dev.copy(png,file='plot1.png')
dev.off()
#Base on the plot, there is a signiciant reduction of Total Emissions year by year.



