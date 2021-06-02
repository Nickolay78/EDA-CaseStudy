library (dplyr)
library (ggplot2)

road<-NEI[((NEI$fips=="24510")|(NEI$fips=="06037")) & (NEI$type=="ON-ROAD"),]
road_year <- summarise(group_by(road, year, fips), Emissions=sum(Emissions))

road_year$place[road_year$fips=="24510"]<-"Baltimore City"
road_year$place[road_year$fips=="06037"]<-"Los Angeles County"

qplot(x=factor(year),y=Emissions, data=road_year,facets = .~place, xlab="Year",
      ylab="PM2.5 Emissioms", main="Comparation of emissions from motor vehicle sources")

dev.copy (png, file="plot6.png") 
dev.off ()