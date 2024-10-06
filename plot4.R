plot4 <- function() {
  library(plyr)
  library(dplyr)
  library(lubridate)
  #read in data
    # read in data
    dfrm <- read.table("household_power_consumption.txt", sep = ";", 
            stringsAsFactors = FALSE, header = TRUE,na.strings = '?', 
            colClasses = c("character", "character","numeric", "numeric",
                        "numeric", "numeric", "numeric", "numeric", "numeric"))
    # convert Date col character strings to Date class
    dfrm$Date <- dmy(dfrm$Date)
    # subset by desired date range
    newframe <- subset(dfrm, dfrm$Date >= "2007-02-01" & dfrm$Date < "2007-02-03")
    #DateTime column for plotting
    cols <- c("Date", "Time")
    newframe$datetime <- do.call(paste, c(newframe[cols], sep=" "))
    newframe$datetime <- ymd_hms(newframe$datetime, tz = "")
    # open graphics device
  # open graphics device
  png(filename = "Plot4.png", width = 480, height = 480)
  # set params for plots as 2 by 2
  par(mfrow = c(2,2))
  #upper left plot
  plot(newframe$Global_active_power, type = "l", xlab = "", xaxt="n",
       ylab = "Global Active Power")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks
  #upper right plot
  plot(newframe$Voltage, type = "l", xaxt="n", xlab = "datetime", ylab = "Voltage")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks
  #lower left plot
  plot(newframe$Sub_metering_1,type = "n", xaxt="n", xlab = "", ylab = "Energy sub metering")
  lines(newframe$Sub_metering_1, type = "l")
  lines(newframe$Sub_metering_2, type = "l", col = "red")
  lines(newframe$Sub_metering_3, type = "l", col = "blue")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = 1 , lwd = 1, bty ="n" )
  #lower right plot
  plot(newframe$Global_reactive_power, type = "l", xaxt="n",
       xlab = "datetime", ylab ="Global_reactive_power")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks
  #close graphics device
  dev.off()
  
  }