## read in the whole data set 
 powerconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

## subset the data set only to the dates of 2007-02-01 and 2007-02-02
data <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")

##get the date and time
t <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
metering1 <- as.numeric(data$Sub_metering_1)
metering2 <- as.numeric(data$Sub_metering_2)
metering3 <- as.numeric(data$Sub_metering_3)

#plot 
plot(t,metering1,type="l",ylab="Energy sub metering",xlab="")
lines(t,metering2,type="l",col="red")
lines(t,metering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))

##save the plot to a png file
dev.copy(png,"plot3.png",width=480,height=480)
##close the graphics device
dev.off()


 
