
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
mrgcoal <- mrg[grepl('coal', mrg$Short.Name, ignore.case=T),]
mrgcoal_sum <- with(mrgcoal, aggregate(Emissions, list(Year=year,Type=type),sum))
colnames(mrgcoal_sum)[3] <- 'Emissions'
mrgcoal_sum

g <- ggplot(mrgcoal_sum, aes(Year,Emissions/10000, col=Type))
g+ geom_line() + geom_point()+ ggtitle("US Coal combustion-related PM2.5 Emissions in 1999-2008") +
  labs(x= "Year 1999-2008", y= "PM2.5 Coal combustion-related Emissions in Tons")

dev.copy(png,file='plot4.png')
dev.off()

