library (dplyr)

road<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
road_year <- summarise(group_by(road, year), Emissions=sum(Emissions))
barplot (names.arg=road_year$year,height = road_year$Emissions,
         xlab="Years", ylab="PM2.5 Emissions",
         main="Motor vehicle sources emissions in Baltimore City")

dev.copy (png, file="plot5.png") 
dev.off ()