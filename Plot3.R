library(data.table)
data_1 <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings = NA,stringsAsFactors = FALSE)
TT <- subset(data_1,Date=="1/2/2007")
TU <- subset(data_1,Date=="2/2/2007")
TTU <- rbind(TT,TU)
TTU$Global_active_power <- as.numeric(TTU$Global_active_power)
TTU$Sl <- c(1:nrow(TTU))
png(filename = "Plot3.png")
TTU$Sub_metering_1 <- as.numeric(TTU$Sub_metering_1)
TTU$Sub_metering_2 <- as.numeric(TTU$Sub_metering_2)
plot(TTU$Sl,TTU$Sub_metering_1,type="n",xaxt="n",,xlab="",ylab="Energy sub metering")
lines(TTU$Sl,TTU$Sub_metering_1)
lines(TTU$Sl,TTU$Sub_metering_2,col="red")
lines(TTU$Sl,TTU$Sub_metering_3,col="blue")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend(x=1850,y=39,legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"),col=c("black","red","blue"),lty = 1,lwd=1)
dev.off()
