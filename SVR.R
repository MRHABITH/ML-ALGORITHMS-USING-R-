# Support Vector Regression
# Importing the dataset

dataset = read.csv("D:\\Data Set\\Position_Salaries.csv")
dataset = dataset[2:3]

#e1071-->>offers additional functions and options for fine-tuning 
# Fitting SVR to the Training set
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression',
                kernel='radial',
                epsilon=0)

#type ->epsilon-support vector regression 
#kernal ->radial basis function (RBF) high dimention
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualising the SV Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('SVR') +
  xlab('Level') +
  ylab('Salary')



