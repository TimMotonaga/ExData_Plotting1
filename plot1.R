if(!file.exists("./household_power_consumption.txt")){
    tinyurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(tinyurl,"./Power.zip")
    unzip("Power.zip")
}

##The script downloads and unzips the data to the working
##directory,if it doesn't find household_power_consumption.txt

bigData<-read.csv("./household_power_consumption.txt",
    sep = ";", stringsAsFactors = FALSE)
data<-bigData[bigData$Date == "1/2/2007"|bigData$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
png(filename = "plot1.png",height = 480, width = 480)
hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
      main = "Global Active Power")
dev.off()