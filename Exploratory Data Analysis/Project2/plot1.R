ptm <- proc.time()
NEI1999 <- c(1999, sum(NEI[NEI$year == 1999 ,c("Emissions")]))
NEI2002 <- c(2002, sum(NEI[NEI$year == 2002 ,c("Emissions")]))
NEI2005 <- c(2005, sum(NEI[NEI$year == 2005 ,c("Emissions")]))
NEI2008 <- c(2008, sum(NEI[NEI$year == 2008 ,c("Emissions")]))
proc.time() - ptm

png(filename = "plot1.png", width =480, height = 480, units = "px")
ptm <- proc.time()
plot(aggregate(NEI[,c("Emissions")],by = list(NEI$year),sum), type = "l", xlab = "Year", 
     ylab = "PM2.5 Emissions", main = "Total Emissions By Year")
proc.time() - ptm
dev.off()