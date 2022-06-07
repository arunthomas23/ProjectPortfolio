rm(list = ls())#removes all variables strored pervously
library(Hmisc)#import


data <- read.csv("C:/Users/arunt/Desktop/Project/project 1/R-programming/COVID19_R.csv")
describe(data) #Hmisc Command


#cleaned up death column
data$death_dummy<- as.integer(data$death_dummy !=0)

#death rate

sum(data$death_dummy) /nrow(data)
 
#Age 
#Claim:people who die are older

dead = subset(data,death_dummy == 1)
alive = subset(data,death_dummy == 0)

mean(dead$age,na.rm= TRUE)
mean(alive$age,ra.rm = TRUE)

#is this statifically Significant?

t.test(alive$age,dead$age,alternative = "two.sided",conf.level = 0.95)

#normally , if p-value <0.5 , we reject null hypothesis
#here, p-Value ~0,so we reject the null hypothesis and 
#conclude that this is statistically significant


#Gender 
#Claim:dender has no effect

men = subset(data,gender == "male")
women = subset(data,gender == "female")

mean(men$death_dummy,na.rm= TRUE)
mean(women$death_dummy,ra.rm = TRUE)

#is this statifically Significant?

t.test(men$death_dummy,women$death_dummy,alternative = "two.sided",conf.level = 0.99)

#99% confidence ;men have from 0.8% to 8.5% higher chance of dying
#p-value= .002<.05,  so this statistically significant


