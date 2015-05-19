
# this is slow, learn plyr better
data <- aggregate(NEI[,c("Emissions")],by = list(NEI$year, NEI$type),sum)
names(data) <- c("Year", "Type", "PM25")

library(ggplot2)
d <- ggplot(data, aes(x=Year, y = PM25, colour = Type)) +  geom_line()+ geom_point(size=4,shape=21)
png(filename = "plot3.png", width =480, height = 480, units = "px")
d + ggtitle("Baltimore Emissions By Type")
dev.off()
