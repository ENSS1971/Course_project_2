#Question 6

#Load libraries
library(ggplot2)

#Read files
SCC <- readRDS("./data2/Source_Classification_Code.rds")
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Gathering the NEI data subsets that correspond to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.

  #Baltimore City
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"

  #Los Angeles City
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"

#Combining the two subsets with the city name in one data frame
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

#Creating the graph
ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions
                        in Baltimore & LA, 1999-2008"))+ 
  theme(plot.margin = margin(t = 20,  # Top margin
                             r = 40,  # Right margin
                             b = 20,  # Bottom margin
                             l = 10)) # Left margin)

#Viewing the graph
print(ggp)

#Copy Plot in png-file
dev.copy(png, filename = 'plot6.png', width = 500, height = 400)

dev.off()

