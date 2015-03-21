rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    statelist <- unique(data$State)
    stateExists <- state %in% statelist
    
    if(!stateExists)#checks if state is actual state
    {
        stop("invalid state")
    }
    if(outcome == "heart attack")
    {
        data[,11] <- as.numeric(data[,11])
        #data[,14] <- as.numeric(data[,14])
        lowdata <- data[which(data$State == state),c(2,11)]
        #highdata <- data[which(data$State == state),c(2,14)]
        names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        newdata <- lowdata
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        newdata <- newdata[!is.na(newdata$mortality),]
        #get vector with lowest heart attacks
        if(num == "best")
            answer <- newdata[1,1]
        else if(num == "worst")
            answer <- newdata[nrow(newdata),1]
        else if(is.numeric(num))
            answer <- newdata[num,1]
        else{}
        
        
        
    }
    else if(outcome == "heart failure")
    {
        data[,17] <- as.numeric(data[,17])
        #data[,14] <- as.numeric(data[,14])
        lowdata <- data[which(data$State == state),c(2,17)]
        #highdata <- data[which(data$State == state),c(2,14)]
        names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        newdata <- lowdata
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        newdata <- newdata[!is.na(newdata$mortality),]
        #get vector with lowest heart attacks
        if(num == "best")
            answer <- newdata[1,1]
        else if(num == "worst")
            answer <- newdata[nrow(newdata),1]
        else if(is.numeric(num))
            answer <- newdata[num,1]
        else{}
    }
    else if(outcome == "pneumonia")
    {
        data[,23] <- as.numeric(data[,23])
        #data[,14] <- as.numeric(data[,14])
        lowdata <- data[which(data$State == state),c(2,23)]
        #highdata <- data[which(data$State == state),c(2,14)]
        names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        newdata <- lowdata
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        newdata <- newdata[!is.na(newdata$mortality),]
        #get vector with lowest heart attacks
        if(num == "best")
            answer <- newdata[1,1]
        else if(num == "worst")
            answer <- newdata[nrow(newdata),1]
        else if(is.numeric(num))
            answer <- newdata[num,1]
        else{}
        
    }
    else{
        stop("invalid outcome")
    }
    
    answer
}

