data = read.csv("D:\\Data Set\\mba.csv")

View(data)

#99,95,93

#Z distribution (population Detail)
meanz = mean(data$workex)
meanz 
sdz = sd(data$workex)
sdz 
lenz = length(data$workex)
lenz 


zerror=qnorm(0.90)*sdz/sqrt(lenz)
ZupperCI = meanz+zerror# upper confidence intervel
ZupperCI
ZlowerCI = meanz-zerror#lower confidence intervel
ZlowerCI

##T distribution

library(caTools)
set.seed(123) #random state.
split = sample.split(data$gmat, SplitRatio = 0.7)
train = subset(data, split == TRUE)
test= subset(data, split == FALSE)
mean = mean(train$workex)
mean 

sd = sd(train$workex)
sd 
len = length(train$workex)
len 
error = qt(0.95,df=len-1)*sd/sqrt(len)
error 
TupperCI = mean+error
TupperCI
TlowerCI = mean-error
TlowerCI


------------------
  
  
  
  
  
##Probability Distribution##
  
#Normal Distribution
#fixed data
#normal probability
pnorm(84,mean=57,sd=27,lower.tail = T)#above 84 and below 84#cdf

##? have scored above 84.
#density normal dist
dnorm(73,mean=69,sd=4)##pdf
x=seq(-4,4,by=.1)
plot(x)
plot(x,dnorm(x),'b')
#find percentiles in a normal distribution 
qnorm(0,mean = 57,sd = 27,lower.tail = F)#quantile function
b=rnorm(200,mean=57,sd=27)
b
library(tidyverse)

qplot(b,col=I("red"))








#Binomial Distribution#fixed interval
?pbinom
#size is the number of trials
pbinom(6,size =12,prob = 0.50,lower.tail=F) #above 6 and below 6
##?% of chance for getting 6 or less than 6 correct answers

dbinom(4,size=12,prob =0.25)##?% of chance for getting 4 correct answers.
##qbinom and rbinom
#quantile binom
#How many head will have a prob of 0.25 when a toss is done for 51 times
qbinom(0.25,51,0.5)
?qbinom
#Find 8 random values from a sample of 12 with prob of 0.5
rbinom(8,12,0.5)
##Poisson Distribution##fixed time
?ppois
ppois(12,lambda = 10,lower.tail = T)
#lambda - mean
#7 events
dpois(7,lambda = 10)#exact
#quantile
qpois(0.25,lambda = 10,lower.tail = T)
rpois(8,lambda = 10)


##Skweness
##import package = e1071
library(e1071)
data = read.csv("D:\\Data Set\\mba.csv")
exp = data$workex
ss=skewness(exp) 
ss
exp
me=mean(exp)
mo=table(exp)
sd=sd(exp)
sk=(me-mo)/sd
sk
mean(sk)
##Kurtosis
exp = data$workex
kurtosis(exp)
############################################################################################################################################################
