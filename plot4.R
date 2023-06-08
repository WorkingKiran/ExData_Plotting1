#setwd("BA/R/EDA/week1/assignment/")
## read data and do some cleanning
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?")
colnames(df) <- tolower(colnames(df))
df$datetime <- paste(df$date, df$time, sep = " ")
df$date <- strptime(df$date, format = "%d/%m/%Y")
df$datetime <- strptime(df$datetime, format = "%d/%m/%Y %H:%M:%S")
startday <- strptime("01/02/2007", format = "%d/%m/%Y")
endday <- strptime("02/02/2007", format = "%d/%m/%Y")
newdf <- df[which(df$date == startday | df$date == endday),]

## make plots
dev.new()
png(filename = "plot4.png", width = 480, height = 480, units = "px",
    bg = "white", res = 72)
par(mfrow = c(2,2))
with(newdf,{
plot(datetime, global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
plot(datetime, voltage, type = "l", col = "black",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
plot(datetime, sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
    lines(datetime, sub_metering_2, type = "l", col = "red")
    lines(datetime, sub_metering_3, type = "l", col = "blue")
    legend("topright",
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
           col = c("black", "red", "blue"), lty=1, lwd=2)
plot(datetime, global_reactive_power, type = "l", col = "black",
     xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(time1, time2, time3), labels = c("Thu", "Fri", "Sat"))
})
dev.off()