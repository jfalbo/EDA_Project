  ### plot 2 
  # 
  hs_pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
  hs_pwr$Date <- as.Date(hs_pwr$Date, format = ("%d/%m/%Y"))
  
 
  
  pwr_data <- subset(hs_pwr, Date >= "2007-02-01" & Date <= "2007-02-02")
 
  DT <- paste(as.Date(pwr_data$Date), pwr_data$Time)
  pwr_data$DT <- as.POSIXct(DT)
  
  png("plot2.png", height = 480, width = 480)
  
  plot(pwr_data$Global_active_power ~ pwr_data$DT, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
  
  dev.off()
  