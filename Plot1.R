#Question 1

#Reading data
NEI <- readRDS("./data2/summarySCC_PM25.rds")

#Calculating total emissions per year PM25
totalPM25year <- tapply(NEI$Emissions, NEI$year, sum)

#Plot the result
plot(names(totalPM25year), totalPM25year, type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))

#Copy Plot in png-file
dev.copy(png, filename = 'plot1.png', width = 500, height = 400)
dev.off ()
