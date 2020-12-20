#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City
mrg_bal_onroad <- subset(mrg, fips == "24510" & type == "ON-ROAD")
mrg_bal_onroad_sum <- with(mrg_bal_onroad, aggregate(Emissions, list(type = type, year = year),sum))
colnames(mrg_bal_onroad_sum)[3] <- 'Emissions'
mrg_bal_onroad_sum
g <- ggplot(mrg_bal_onroad_sum, aes(year,Emissions, col = type))
g+ geom_line() + geom_point()+ ggtitle("Baltimore PM2.5 Motor Vehicle Emissions in 1999-2008 in Tons") +
  labs(x= "Year 1999-2008", y= "PM2.5 Motor Vehicle Emissions in Tons")

dev.copy(png,file='plot5.png')
dev.off()