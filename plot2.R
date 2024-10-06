plot2 <- function() {
  library(lubridate)
  library(dplyr)
  # read in data
  dfrm <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE,na.strings = '?' ,colClasses = c("character", "character","numeric", "numeric","numeric", "numeric", "numeric", "numeric"))
  # convert Date col character strings to Date class
  dfrm$Date <- dmy(dfrm$Date)
  # subset by desired date range
  newframe <- subset(dfrm, dfrm$Date >= "2007-02-01" & dfrm$Date < "2007-02-03")
  #DateTime column for plotting
  cols <- c("Date", "Time")
  newframe$datetime <- do.call(paste, c(newframe[cols], sep=" "))
  newframe$datetime <- ymd_hms(newframe$datetime, tz = "")
  # open device
  png(filename = "Plot2.png", width = 480, height = 480)
  # create plot without x-axis ticks
  plot(newframe$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xaxt="n", xlab="")
  axis(1, at=c(1,1441,2881), lab=c("Thu","Fri", "Sat")) #add x-axis ticks

  # close device
  dev.off()
  
  }