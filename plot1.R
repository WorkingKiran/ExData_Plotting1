#setwd("BA/R/EDA/week1/assignment/")
## read data and do some cleanning
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?")
colnames(df) <- tolower(colnames(df))
df$date <- strptime(df$date, format = "%d/%m/%Y")
startday <- strptime("01/02/2007", format = "%d/%m/%Y")
endday <- strptime("02/02/2007", format = "%d/%m/%Y")
newdf <- df[which(df$date == startday | df$date == endday),]

## make plots
png(filename = "plot1.png", width = 480, height = 480, units = "px",
    bg = "white", res = 72)
hist(newdf$global_active_power, freq = TRUE, col = "red", breaks = 24,
     xlim = c(0, 6), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()