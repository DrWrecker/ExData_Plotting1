plot1 <- function() {
  library(lubridate)
  #read in data & specify column classes
  dfrm <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE,na.strings = '?' ,colClasses = c("character", "character","numeric", "numeric","numeric", "numeric", "numeric", "numeric"))
  #convert Date character strings to POSIXct
  dfrm$Date <- dmy(dfrm$Date)
  #subset by date range
  newframe <- subset(dfrm, dfrm$Date >= "2007-02-01" & dfrm$Date < "2007-02-03")
  #open device to contain plot output
  png(filename = "Plot1.png", width = 480, height = 480)
  #plot graph
  hist(newframe$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  axis(2,c(0,200,400,600,800,1000,1200))
  #close device
  dev.off()
  
  }