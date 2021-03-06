library(data.table)
data_1 <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings = NA,stringsAsFactors = FALSE)
TT <- subset(data_1,Date=="1/2/2007")
TU <- subset(data_1,Date=="2/2/2007")
TTU <- rbind(TT,TU)
TTU$Global_active_power <- as.numeric(TTU$Global_active_power)
TTU$Sl <- c(1:nrow(TTU))
png(filename = "Plot2.png")
plot(TTU$Sl,TTU$Global_active_power,type = "n",xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(TTU$Sl,TTU$Global_active_power)
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()
