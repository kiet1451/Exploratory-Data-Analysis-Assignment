#From four types of sources indicated by the (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Let find the sum emission by year and by type
NEI_bal_type <- with(NEI_Bal,aggregate(Emissions, list(year = year, type=type),sum))
colnames(NEI_bal_type)[3] <-'Emissions'
#Plot the data of total emissions per year and type from city of Baltimore
g <- ggplot(NEI_bal_type, aes(year,Emissions/10000, col=type))
g+ geom_line() + geom_point()+ ggtitle(" Baltimore City PM2.5 Emissions in 1999-2008") +
  labs(x= "Year 1999-2008", y= "PM2.5 Coal combustion-related Emissions in Tons")
dev.copy(png,file='plot3.png')
dev.off()