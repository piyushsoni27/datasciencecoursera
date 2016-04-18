plot2 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep = ";", skip = 1, colClasses = "character")
  data$V1 <- as.Date(data$V1, "%d/%m/%Y")
  dt <- data[data$V1 == "2007-02-01" | data$V1 == "2007-02-02", ]
  date_time <- strptime(paste(as.character(dt$V1), dt$V2),"%Y-%m-%d %H:%M:%S", tz = "UTC")
  
  png("plot2.png", height = 480, width = 480)
  plot(date_time , as.numeric(dt$V3) ,type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()

  }