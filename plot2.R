bigData<-read.csv("./household_power_consumption.txt",sep = ";")
##This requires you to have the household power consumption file in your
##working directory.
data<-bigData[bigData$Date == "1/2/2007"|bigData$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
## For some reason, I had to use as.character to get as.numeric to work 
##correctly.
data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png",height = 480, width = 480)
plot(data$Time,data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()