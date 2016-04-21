library(ggplot2)
plot6 <- function(dt1){
  
  # dt1 <- readRDS("summarySCC_PM25.rds")
  # dt2 <- readRDS("Source_Classification_Code.rds")
  
  dt3 <- subset(dt1, fips == "06037" | fips == "24510")
  c <- grepl("[Vv]ehicle", as.character(dt2$EI.Sector))
  d <- dt2[c,]
  
  dt3 <- dt3[dt3$SCC %in% d$SCC,]
  
  a <- tapply(dt3$Emissions, interaction(dt3$year,dt3$fips), sum)
  b <- strsplit(row.names(data.frame(a)), "\\.")
  b <- t(data.frame(b))
  d <- data.frame(a,b)
  colnames(d) <- c("Total_emission", "Year", "region")
  levels(d$region) <- c("LosAngeles", "Baltimore")
  
  png("plot6.png", width = 480, height = 480)
  qplot(Year, Total_emission, col = region, group = region, 
        data = d, main = "Total emissions from motor vehicle sources") + geom_line()  
  dev.off()
}

plot6(dt1)