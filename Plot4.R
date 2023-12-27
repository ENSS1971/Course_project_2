#Question 4

#Load libraries
library(ggplot2)

#Read files
SCC <- readRDS("./data2/Source_Classification_Code.rds")
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

#Creating the graph
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*
                          " Coal Combustion Source Emissions Across
                        US from 1999-2008"))  + 
  theme(plot.margin = margin(t = 20,  # Top margin
                             r = 50,  # Right margin
                             b = 40,  # Bottom margin
                             l = 10)) # Left margin)

#Viewing the graph
print(ggp)

#Copy Plot in png-file
dev.copy(png, filename = 'plot4.png', width = 500, height = 400)
dev.off ()

