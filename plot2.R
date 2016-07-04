## read in the whole data set 
 powerconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

## subset the data set only to the dates of 2007-02-01 and 2007-02-02
data <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")

##get the date and time
t <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
##convert the Global_active_power variable to numeric
globalActivePower <- as.numeric(data$Global_active_power)
##plot using the plot function
plot(t,globalActivePower,xlab="",ylab="Global Active Power (killowatts)",type="l")

##save the plot to a png file
dev.copy(png,"plot2.png",width=480,height=480)
##close the graphics device
dev.off()

