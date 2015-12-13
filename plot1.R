##A quick note on the plots: I started this class last month, but had to drop because of work. This is an 
##improved version of the code I submitted last month; the new code uses lubridate and fixes an issue 
##with read.csv which caused me to write extra code. The plots produced by the new code are the same as 
##the plots produced by the old code, so gitbash did not commit them when I used "git commit -a".
##That is why the plots say they were commited last month (though I created them with the current code, 
##as you can verify).

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
