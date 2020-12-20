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