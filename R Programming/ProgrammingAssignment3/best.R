best <- function(state, outcome){
    #get states names, check if state is real state
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    statelist <- unique(data$State)
    stateExists <- state %in% statelist
    
    if(!stateExists)#checks if state is actual state
    {
        stop("invalid state")
    }
    if(outcome == "heart attack")
    {
        data[,13] <- as.numeric(data[,13]) 
        newdata <- data[which(data$State == state),c(2,13)]
        #highdata <- data[which(data$State == state),c(2,14)]
        #names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        #get vector with lowest heart attacks
        answer <- newdata[1,1]
        
    }
    else if(outcome == "heart failure")
    {
        data[,19] <- as.numeric(data[,19]) 
        newdata <- data[which(data$State == state),c(2,19)]
        #highdata <- data[which(data$State == state),c(2,14)]
        #names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        #get vector with lowest heart attacks
        answer <- newdata[1,1]
    }
    else if(outcome == "pneumonia")
    {
        data[,25] <- as.numeric(data[,25]) 
        newdata <- data[which(data$State == state),c(2,25)]
        #highdata <- data[which(data$State == state),c(2,14)]
        #names(lowdata)[2]<-"mortality"
        #names(highdata)[2]<-"mortality"
        #newdata<- rbind(lowdata, highdata)
        
        newdata <- newdata[ order(newdata[,2],newdata[,1]),] #sorts first by mortality then by hospital
        #get vector with lowest heart attacks
        answer <- newdata[1,1]
        
    }
    else{
        stop("invalid outcome")
    }
    
    answer
}