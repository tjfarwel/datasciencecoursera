data <- SCC[SCC$Data.Category == "Onroad",]
data <- data[,c(1)]

BALTNEI1999 <- c(1999, sum(NEI[NEI$year == 1999 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2002 <- c(2002, sum(NEI[NEI$year == 2002 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2005 <- c(2005, sum(NEI[NEI$year == 2005 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2008 <- c(2008, sum(NEI[NEI$year == 2008 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))

data <- rbind(BALTNEI1999,BALTNEI2002,BALTNEI2005,BALTNEI2008)

png(filename = "plot5.png", width =480, height = 480, units = "px")
plot(data, main = "Baltimore Motor Vehicle Emissions", xlab = "Year", ylab = "PM2.5 Emissions (tons)",
     col = "Red", pch = 19, type = "l")
dev.off()