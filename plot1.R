data <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE)
datasel <- data[which (data$Date == "1/2/2007"|data$Date == "2/2/2007"),]
datasel$Date <- strptime(paste(datasel$Date,datasel$Time),"%d/%m/%Y %H:%M:%S")

datasel$Global_active_power <- as.numeric(datasel$Global_active_power)
hist(datasel$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()