# Simple Linear Regression


dataset<- read.csv("D:\\Data Set\\Salary_Data.csv")



View(dataset)



# install.packages('caTools')

library(caTools)# data splitting

set.seed(1234)#random state
split = sample.split(dataset, SplitRatio = 0.70)# $-get the spesific column name  
training_set = subset(dataset, split == TRUE)#70%#subset for spesific data
test_set = subset(dataset, split == FALSE)#30%
#caTools is for the spliting process


# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~  YearsExperience,data = training_set)

summary(regressor)

#regressor -> Trained model
#lm-> linear model

#residual -> actual vs pridected data
# *** 0 error
#' '  10% error

#RSE 19 time (lines ) get the answer iam getting the accuracy
# F-statistic :how much deviation 
# p ?



#B0 intercept,C
coef(regressor)#B1 or slop,M
yy=(9285.472*1.1)+25845.924# y = Mx+c

yy


# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set[-2])# here the -2 for accessing
test_set[-2]
View(y_pred)


#new Data

dat=data.frame(YearsExperience=c(1.2,1.8,1.9))#unstractured data to stracture 

dat


predict(regressor, newdata = dat)






# Visualising the Training set results
library(ggplot2) #this is for linear regression
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, 
                                                              newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = test_set$YearsExperience, y = predict(regressor, 
                                                              newdata = test_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')
