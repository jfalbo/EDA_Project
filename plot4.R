hs_pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hs_pwr$Date <- as.Date(hs_pwr$Date, format = ("%d/%m/%Y"))



pwr_data <- subset(hs_pwr, Date >= "2007-02-01" & Date <= "2007-02-02")

DT <- paste(as.Date(pwr_data$Date), pwr_data$Time)
pwr_data$DT <- as.POSIXct(DT)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#add plot 1 - in top left 
plot(pwr_data$Global_active_power ~ pwr_data$DT, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")

#add second plot 

plot(pwr_data$Voltage~pwr_data$DT, type ="l", ylab = "Voltage", xlab = "datetime")


#add third plot 

plot(pwr_data$Sub_metering_1 ~ pwr_data$DT, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(pwr_data$Sub_metering_2 ~ pwr_data$DT, col = "red")
lines(pwr_data$Sub_metering_3 ~ pwr_data$DT, col = "blue")
legend("topright", legend = legend_text, col = c("black", "red", "blue"), lty = 1, bty = "n")


#add final plot 

plot(pwr_data$Global_reactive_power~pwr_data$DT, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
