complete <- function(directory, id = 1:332) {
  setwd(directory)
  filenames <- dir(getwd(), pattern = ".csv" )
  nobs <- NULL
  for(i in id){
    data <- read.csv(filenames[i])
    nobs <- rbind(nobs, sum(!is.na(data["sulfate"]) & !is.na(data["nitrate"])))
  }
  output <- data.frame(id, nobs)
  setwd("..")
  return(output)
}