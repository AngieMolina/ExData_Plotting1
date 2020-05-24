library(dplyr)
##data url, download and unzip
Url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Folder <- "./Data/household_power_consumption.zip"
File <- "./Data/household_power_consumption.txt"
if (!file.exists(File)) {
  download.file(Url, Folder)
  unzip(Folder, overwrite = TRUE, exdir = "./Data")
}

##Tidy data load
data <- read.table(File, header=TRUE, sep=";", na.strings="?")

##Data set as required
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##Data range selected
Data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##Plot generated with the characteristics required
hist(Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## png file created with size 
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()