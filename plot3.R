bigData<-read.csv("./household_power_consumption.txt",sep = ";")
##This requires you to have the household power consumption file in your
##working directory.
data<-bigData[bigData$Date == "1/2/2007"|bigData$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
## For some reason, I had to use as.character to get as.numeric to work 
##correctly.
data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png",height = 480, width = 480)
plot(data$Time,data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(data$Time,data$Sub_metering_1, col = "black")
lines(data$Time,data$Sub_metering_2, col = "red")
lines(data$Time,data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
dev.off()