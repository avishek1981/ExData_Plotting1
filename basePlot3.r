power <- read.table('D:/R_Data/household_power_consumption.txt',header=TRUE,sep=";",na.strings="?")
power$newdate <- as.Date(power$Date,"%d/%m/%Y")

## Subsetting the data
power.subset <- power[power$newdate == as.Date("2007-02-01") | power$newdate == as.Date("2007-02-02"),]

## Converting dates
power.subset$newTime <- as.POSIXct(strptime(paste(power.subset$Date,power.subset$Time), "%d/%m/%Y %H:%M:%S"))

power.subset$Global_active_kpower <- (as.numeric(power.subset$Global_active_power))

## Plot 3
with(power.subset, {
    plot(Sub_metering_1~newTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~newTime,col='Red')
    lines(Sub_metering_3~newTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="D:/Python Tutorial/Rcode/basePlot3.png", height=480, width=480)
dev.off()