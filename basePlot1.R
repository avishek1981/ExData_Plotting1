power <- read.table('D:/R_Data/household_power_consumption.txt',header=TRUE,sep=";",na.strings="?")
power$newdate <- as.Date(power$Date,"%d/%m/%Y")

## Subsetting the data
power.subset <- power[power$newdate == as.Date("2007-02-01") | power$newdate == as.Date("2007-02-02"),]

## Converting dates
power.subset$newTime <- as.POSIXct(strptime(paste(power.subset$Date,power.subset$Time), "%d/%m/%Y %H:%M:%S"))

power.subset$Global_active_kpower <- (as.numeric(power.subset$Global_active_power)/1000)

## Plot 1
hist(as.numeric(power.subset$Global_active_kpower),col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")

## Saving to file
dev.copy(png, file="D:/Python Tutorial/Rcode/basePlot1.png", height=480, width=480)
dev.off()