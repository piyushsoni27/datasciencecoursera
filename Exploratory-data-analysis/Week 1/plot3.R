plot3 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep = ";", skip = 1, colClasses = "character")
  data$V1 <- as.Date(data$V1, "%d/%m/%Y")
  dt <- data[data$V1 == "2007-02-01" | data$V1 == "2007-02-02", ]
  date_time <- strptime(paste(as.character(dt$V1), dt$V2),"%Y-%m-%d %H:%M:%S", tz = "UTC")
 
  png("plot3.png", height = 480, width = 480)
  plot(date_time, dt$V7, type = "l", col="black", xlab = "", ylab = "Energy Sub metering")
  lines(date_time, dt$V8, type = "l", col = "red")
  lines(date_time, dt$V9, type = "l", col = "blue")
  legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
  dev.off()
  
}