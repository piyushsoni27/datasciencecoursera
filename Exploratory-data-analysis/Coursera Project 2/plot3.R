library(ggplot2)
plot3 <- function(dt1){
  # dt1 <- readRDS("summarySCC_PM25.rds")
  d1 <- subset(dt1, fips == "24510")
  a <- tapply(d1$Emissions, interaction(d1$year, d1$type), sum)
  b <- strsplit(row.names(data.frame(a)), "\\.")
  b <- t(data.frame(b))
  d <- data.frame(a,b)
  colnames(d) <- c("Total_emission", "Year", "type")
  
  png("plot3.png", width = 480, height = 480)
  qplot(Year, Total_emission, col = type, group = type, data = d, main = "Total emission for each type") + geom_line()
  dev.off()
}

plot3(dt1)