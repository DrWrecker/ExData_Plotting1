plot3 <- function() {
  library(lubridate)
  library(dplyr)
  # read in data
  dfrm <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE,na.strings = '?' ,colClasses = c("character", "character","numeric", "numeric","numeric", "numeric", "numeric", "numeric", "numeric"))
  # convert Date col character strings to Date class
  dfrm$Date <- dmy(dfrm$Date)
  # subset by desired date range
  newframe <- subset(dfrm, dfrm$Date >= "2007-02-01" & dfrm$Date < "2007-02-03")
  #DateTime column for plotting
  cols <- c("Date", "Time")
  newframe$datetime <- do.call(paste, c(newframe[cols], sep=" "))
  newframe$datetime <- ymd_hms(newframe$datetime, tz = "")
  # open graphics device
  png(filename = "Plot3.png", width = 480, height = 480)
  # create plot
  plot(newframe$Sub_metering_1,type = "n", xaxt="n", xlab = "", ylab = "Energy sub metering")
  lines( newframe$Sub_metering_1, type = "l")
  lines( newframe$Sub_metering_2, type = "l", col = "red")
  lines( newframe$Sub_metering_3, type = "l", col = "blue")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1 ,lwd= 1 )
  # close graphics device
  dev.off()
  
  }