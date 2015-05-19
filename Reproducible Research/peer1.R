activity <- read.csv("activity.csv")

activity2 <- aggregate(x = activity[,c(1)], by = list(activity$date), FUN = sum)

hist(activity2$x, main = "Steps per Day", xlab = "Steps")
meansteps <- mean(activity2$x, na.rm = TRUE)

mediansteps <- median(activity2$x, na.rm = TRUE)

interval_average <- aggregate(activity[,c(1)], list(activity$interval), mean, na.rm = TRUE)

plot(interval_average, type ="l", xlab = "Time Interval", ylab = "Steps", 
     main = "Average Steps Taken During Day")


interval_average[max(interval_average$x),c(1)]

sum(is.na(activity))

#split by date
list <- split(x = activity[,c(1)], f = activity$interval)
interval_mean <- lapply(list, mean, na.rm = TRUE)

#fill missing data with average of that time interval
for(i in 1:length(activity$steps)){
    if(is.na(activity$steps[i])){
        activity$steps[i] <- interval_mean[[as.character(activity$interval[i])]]
    }
}

activity3 <- aggregate(x = activity[,c(1)], by = list(activity$date), FUN = sum)

hist(activity3$x, main = "Steps per Day ", xlab = "Steps")
mean(activity3$x)

median(activity3$x)


activity$date <- as.Date(activity$date)
activity["day"] <- NA
for(i in 1:length(activity$day)){
    if(weekdays(activity$date[i]) == "Saturday" | weekdays(activity$date[i]) == "Sunday"){
        activity$day[i] <- "Weekend"
    }
    else
        activity$day[i] <- "Weekday"
        
}
activity$day <- as.factor(activity$day)

weekdays <- activity[activity$day == "Weekday",]
weekend <- activity[activity$day == "Weekend",]
weekday_average <- aggregate(weekdays[,c(1)], list(weekdays$interval), mean, na.rm = TRUE)
weekend_average <- aggregate(weekend[,c(1)], list(weekend$interval), mean, na.rm = TRUE)


par(mfrow = c(2,1))
plot(weekday_average$Group.1,weekday_average$x, type = "l", xlab = "Time Interval", 
     ylab = "Average Steps")
plot(weekend_average$Group.1,weekend_average$x, type = "l", xlab = "Time Interval",
     ylab = "Average Steps")
