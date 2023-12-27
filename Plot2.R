#Question 2

#Reading data
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Fetching data from BaltimoreCity
BaltimoreCity <- subset(NEI, fips == "24510")

#Visualizing the first five rows of the dataset
head(BaltimoreCity)

#Calculating total emissions per year in the city of Baltimore
totalPM25Baltimoreyear <- tapply(BaltimoreCity$Emissions,
                                 BaltimoreCity$year, sum)

#Visualizing the first five rows of the dataset
head(totalPM25Baltimoreyear)

#Plot the result
plot(names(totalPM25Baltimoreyear), totalPM25Baltimoreyear, type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), 
     main = expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"))

#Copy Plot in png-file
dev.copy(png, filename = 'plot2.png', width = 500, height = 400)
dev.off ()
