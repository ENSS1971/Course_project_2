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

#Checking the size of a file before loading in into R
file.size("./data2/summarySCC_PM25.rds")
file.size("./data2/Source_Classification_Code.rds")

#Reading data
NEI <- readRDS("./data2/summarySCC_PM25.rds")
SCC <- readRDS("./data2/Source_Classification_Code.rds")

#General dataset summary
summary(NEI)
summary(SCC)

#Visualizing the first five rows of the dataset
head(NEI)
head(SCC)


