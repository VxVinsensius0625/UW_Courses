sd_population <- function(v) {
  sum_difference = var(v)
    #sum((v-mean(v))^2)
  N = length(v)
  sig = sqrt(sum_difference*(N-1)/N)
  return(sig)
}
### 1

geyser_dat = datasets::faithful

mean_wait = mean(geyser_dat$waiting)
mean_erup = mean(geyser_dat$eruptions)

wait_dat = geyser_dat$waiting
sd_wait = sd_population( geyser_dat$waiting)
sd_erup = sd_population(geyser_dat$eruptions)

hist(geyser_dat$eruptions,main = "Histogram of Eruption time(Vinsensius)" 
     ,ylim = c(0,55),xlab = "Eruption time(mins)")
abline(v = mean(geyser_dat$eruptions),                # Add vertical line
       col = "red",            # Modify color
       lty = "dashed",         # Modify line type
       lwd = 5)                # Modify thickness
abline(v = median(geyser_dat$eruptions),                # Add vertical line
       col = "blue",            # Modify color
       lty = "dashed",         # Modify line type
       lwd = 5)                # Modify thickness
hist(geyser_dat$waiting,main = "Histogram of Waiting time for eruption(Vinsensius)" 
     ,ylim = c(0,55),xlab = "Waiting time(mins)")
abline(v = mean(geyser_dat$waiting),                # Add vertical line
       col = "red",            # Modify color
       lty = "dashed",         # Modify line type
       lwd = 5)                # Modify thickness
abline(v = median(geyser_dat$waiting),                # Add vertical line
       col = "blue",            # Modify color
       lty = "dashed",         # Modify line type
       lwd = 5)                # Modify thickness
set.seed(321)
sample_wait = sample(geyser_dat$waiting,45)
mean_sample_wait = mean(sample_wait)
sd_sample_wait = sd(sample_wait)
z_score_sample_mean = (mean_sample_wait-mean_wait)/sd_sample_wait
SE_error = sd_wait/sqrt(45)
ans_1f = (mean_sample_wait - mean_wait)/SE_error
#1g
ans_1g_1 = pnorm(mean_sample_wait+0.5,
                 mean = mean_wait,sd= sd_wait/sqrt(45)) -
  pnorm(mean_sample_wait-0.5,
        mean = mean_wait,sd= sd_wait/sqrt(45))

## 
# for 1g part 2,use upper limit qnorm(0.8,sample distribution statistics)
# lower limit qnorm(0.2,sample distribution stats)
upper_limit_1g_2=qnorm(0.8,mean_wait,SE_error)
lower_limit_1g_2=qnorm(0.2,mean_wait,SE_error)
#rm(list = ls(all.names = TRUE)) # remove all variables 
### 2
#rm(list = ls(all.names = TRUE))
hearing <- read.csv(file="Hearing_data.csv")
mean_prob_correct = mean(hearing$Correct)/200

sd_expected = sqrt(mean_prob_correct*200*(1-mean_prob_correct))
mean_expected = mean_prob_correct*200
P_40_60 = pnorm(60.5,mean_expected,sd_expected) - pnorm(39.5,mean_expected,sd_expected)

### 3
nat_parks <- read.csv(file="nationalparks_images.csv")
nat_parks_yes = nat_parks[nat_parks$NatPark == 'Y',]
nat_parks_no = nat_parks[nat_parks$NatPark != 'Y',]
nat_parks_yes_wildlife = sum(nat_parks_yes$Wildlife > 0 )
nat_parks_no_wildlife = sum(nat_parks_no$Wildlife > 0 )

p_hat_nat_park_wildlife = nat_parks_yes_wildlife/length(nat_parks_yes$Wildlife)
p_hat_non_park_wildlife = nat_parks_no_wildlife/length(nat_parks_no$Wildlife)

expected_mean_park = p_hat_nat_park_wildlife*NROW(nat_parks_yes)
expected_mean_non_park = p_hat_non_park_wildlife*NROW(nat_parks_no)
z_star = abs(qnorm(0.05))
SE_park = sqrt(p_hat_nat_park_wildlife*(1- p_hat_nat_park_wildlife)/NROW(nat_parks_yes))
E_park = SE_park*z_star

SE_non_park = sqrt(p_hat_non_park_wildlife*(1- p_hat_non_park_wildlife)/NROW(nat_parks_no))
E_non_park = SE_non_park*z_star
###

