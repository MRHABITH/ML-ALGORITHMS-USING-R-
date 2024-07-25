# Decision Tree Regression

# Importing the dataset
dataset = read.csv("D:\\Data Set\\Position_Salaries.csv")
dataset = dataset[2:3]

# Fitting Decision Tree Regression to the dataset
# install.packages('rpart')

?rpart
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 6))

#The control parameter sets the minimum number of data points required
#to split a node in the tree (minsplit = 6).
# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, data.frame(Level = 6))
y_pred
# Plotting the tree
plot(regressor)
text(regressor)
# Visualising the Decision Tree Regression results (higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Decision Tree Regression') +
  xlab('Level') +
  ylab('Salary')
