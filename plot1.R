plot1 <- function(directory) {
  
  library(sqldf)

# in the directory parameter specify where your data file is

  filedirectory <- paste0(directory,"/")
  filename <- paste0(filedirectory,"household_power_consumption.txt")

# Read only the data for dates 1/2/2007 and 2/2/2007
  
  powerData <- read.csv.sql(filename, sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')
  
  png(filename="plot1.png",width = 480, height = 480, units = "px")

  attach(powerData)
  
  hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

  dev.off()
}
