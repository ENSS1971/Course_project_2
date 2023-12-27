<center>## Exploratory Data Analysis - Course Project 2
<hr>
### Answers to the questions are at the bottom of this document ### </center>
<br>
We first ensure that the datasets file is extracted and extracted.

```
#Download in packages
library(zip)

#Checking for and creating directories
if(!file.exists("./data2")){dir.create("./data2")}

#Getting data from the internet download.file()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile <- paste("./data2", basename(url), sep = "/")
download.file(url = url,
              destfile = destfile,
              mode = "wb")

#unzipping the file
unzip(zipfile = "./data2/exdata%2Fdata%2FNEI_data.zip",
      exdir = "./data2",
      overwrite = TRUE)

```
We now load the NEI and SCC data frames from the .rds files.
```
#Reading data
SCC <- readRDS("./data2/Source_Classification_Code.rds")
NEI <- readRDS("./data2/summarySCC_PM25.rds")
```
<br>
<h3>*Questions*</h5>
<h4>*Question 1*</h3>
First we'll aggregate the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

```
#Calculating total emissions per year PM25
totalPM25year <- tapply(NEI$Emissions, NEI$year, sum)
```
Using the base plotting system, now we plot the total PM2.5 Emission from all sources.

```
#Plot the result
plot(names(totalPM25year), totalPM25year, type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
```
![Terminal](https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/144_Gitlab-512.png)









