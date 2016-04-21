plot1 <- function(dt1){
  dt1 <- readRDS("summarySCC_PM25.rds")
  
  a <- tapply(dt1$Emissions, dt1$year, sum)
  png("plot1.png", width = 480, height = 480)
  plot(rownames(data.frame(a)), a, type = "l", xlab = "Years", ylab = "Total PM2.5", main = "Total PM2.5 emission from all sources for each of the years")
  dev.off()
}

plot1(dt1)