library (dplyr)

coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal_s <- SCC[coal,]

em_coal <- NEI[(NEI$SCC %in% coal_s$SCC), ]

em_coal_g <- summarise(group_by(em_coal, year), Emissions=sum(Emissions))
barplot (names.arg=em_coal_g$year,height=em_coal_g$Emissions,
         xlab = "Years", ylab = "PM 2.5 Emissions (tons)",
         main= "Coal combustion-related sources emissions in USA")
dev.copy (png, file="plot4.png") 
dev.off ()