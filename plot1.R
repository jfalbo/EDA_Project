
# the problem was that the %Y in the date format was lowercase and not capital 
# 
 hs_pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hs_pwr$Date <- as.Date(hs_pwr$Date, format = ("%d/%m/%Y"))
 
review_dates <- subset(hs_pwr, Date >= "2007-02-01" & Date <= "2007-02-02")
 plot1 <- as.numeric(review_dates$Global_active_power)
  