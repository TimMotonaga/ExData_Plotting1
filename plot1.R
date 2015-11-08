bigData<-read.csv("./household_power_consumption.txt",sep = ";")
##This requires you to have the household power consumption file in your
##working directory.
data<-bigData[bigData$Date == "1/2/2007"|bigData$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
## For some reason, I had to use as.character to get as.numeric to work 
##correctly.
png(filename = "plot1.png",height = 480, width = 480)
hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
      main = "Global Active Power")
dev.off()