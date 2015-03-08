plot1 <- function(){
	if(!file.exists("exdata_data_household_power_consumption.zip")) {
      	  tempFile <- tempfile()
	        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempFile)
      	  file <- unzip(tempFile)
	        unlink(tempFile)
	}
	plot1Data <- read.table(file, header=T, sep=";")
	plot1Data$Date <- as.Date(plot1Data$Date, format="%d/%m/%Y")
	plot1DataFinal <- plot1Data[(plot1Data$Date=="2007-02-01") | (plot1Data$Date=="2007-02-02"),]
	plot1DataFinal$Global_active_power <- as.numeric(as.character(plot1DataFinal$Global_active_power))
	png("plot1.png",width=480,height=480)
	hist(plot1DataFinal$Global_active_power,col='RED',main= ("Global Active Power"),xlab="Global Active Power (kilowatts)",ylab="Frequency")
	dev.off()
}
