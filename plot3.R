#reading file
data <- read.csv2("household_power_consumption.txt", sep=";", header=TRUE)

#subseting data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data2 <- subset(data, Date==as.Date("01/02/2007", format="%d/%m/%Y") | Date==as.Date("02/02/2007", format="%d/%m/%Y"))
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))

#cleaning data
data2$Global_active_power <- as.numeric(gsub("\\?",NA, data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(gsub("\\?",NA, data2$Global_reactive_power))
data2$Voltage <- as.numeric(gsub("\\?",NA, data2$Voltage))

#plotting
png('plot3.png', width=480, height=480)
plot(data2$DateTime, data2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data2$DateTime, data2$Sub_metering_2, type="l", col="red")
lines(data2$DateTime, data2$Sub_metering_3, type="l", col="blue")
legend("topright",  c(colnames(data2)[7:9]), col=c("black", "red", "blue"), lty=1, bty="n")
dev.off()
