plot2 <- function(){
	if(!file.exists("exdata_data_household_power_consumption.zip")) {
        tempFile <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempFile)
        file <- unzip(tempFile)
        unlink(tempFile)
	}
	plot2Data <- read.table(file, header=T, sep=";")
	plot2Data$Date <- as.Date(plot2Data$Date, format="%d/%m/%Y")
	p2D <- plot2Data[(plot2Data$Date=="2007-02-01") | (plot2Data$Date=="2007-02-02"),]
	p2D$Global_active_power <- as.numeric(as.character(p2D$Global_active_power))
	p2D <- transform(p2D, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
	png("plot2.png",height =480, width=480)
	plot(p2D$timestamp,p2D$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
      dev.off()
}