###### Qn 1
med_data <- read.csv(file = "anesthetic.csv")
summary(med_data)
#med_sort <- med_data[order(med_data$group),]
med_dat1 <- med_data[med_data$group==1,]
summary(med_dat1)
sd1 <- sd(med_dat1$onset_sensory)
CV1 <-  sd(med_dat1$onset_sensory)/mean(med_dat1$onset_sensory)
decile1 <- quantile(med_dat1$onset_sensory, probs = seq(.1, .9, by = .1))
zscore1_20 <- (20 - mean(med_dat1$onset_sensory))/sd(med_dat1$onset_sensory)
lower_lim1sd = mean(med_dat1$onset_sensory)- sd(med_dat1$onset_sensory)
upper_lim1sd = mean(med_dat1$onset_sensory)+ sd(med_dat1$onset_sensory)
prop1sd_dat1 = sum(med_dat1$onset_sensory >lower_lim1sd & med_dat1$onset_sensory <upper_lim1sd)/
  nrow(med_dat1)
lower_lim2sd = mean(med_dat1$onset_sensory)- 2*sd(med_dat1$onset_sensory)
upper_lim2sd = mean(med_dat1$onset_sensory)+ 2*sd(med_dat1$onset_sensory)
prop2sd_dat1 = sum(med_dat1$onset_sensory >lower_lim2sd & med_dat1$onset_sensory <upper_lim2sd)/
  nrow(med_dat1)
zscore =  (med_dat1$onset_sensory- mean(med_dat1$onset_sensory))/sd(med_dat1$onset_sensory)
tot1sd = sum(abs(zscore)<1)
prop1sd_dat11 = tot1sd/length(zscore)
##
med_dat2 <- med_data[med_data$group==2,]
summary(med_dat2)
sd2 <- sd(med_dat2$onset_sensory)
CV2 <-  sd(med_dat2$onset_sensory)/mean(med_dat2$onset_sensory)
decile2 <- quantile(med_dat2$onset_sensory, probs = seq(.1, .9, by = .1))
zscore2_20 <- (20 - mean(med_dat2$onset_sensory))/sd(med_dat2$onset_sensory)
lower_lim1sd_dat2 = mean(med_dat2$onset_sensory)- sd(med_dat2$onset_sensory)
upper_lim1sd_dat2 = mean(med_dat2$onset_sensory)+ sd(med_dat2$onset_sensory)
prop1sd_dat2 = sum(med_dat2$onset_sensory >lower_lim1sd_dat2 & 
                     med_dat2$onset_sensory <upper_lim1sd_dat2)/nrow(med_dat2)
lower_lim2sd_dat2 = mean(med_dat2$onset_sensory)- 2*sd(med_dat2$onset_sensory)
upper_lim2sd_dat2 = mean(med_dat2$onset_sensory)+ 2*sd(med_dat2$onset_sensory)
prop2sd_dat2 = sum(med_dat2$onset_sensory >lower_lim2sd_dat2 & 
                     med_dat2$onset_sensory <upper_lim2sd_dat2)/nrow(med_dat2)
summary(med_dat2)
## Plot 
boxplot(med_data$onset_sensory ~ med_data$treatment,
        main= 'Anesthetics Response Time based on group (Vinsensius)',xlab = 'group', 
        ylab = 'Anesthetics Response Time(mins)')

###### Qn 2
eye_data <- read.csv(file = "QSCI381Eyes.csv")
table_con <-addmargins(table(eye_data$eye, eye_data$side))
table_con

