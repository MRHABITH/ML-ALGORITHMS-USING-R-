# Random Forest Regression


# Importing the dataset
dataset = read.csv("D:\\Data Set\\Position_Salaries.csv")
dataset = dataset[2:3]
# Fitting randomForest Regression to the dataset
# install.packages('rpart')
library(randomForest)
set.seed(12345)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 13)

#ntree -> The number of trees in the ensemble
# Predicting a new result with Random forest Regression
y_pred = predict(regressor, data.frame(Level = 6))
y_pred

# Visualising the Random forest Regression results (higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Random forest Regression') +
  xlab('Level') +
  ylab('Salary')







