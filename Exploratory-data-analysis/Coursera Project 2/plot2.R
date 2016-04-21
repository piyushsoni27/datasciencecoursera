plot2 <- function(dt1){
  dt1 <- readRDS("summarySCC_PM25.rds")
  dt1 <- subset(dt1, fips == "24510")
  a <- tapply(dt1$Emissions, dt1$year, sum)
  
  png("plot2.png", width = 480, height = 480)
  plot(rownames(data.frame(a)), a, type = "l", xlab = "Years", ylab = "Total PM2.5", main = "Total emissions from PM2.5 decreased in the Baltimore City")
  dev.off()
}

plot2(dt1)