library (dplyr)
q2<-subset (NEI, fips =="24510")


total_2 <-
  q2 %>%
  group_by(year) %>%
  summarize(total_emissions = sum(as.numeric(Emissions),na.rm = TRUE)  ) 
barplot (names.arg=total_2$year,
      height=total_2$total_emissions,
      xlab = "Years", ylab = "Emissions",
      main="Baltimore City, Maryland")
dev.copy (png, file="plot2.png") 
dev.off ()
