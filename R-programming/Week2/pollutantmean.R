pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(directory)
  filenames <- dir(getwd(), pattern = ".csv" )
  dataid <- NULL
  for(i in id){
    data <- read.csv(filenames[i])
    dataid <- rbind(dataid, data[!is.na(data[pollutant]),])
  }
  setwd("..")
  return(mean(dataid[[pollutant]]))
}