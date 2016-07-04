
## read in the whole data set 
 powerconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

## subset the data set only to the dates of 2007-02-01 and 2007-02-02
data <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")



## convert the Global_active_power variable to numeric
globalActivePower <- as.numeric(data$Global_active_power)
## plot the variable using hist()

hist(globalActivePower,col="red",xlab="Global Active Power (killowatts)",main="Global Active Power")

##save the plot to a png file
dev.copy(png,file="plot1.png",width=480,height=480)

##close the graphics device
dev.off()
