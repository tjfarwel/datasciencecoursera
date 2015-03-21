 run_analysis <- function (){
     
     library(dplyr)
     activities <- read.table("UCI HAR Dataset\\activity_labels.txt")
     activities <- activities[,c(2)]
     
     features <- read.table("UCI HAR Dataset\\features.txt")
     features <- features[,c(2)]
     features <- as.vector(features)
     
     subtest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
     
     Xtest <- read.table("UCI HAR Dataset\\test\\X_test.txt")
     
     ytest <- read.table("UCI HAR Dataset\\test\\y_test.txt")
     
     data1 <- cbind(subtest, ytest, Xtest)
     
     names(data1)[c(1,2)] <- c("subject", "activity")
     names(data1)[c(3:563)] <- features
     
     subtrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
     
     Xtrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")
     
     ytrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")
     
     data2 <- cbind(subtrain, ytrain, Xtrain)
     
     names(data2)[c(1,2)] <- c("subject", "activity")
     names(data2)[c(3:563)] <- features
     data <- rbind(data1, data2)
     
     data <- tbl_df(data)
     data <- data[!duplicated(names(data))]
     
    data <- select(data,matches("subject") ,matches("activity"), contains("mean()" ), contains("std()"))
    
    data <- arrange(data, subject, activity)
    data$activity <- as.factor(data$activity) 
    levels(data$activity) <- activities
    write.table(data, "part1.txt", row.name= FALSE)
     
    
    
    #part 2
    grouped_data <- group_by(data, subject, activity)
    summarised <- summarise_each(grouped_data, funs(mean))
    write.table(summarised, "step5.txt", row.name=FALSE)
}