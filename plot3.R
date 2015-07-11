plot3 <- function() {
  library(lubridate)
  # read in data
  dfrm <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE,na.strings = '?' ,colClasses = c("character", "character","numeric", "numeric","numeric", "numeric", "numeric", "numeric"))
  # convert Date character strings to POSIX
  dfrm$Date <- dmy(dfrm$Date)
  # subset by desired date range
  newframe <- subset(dfrm, dfrm$Date >= "2007-01-31" & dfrm$Date < "2007-02-02")
  # combine Date and Time in new column for plotting
  newframe <- mutate(newframe, dt = paste(Date, Time, sep =" "))
  #convert dt to POSIX
  newframe$dt <- ymd_hms(newframe$dt)
  # open graphics device
  png(filename = "Plot3.png", width = 480, height = 480)
  # create plot
  plot(newframe$dt, newframe$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
  lines(newframe$dt, newframe$Sub_metering_1, type = "l")
  lines(newframe$dt, newframe$Sub_metering_2, type = "l", col = "red")
  lines(newframe$dt, newframe$Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1 ,lwd= 1 )
  # close graphics device
  dev.off()
  
  }