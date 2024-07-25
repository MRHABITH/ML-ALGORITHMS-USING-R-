# Multiple Linear Regression
# Importing the dataset


dataset = read.csv("D:/Data Set/50_Startups.csv")

# factor Encoding categorical data

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')

library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,
               data = training_set)# except profit other are my independent

summary(regressor)


# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


y_pred


