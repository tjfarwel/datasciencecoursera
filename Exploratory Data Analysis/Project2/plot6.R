data <- SCC[SCC$Data.Category == "Onroad",]
data <- data[,c(1)]

BALTNEI1999 <- c("Baltimore",1999, sum(NEI[NEI$year == 1999 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2002 <- c("Baltimore",2002, sum(NEI[NEI$year == 2002 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2005 <- c("Baltimore",2005, sum(NEI[NEI$year == 2005 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))
BALTNEI2008 <- c("Baltimore",2008, sum(NEI[NEI$year == 2008 & NEI$SCC %in% data & NEI$fips == "24510",c("Emissions")]))

LANEI1999 <- c("LA",1999, sum(NEI[NEI$year == 1999 & NEI$SCC %in% data & NEI$fips == "06037",c("Emissions")]))
LANEI2002 <- c("LA",2002, sum(NEI[NEI$year == 2002 & NEI$SCC %in% data & NEI$fips == "06037",c("Emissions")]))
LANEI2005 <- c("LA",2005, sum(NEI[NEI$year == 2005 & NEI$SCC %in% data & NEI$fips == "06037",c("Emissions")]))
LANEI2008 <- c("LA",2008, sum(NEI[NEI$year == 2008 & NEI$SCC %in% data & NEI$fips == "06037",c("Emissions")]))

data1 <- rbind(BALTNEI1999,BALTNEI2002,BALTNEI2005,BALTNEI2008)
data2 <- rbind(LANEI1999,LANEI2002,LANEI2005,LANEI2008)
data <- as.data.frame(rbind(data1, data2))
names(data) <- c("City","Year", "PM25")
data$Year<- as.numeric(as.character(data$Year))
data$PM25<- as.numeric(as.character(data$PM25))

library(ggplot2)
png(filename = "plot6.png", width =480, height = 480, units = "px")
d <- ggplot(data, aes(x=Year, y = PM25, colour = City)) +  geom_line()
d + ggtitle("LA vs Baltimore Vehicle Emissions")
dev.off()
