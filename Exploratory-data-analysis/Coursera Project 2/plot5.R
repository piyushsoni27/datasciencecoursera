plot5 <- function(dt1){
  
  dt1 <- readRDS("summarySCC_PM25.rds")
  dt2 <- readRDS("Source_Classification_Code.rds")
  
  dt3 <- subset(dt1, fips == "24510")
  c <- grepl("[Vv]ehicle", as.character(dt2$EI.Sector))
  d <- dt2[c,]
  
  dt3 <- dt3[dt3$SCC %in% d$SCC,]
  
  a <- tapply(dt3$Emissions, dt3$year, sum)
  
  png("plot5.png", width = 480, height = 480)
  plot(rownames(data.frame(a)), a, type = "l", xlab = "Years", ylab = "Total PM2.5",
       main = "Total emissions from vehicles sources for Baltimore City")
  dev.off()
}

plot5(dt1)