rankall <- function(outcome, num = "best"){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  hospital <- NULL
  states <- NULL
  
  outcome <- if(outcome == "heart attack"){
    11
  }else if(outcome == "heart failure"){
    17
  }else if(outcome == "pneumonia"){
    23
  }else stop("invalid outcome")
  
  data[, outcome] <- as.numeric(data[, outcome])
  data <- data[!is.na(data[outcome]),]
  
  if( class(num) == "numeric" && num > nrow(data_state) )
    return(NA)
  else{
    for(state in sort(unique(data[["State"]]))){
      data_state <- data[data["State"] == state,]
      data_state_name_sort <- data_state[order(data_state[2]),]
      states <- c(states, state)
      if( num == "best"){
        hospital <- c(hospital, data_state_name_sort[which.min(data_state_name_sort[,outcome]),2])
      }else if( num == "worst"){
        hospital <- c(hospital, data_state_name_sort[which.max(data_state_name_sort[,outcome]),2])
      }else{
        data_rank_sort <- data_state_name_sort[order(data_state_name_sort[outcome]),]
        hospital <- c(hospital, data_rank_sort[which.min(data_rank_sort[,outcome])+num-1,2])
      }
    }
    state <- states
    output <- data.frame(hospital, state, row.names = state)
  }
  
}