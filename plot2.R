plot2 <- function(directory) {
  
  library(sqldf)
  library(lubridate)

# in the directory parameter specify where your data file is

  filedirectory <- paste0(directory,"/")
  filename <- paste0(filedirectory,"household_power_consumption.txt")

# Read only the data for dates 1/2/2007 and 2/2/2007
  
  powerData <- read.csv.sql(filename, sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

# convert date time field

  powerData$dtm <- dmy_hms(paste (powerData$Date,powerData$Time))

  png(filename="plot2.png",width = 480, height = 480, units = "px")
 
  plot(powerData$dtm,powerData$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")

  dev.off()
}
