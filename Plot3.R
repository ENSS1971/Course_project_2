#Question 3

#Load libraries
library(ggplot2)

#Reading data
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Fetching data from BaltimoreCity
BaltimoreCity <- subset(NEI, fips == "24510")

#Calculating total emissions by Typetfor and year BaltimoreCity
#Creating the graph
ggp <- ggplot(BaltimoreCity, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill="none")+
  facet_grid(.~type,scales = "free", space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 
                        by Source Type")) + 
  theme(plot.margin = margin(t = 30,  # Top margin
                             r = 50,  # Right margin
                             b = 5,  # Bottom margin
                             l = 10)) # Left margin)

#Viewing the graph
print(ggp)

#Copy Plot in png-file
dev.copy(png, filename = 'plot3.png', width = 500, height = 400)
dev.off ()
