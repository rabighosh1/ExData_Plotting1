plot3 <- function(directory) {
  
  library(sqldf)
  library(lubridate)

# in the directory parameter specify where your data file is

  filedirectory <- paste0(directory,"/")
  filename <- paste0(filedirectory,"household_power_consumption.txt")

# Read only the data for dates 1/2/2007 and 2/2/2007
  
  powerData <- read.csv.sql(filename, sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

#convert date and time column

  powerData$dtm <- dmy_hms(paste (powerData$Date,powerData$Time))

  png(filename="plot3.png",width = 480, height = 480, units = "px")
 
  plot(powerData$dtm,powerData$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering",col="black")

  points(powerData$dtm,powerData$Sub_metering_3,type="l",xlab="",ylab="",col="blue")

  points(powerData$dtm,powerData$Sub_metering_2,type="l",xlab="",ylab="",col="red")

  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))

  dev.off()
}
