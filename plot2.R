library(lubridate)

##You need to install the lubridate pacakge before running this script.
##It offers nice functions for dealing with dates.

if(!file.exists("./household_power_consumption.txt")){
    tinyurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(tinyurl,"./Power.zip")
    unzip("Power.zip")
}

##The script downloads and unzips the data to the working
##directory,if it doesn't find household_power_consumption.txt

bigData<-read.csv("./household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)
data<-bigData[bigData$Date == "1/2/2007"|bigData$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$datetime<-dmy_hms(paste(data$Date,data$Time))
png(filename = "plot2.png",height = 480, width = 480)
plot(data$datetime,data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()