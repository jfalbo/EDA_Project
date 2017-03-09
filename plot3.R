#Plot 3 

 
hs_pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hs_pwr$Date <- as.Date(hs_pwr$Date, format = ("%d/%m/%Y"))



pwr_data <- subset(hs_pwr, Date >= "2007-02-01" & Date <= "2007-02-02")

DT <- paste(as.Date(pwr_data$Date), pwr_data$Time)
pwr_data$DT <- as.POSIXct(DT)

#xyplot(x ~ y + z, data=df, type = c('l','l'), col = c("blue", "red"), auto.key=T)
xyplot( pwr_data$Sub_metering_1 + pwr_data$Sub_metering_2 + pwr_data$Sub_metering_3 ~ pwr_data$DT, data = pwr_data, type = c("l", "l"), col= c("black", "red", "blue"), scales = list(y = list(limits=c(-1, 40))))
