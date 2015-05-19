coal <- subset(SCC, grepl("Coal", Short.Name))
coal <- subset(SCC, grepl("coal", Short.Name))
data <- rbind(Coal, coal)
data <- data[,c(1)]

NEI1999 <- c(1999, sum(NEI[NEI$year == 1999 & NEI$SCC %in% data ,c("Emissions")]))
NEI2002 <- c(2002, sum(NEI[NEI$year == 2002 & NEI$SCC %in% data,c("Emissions")]))
NEI2005 <- c(2005, sum(NEI[NEI$year == 2005 & NEI$SCC %in% data,c("Emissions")]))
NEI2008 <- c(2008, sum(NEI[NEI$year == 2008 & NEI$SCC %in% data,c("Emissions")]))

data <- rbind(NEI1999,NEI2002,NEI2005,NEI2008)
png(filename = "plot4.png", width =480, height = 480, units = "px")
plot(data, main = "Total Coal Emissions", xlab = "Year", ylab = "PM2.5 Emissions (tons)",
     col = "Red", pch = 19, type = "l")
dev.off()