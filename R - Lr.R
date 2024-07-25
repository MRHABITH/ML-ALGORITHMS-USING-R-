# Logistic Regression


# Importing the dataset

 

dataset <- read.csv("D:/Data Set/Social_Network_Ads.csv")


dataset <- dataset[3:5]

dataset$Purchased <- factor(dataset$Purchased, levels = c(0, 1))


# Splitting the dataset into the Training set and Test set

library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)


# Feature Scaling
training_set[-3] <- scale(training_set[-3])


test_set[-3] <- scale(test_set[-3])




# Fitting Logistic Regression to the Training set
#generalized linear models(glm)
# binomial -->binary logistic regression model 

model <- glm(Purchased ~ Age + EstimatedSalary,
             data = dataset, 
             family = "binomial")

# Predicting the Test set results
prob_pred <- predict(model, type = 'response', newdata = test_set)

y_pred <- ifelse(prob_pred > 0.5, 1, 0)

y_pred



#x <- 10
#y <- ifelse(x > 5, "Greater than 5", "Less than or equal to 5")
#print(y)





# Making the Confusion Matrix
cm <- table(test_set[, 3], y_pred)

cm

Accuracy <- sum(diag(cm) / sum(cm))

Accuracy








# Visualising the Training set results

library(caret)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
################################-eve
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)
plot(set[, -3],
     main = 'LG (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

      
######################################################################################

#expand
X1 <- c("A", "B")
X2 <- c(1, 2, 3)

result <- expand.grid(X1, X2)
print(result)




# Example data for x and y axes
x <- seq(-5, 5, length.out = 100)
y <- seq(-5, 5, length.out = 100)

# Create a meshgrid of x and y values
grid <- expand.grid(x = x, y = y)

# Plot the contours without z values
contour(x, y, outer(x, y, function(x, y) x^2 + y^2), main = "Contours of x^2 + y^2")
