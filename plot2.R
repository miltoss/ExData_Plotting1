
# setwd("/Users/miltos/Documents/Coursera/JHDSS/4.ExploratoryDataAnalysis/Week1/ExData_Plotting1")
getwd()


t <- read.csv("household_power_consumption.txt", sep=';')
t$DateTime <- as.POSIXct(paste(as.character(levels(t$Date)[t$Date]),  as.character(levels(t$Time)[t$Time])), format="%d/%m/%Y %H:%M:%S")

t$Date <- as.Date(t$Date, format="%d/%m/%Y")
t <- t[(t$Date == "2007-02-01") | (t$Date == "2007-02-02"),]

t$Time <- strptime(t$Time, format="%H:%M:%S")
t$Global_active_power <- as.numeric(levels(t$Global_active_power)[t$Global_active_power])

t$Global_reactive_power <- as.numeric(levels(t$Global_reactive_power)[t$Global_reactive_power])
t$Voltage <- as.numeric(levels(t$Voltage)[t$Voltage])

t$Global_intensity <- as.numeric(levels(t$Global_intensity)[t$Global_intensity])

t$Sub_metering_1 <- as.integer(levels(t$Sub_metering_1)[t$Sub_metering_1])
t$Sub_metering_2 <- as.integer(levels(t$Sub_metering_2)[t$Sub_metering_2])
t$Sub_metering_3 <- as.integer(t$Sub_metering_3)


quartz()
plot(t$DateTime,t$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png")
dev.off()



