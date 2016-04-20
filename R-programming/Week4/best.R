best <- function(state, outcome){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  outcome <- if(outcome == "heart attack"){
    11
  }else if(outcome == "heart failure"){
    17
  }else if(outcome == "pneumonia"){
    23
  }else stop("invalid outcome")
  
  data[, outcome] <- as.numeric(data[, outcome])
  data <- data[!is.na(data[outcome]),]
  
  if(!(state %in% data[["State"]])){
    stop("invalid state")
  }
  
  data_state <- data[data["State"] == state,]
  data_state_name_sort <- data_state[order(data_state[2]),]
  
  best <- data_state_name_sort[which.min(data_state_name_sort[,outcome]),2]
}