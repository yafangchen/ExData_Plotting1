data <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
datasel <- data[which (data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
datasel$Date <- strptime(paste(datasel$Date,datasel$Time),"%d/%m/%Y %H:%M:%S")

with(datasel,plot(datasel$Date,datasel$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
lines(datasel$Date,datasel$Global_active_power)
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()