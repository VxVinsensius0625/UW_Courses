### Question 2
exdays<-c(14,9,17,11,17,12,13,12,7,5,18,6,14,12,17,13,16,20,1,15,7,2,
          4,21,8)

av = mean(exdays)
variance = var(exdays)
summary(exdays)
hist(exdays)
modes = mode(exdays)
# 2e 
P_5days_outof_14days = dbinom(x=5,size=14,prob = 0.554)
# 2f
P_lessthan11days_outof_14days = 1- sum(dbinom(x=11:14,size=14,prob = 0.554))
### Question 3
hermit_data <- read.csv(file = "hermit.csv", header = T)
hermitbasic <- hermit_data[hermit_data$pH>7,]
hermitacid = hermit_data[hermit_data$pH<=7,]
hermitbasic_shell = sum(hermitbasic$Shell == 'yes')
hermitacid_shell = sum(hermitacid$Shell == 'yes')
# 3c
P_basic_shell_atleast15 = sum(dbinom(15:30,30,prob = 36/57))
P_acid_shell_atleast15 = sum(dbinom(15:30,30,prob = 19/56))
