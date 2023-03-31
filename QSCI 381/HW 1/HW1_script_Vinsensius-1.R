# to upload the data
library(readr)
BirdMove_csv <- read_csv("BirdMove.csv")
#View(BirdMove_csv)

bird_id <- c("BirdMove_csv$BirdID_1","BirdMove_csv$BirdID_2","BirdMove_csv$BirdID_3")
### 1
sd_bird1 <- sd(BirdMove_csv$BirdID_1)
sd_bird2 <- sd(BirdMove_csv$BirdID_2)
sd_bird3 <- sd(BirdMove_csv$BirdID_3)

CV_bird1 <- round((mean(BirdMove_csv$BirdID_1)/sd(BirdMove_csv$BirdID_1))^(-1),2)
CV_bird2 <-  round((mean(BirdMove_csv$BirdID_2)/sd(BirdMove_csv$BirdID_2))^(-1),2)
CV_bird3 <-  round((mean(BirdMove_csv$BirdID_3)/sd(BirdMove_csv$BirdID_3))^(-1),2)

range_bird1 <- max(BirdMove_csv$BirdID_1) - min(BirdMove_csv$BirdID_1)
range_bird2 <- max(BirdMove_csv$BirdID_2) - min(BirdMove_csv$BirdID_2)
range_bird3 <- max(BirdMove_csv$BirdID_3) - min(BirdMove_csv$BirdID_3)

sum <- data.frame(unclass(summary(BirdMove_csv)),check.names = FALSE)
#unclass(summary(data)),  # Convert summary to data frame
#check.names = FALSE
BirdMove_csv$date <- as.Date(BirdMove_csv$date, format="%d/%m/%Y")

### 2a & 2b
plot(BirdMove_csv$date,BirdMove_csv$BirdID_2,type = "l" , col="blue",
     xlab = "Date", ylab ="Daily travel distance (km)", 
     main = "Plot daily distance travel in 2019 (Vinsensius)" , ylim = c(0,250), lwd = 2)

lines(BirdMove_csv$date,BirdMove_csv$BirdID_3,type = "l" , col="black", lwd=2)

legend("topright",legend=c("BirdID_2", "BirdID_3"), col=c("blue","black"),
       lty=1, ncol = 1)


### 3b
num_row = NROW(BirdMove_csv$BirdID_1)
sturge_bin_width = range_bird1/(1+1.44*log(num_row))
class_width = round(sturge_bin_width)
bins <- seq(0,max(BirdMove_csv$BirdID_1),class_width)
bin_midval <-  seq( 0+ class_width/2,
                    max(BirdMove_csv$BirdID_1)-class_width/2,class_width)
freq_dist <- cut(BirdMove_csv$BirdID_1,bins)
table_freq_dist <- data.frame(table(freq_dist))
table_freq_dist$midpt <- bin_midval

#write_csv(table_freq_dist,"freq_table.csv")
### 3c
hist(BirdMove_csv$BirdID_1, xlim = range(0,180),ylim = c(0,55), 
     main = "Histogram of BirdID_1 travel distance (Vinsensius)" 
     ,xlab = "Distance Travel(km)")

