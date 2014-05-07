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
png('plot1.png', width=480, height=480)
hist(data2$Global_active_power, main="Global active power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
