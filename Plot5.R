#Question 5

#Load libraries
library(ggplot2)

#Read files
SCC <- readRDS("./data2/Source_Classification_Code.rds")
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Gathering the NEI data subsets that correspond to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

#Creating the graph
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore
                        from 1999-2008")) + 
       theme(plot.margin = margin(t = 20,  # Top margin
                                  r = 50,  # Right margin
                                  b = 40,  # Bottom margin
                                  l = 10)) # Left margin)

#Viewing the graph
print(ggp)

#Copy Plot in png-file
dev.copy(png, filename = 'plot5.png', width = 500, height = 400)

dev.off()
