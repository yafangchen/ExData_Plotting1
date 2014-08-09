data <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
datasel <- data[which (data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
datasel$Date <- strptime(paste(datasel$Date,datasel$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

with(datasel,plot(datasel$Date,datasel$Global_active_power,xlab="",ylab="Global Active Power",type="n"))
lines(datasel$Date,datasel$Global_active_power)

with(datasel,plot(datasel$Date,datasel$Voltage,xlab="datetime",ylab="Voltage",type="n"))
lines(datasel$Date,datasel$Voltage)

with(datasel,plot(datasel$Date,datasel$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
lines(datasel$Date,datasel$Sub_metering_1)
lines(datasel$Date,datasel$Sub_metering_2,col="red")
lines(datasel$Date,datasel$Sub_metering_3,col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)

with(datasel,plot(datasel$Date,datasel$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n"))
lines(datasel$Date,datasel$Global_reactive_power)

dev.off()