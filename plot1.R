library (dplyr)

total <-
  NEI %>%
  group_by(year) %>%
  summarize(total_emissions = sum(as.numeric(Emissions),na.rm = TRUE)  ) 
barplot (names.arg=total$year,height = total$total_emissions,
         xlab = "Years", ylab = "PM2.5 Emissions",
      main= "Total emissions in the United States from 1999 to 2008")
dev.copy (png, file="plot1.png") 
dev.off ()
