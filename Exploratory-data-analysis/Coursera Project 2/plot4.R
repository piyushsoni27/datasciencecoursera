library(ggplot2)
plot4 <- function(dt1){
  dt1 <- readRDS("summarySCC_PM25.rds")
  dt2 <- readRDS("Source_Classification_Code.rds")
  
  c <- grepl("[Cc]oal", as.character(dt2$EI.Sector))
  d <- dt2[c,]
  
  dt3 <- dt1[dt1$SCC %in% d$SCC,]
  
  a <- tapply(dt3$Emissions, dt3$year, sum)
 
  png("plot4.png", width = 480, height = 480)
  plot(rownames(data.frame(a)), a, type = "l", xlab = "Years", ylab = "Total PM2.5", main = "Total PM2.5 emissions from coal combustion-related sources")
  dev.off()
}

plot4(dt1)