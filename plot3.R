library (ggplot2)
library (dplyr)


q3<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))

ggplot(q3, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("Emissions in Baltimore City by types"))
  
dev.copy (png, file="plot3.png") 
dev.off ()

