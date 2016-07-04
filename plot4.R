## read in the whole data set 
 powerconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

## subset the data set only to the dates of 2007-02-01 and 2007-02-02
data <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")

##get the date and time
t <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
volt <- as.numeric(data$Voltage)
metering1 <- as.numeric(data$Sub_metering_1)
metering2 <- as.numeric(data$Sub_metering_2)
metering3 <- as.numeric(data$Sub_metering_3)
globalReactivePower <- as.numeric(data$Global_reactive_power)


par(mfrow = c(2,2))
plot(t,globalActivePower,type="l",xlab="",ylab="Global Active Power")


plot(t,volt,type="l",xlab="datetime",ylab="Voltage")

plot(t,metering1,type="l",xlab="",ylab="Energy sub metering")
lines(t,metering2,type="l",col="red")
lines(t,metering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n",cex=1,pt.cex=1)
 
 
plot(t,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")

##save the plot to a png file
dev.copy(png,file="plot4.png",width=480,height=480)
##close the graphics device
dev.off()

