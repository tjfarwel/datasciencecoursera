rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
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
        
        data <- data[,c(2,7,11)]
        names(data)[3]<-"mortality"
        data <- data[ order(data[,2],data[,3],data[,1]),]
        data <- data[!is.na(data$mortality),]
        data <- split(data,data$State)
        #highdata <- data[which(data$State == state),c(2,14)]
        answer <- data.frame(hospital = character(), state = character())
        
        if(num == "best"){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][1,c(1,2)] )
            }  
        }
            
        else if(num == "worst"){
            for(i in 1:length(statelist))
            {
                #append trialdata[[2]][70,c(1,2)] to dataframe
                #data[[i]][num,c(1,2)]
                answer <- rbind(answer, data[[i]][nrow(data[[i]]),c(1,2)] )
            }  
        }
            
        else if(is.numeric(num)){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][num,c(1,2)] )
            } 
        }
            
        else{}
        
        
        
    }
    else if(outcome == "heart failure")
    {
        data[,17] <- as.numeric(data[,17])
        
        data <- data[,c(2,7,17)]
        names(data)[3]<-"mortality"
        data <- data[ order(data[,2],data[,3],data[,1]),]
        data <- data[!is.na(data$mortality),]
        data <- split(data,data$State)
        #highdata <- data[which(data$State == state),c(2,14)]
        answer <- data.frame(hospital = character(), state = character())
        
        if(num == "best"){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][1,c(1,2)] )
            }  
        }
        
        else if(num == "worst"){
            for(i in 1:length(statelist))
            {
                #append trialdata[[2]][70,c(1,2)] to dataframe
                #data[[i]][num,c(1,2)]
                answer <- rbind(answer, data[[i]][nrow(data[[i]]),c(1,2)] )
            }  
        }
        
        else if(is.numeric(num)){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][num,c(1,2)] )
            } 
        }
        
        else{}
        
        
    }
    else if(outcome == "pneumonia")
    {
        data[,23] <- as.numeric(data[,23])
        
        data <- data[,c(2,7,23)]
        names(data)[3]<-"mortality"
        data <- data[ order(data[,2],data[,3],data[,1]),]
        data <- data[!is.na(data$mortality),]
        data <- split(data,data$State)
        #highdata <- data[which(data$State == state),c(2,14)]
        answer <- data.frame(hospital = character(), state = character())
        
        if(num == "best"){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][1,c(1,2)] )
            }  
        }
        
        else if(num == "worst"){
            for(i in 1:length(statelist))
            {
                #append trialdata[[2]][70,c(1,2)] to dataframe
                #data[[i]][num,c(1,2)]
                answer <- rbind(answer, data[[i]][nrow(data[[i]]),c(1,2)] )
            }  
        }
        
        else if(is.numeric(num)){
            for(i in 1:length(statelist))
            {
                
                answer <- rbind(answer, data[[i]][num,c(1,2)] )
            } 
        }
        
        else{}
        
        
        
    }
    else{
        stop("invalid outcome")
    }
    names(answer)[c(1,2)] <- c("hospital", "state")
    answer
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
