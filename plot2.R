plot2 <- function() {
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
  # open device
  png(filename = "Plot2.png", width = 480, height = 480)
  # create plot
  plot(newframe$dt, newframe$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  # close device
  dev.off()
  
  }