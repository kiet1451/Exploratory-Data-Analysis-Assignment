#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#Filter data from city of Baltimore
NEI_Bal <- subset(NEI, fips == "24510")
#Create the sum of Emissions based on year of NEI data from Baltimore
NEI_bal_plot <- with(NEI_Bal,aggregate(Emissions, list(year = year),sum))
colnames(NEI_bal_plot)[2] <-'Emissions'
#Plot the data of total emissions per year from city of Baltimore
par(mfrow=c(1,1))
plot(NEI_bal_plot$year,NEI_bal_plot$Emissions/10000, type='o',pch =19, col ='red',main = 
       'PM2.5 Emissions in Baltimore City, Maryland 1999-2008', xlab = 'Year in 1999-2008', ylab = 'Total 
Emissions PM2.5(Tons)' )
dev.copy(png,file='plot2.png')
dev.off()