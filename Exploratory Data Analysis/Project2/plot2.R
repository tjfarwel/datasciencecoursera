#assume data loaded
ptm <- proc.time()
NEI1999 <- c(1999, sum(NEI[NEI$year == 1999 & NEI$fips == 24510,c("Emissions")]))
NEI2002 <- c(2002, sum(NEI[NEI$year == 2002 & NEI$fips == 24510,c("Emissions")]))
NEI2005 <- c(2005, sum(NEI[NEI$year == 2005 & NEI$fips == 24510,c("Emissions")]))
NEI2008 <- c(2008, sum(NEI[NEI$year == 2008 & NEI$fips == 24510,c("Emissions")]))


data <- rbind(NEI1999,NEI2002,NEI2005,NEI2008)
proc.time() - ptm
png(filename = "plot2.png", width =480, height = 480, units = "px")
plot(data, main = "Total Emissions in Baltimore", xlab = "Year", ylab = "PM2.5 Emissions", col = "Red"
     , pch = 19, type = "l")
dev.off()