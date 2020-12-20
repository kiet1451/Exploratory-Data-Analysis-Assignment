#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
mrg_LA_onroad <- subset(mrg, fips == "06037" & type == "ON-ROAD")  
mrg_LA_onroad_sum <- with(mrg_LA_onroad, aggregate(Emissions, list(type = type, year = year),sum))
colnames(mrg_LA_onroad_sum)[3] <- 'Emissions'
mrg_LA_onroad_sum

mrg_bal_onroad$city <- 'Baltimore'
mrg_bal_onroad_sum$city <- 'Baltimore'
mrg_LA_onroad_sum$city <- 'Los Angeles'
mrg_dual_onroad_sum <- rbind(mrg_bal_onroad_sum, mrg_LA_onroad_sum)
mrg_dual_onroad_sum

g <-ggplot(mrg_dual_onroad_sum, aes(year,Emissions, col = city))
g+ geom_point() + geom_line() +labs(x= 'YEAR 1999-2008', y = 'Total Emissions PM2.5(Tons)')+labs(title = "PM2.5 Motor Emissions in Baltimore vs Los Angeles in 1999-2008 in Tons")

dev.copy(png,file='plot6.png')
dev.off()