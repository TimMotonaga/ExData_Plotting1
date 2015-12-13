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

##The script reads the table and then creates a smaller table which only
##contains the days we care about.

data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$datetime<-dmy_hms(paste(data$Date,data$Time))

##The script changes the data types of a few columns to numeric, and makes a 
##column which combines the date and time as a POSIXct object.

png(filename = "plot3.png",height = 480, width = 480)
plot(data$datetime,data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime,data$Sub_metering_1, col = "black")
lines(data$datetime,data$Sub_metering_2, col = "red")
lines(data$datetime,data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
dev.off()