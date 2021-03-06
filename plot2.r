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

##Data range selected
Data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Data and Time column and final data
DT <-strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
fData <- cbind(DT, Data)

##Plot generated with the characteristics required

plot(fData$DT, fData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

## png file created with size 
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()