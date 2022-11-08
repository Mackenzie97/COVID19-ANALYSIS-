rm(list = ls())# removes all variables stored previously
library(Hmisc)# import


data <- read.csv("C:/Users/USER/Desktop/covid_R/COVID19_line_list_data.csv")
describe (data)# Hmisc command

# Cleaned up the death column
data$death_dummy <- as.integer(data$death !=0)

#death rate
sum(data$death_dummy) / nrow(data)
# Age
# Claim: people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)

mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# is this statisticaly significant or does it add up

t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.99)


# GENDER
# Claim: GENDER HAS NO EFECT
men = subset(data, gender == "male")
women = subset(data, gender == "female")

mean(men$age, na.rm = TRUE)   # 8.5%
mean(women$age, na.rm = TRUE) # 3.7%

# Is this statisticaly significant??

t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.99)


# from the analysis i can conclude that men have a higher fatality rate than women
# From 0.8% to 8.8% higher cf dying

# From the P-value = 0.002 < 0.05; i can conclude that this is statisticaly significant from the population data.
