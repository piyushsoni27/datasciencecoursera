corr <- function(directory, threshold = 0) {
  filenames <- dir(directory, pattern = ".csv")
  complete <- complete(directory)
  setwd(directory)
  id <- complete[complete["nobs"] > threshold,][["id"]]
  corr <- NULL
  for(i in id){
    data <- read.csv(filenames[i])
    corr <- c(corr, cor(data[!is.na(data["sulfate"]) & !is.na(data["nitrate"]),][["sulfate"]], data[!is.na(data["nitrate"]) & !is.na(data["sulfate"]),][["nitrate"]]))
    }
  setwd("..")
  return(corr)
}