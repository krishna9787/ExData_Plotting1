plot3 <- function(){
	if(!file.exists("exdata_data_household_power_consumption.zip")) {
        tempFile <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempFile)
        file <- unzip(tempFile)
        unlink(tempFile)
	}
	plot2Data <- read.table(file, header=T, sep=";")
	plot2Data$Date <- as.Date(plot2Data$Date, format="%d/%m/%Y")
	p2D <- plot2Data[(plot2Data$Date=="2007-02-01") | (plot2Data$Date=="2007-02-02"),]
	p2D$Sub_metering_1 <- as.numeric(as.character(p2D$Sub_metering_1))
	p2D$Sub_metering_2 <- as.numeric(as.character(p2D$Sub_metering_2))
	p2D$Sub_metering_3 <- as.numeric(as.character(p2D$Sub_metering_3))
	p2D <- transform(p2D, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
	png("plot3.png",height =480, width=480)
	plot(p2D$timestamp,p2D$Sub_metering_1, col="black",type="l", xlab="", ylab="Energy Sub metering", main="Energy Sub metering")
      lines(p2D$timestamp,p2D$Sub_metering_2,col="red")
      lines(p2D$timestamp,p2D$Sub_metering_3,col="blue")
	legend("topright", col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
      dev.off()
}