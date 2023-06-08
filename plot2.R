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
## to change x labels, we need to know numeric time. unclass can do this
time1 = unclass(as.POSIXct("2007-02-01 00:00:00 CST"))
time2 = unclass(as.POSIXct("2007-02-02 00:00:00 CST"))
time3 = unclass(as.POSIXct("2007-02-03 00:00:00 CST"))

dev.new()
png(filename = "plot2.png", width = 480, height = 480, units = "px",
    bg = "white", res = 72)
plot(newdf$datetime, newdf$global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = c(time1, time2, time3), labels = c("Thu", "Fri", "Sat"))
dev.off()