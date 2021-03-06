#Plot 3 

 
hs_pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hs_pwr$Date <- as.Date(hs_pwr$Date, format = ("%d/%m/%Y"))



pwr_data <- subset(hs_pwr, Date >= "2007-02-01" & Date <= "2007-02-02")

DT <- paste(as.Date(pwr_data$Date), pwr_data$Time)
pwr_data$DT <- as.POSIXct(DT)


png("plot3.png", height = 480, width = 480)
plot(pwr_data$Sub_metering_1 ~ pwr_data$DT, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(pwr_data$Sub_metering_2 ~ pwr_data$DT, col = "red")
lines(pwr_data$Sub_metering_3 ~ pwr_data$DT, col = "blue")
legend("topright", legend = legend_text, col = c("black", "red", "blue"), lty = 1)

dev.off()
