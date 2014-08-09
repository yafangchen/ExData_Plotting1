data <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
datasel <- data[which (data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
datasel$Date <- strptime(paste(datasel$Date,datasel$Time),"%d/%m/%Y %H:%M:%S")

with(datasel,plot(datasel$Date,datasel$Sub_metering_1,xlab="",ylab="",type="n"))
lines(datasel$Date,datasel$Sub_metering_1)
lines(datasel$Date,datasel$Sub_metering_2,col="red")
lines(datasel$Date,datasel$Sub_metering_3,col="blue")
title(ylab="Energy sub metering")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()