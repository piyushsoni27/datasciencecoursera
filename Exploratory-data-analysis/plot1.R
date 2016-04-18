plot1 <- function(){
  
  data <- read.table("household_power_consumption.txt", sep = ";", skip = 1, colClasses = "character")
  data$V1 <- as.Date(data$V1, "%d/%m/%Y")
  dt <- data[data$V1 == "2007-02-01" | data$V1 == "2007-02-02", ]
  
  png("plot1.png", height = 480, width = 480)
  hist(as.numeric(data$V3),col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}