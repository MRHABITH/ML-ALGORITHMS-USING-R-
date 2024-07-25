# Kernel PCA
#D:\Data Set\Social_Network_Ads.csv
# Importing the dataset

dataset = read.csv("D:\\Data Set\\Social_Network_Ads.csv")
dataset = dataset[, 3:5]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

# Applying Kernel PCA
# install.packages('kernlab')
library(kernlab)

help(kpca)
#radial basis function (RBF) kernel
kpca = kpca(~., data = training_set[-3], kernel = 'rbfdot', features = 2)

training_set_pca = as.data.frame(predict(kpca, training_set))

training_set_pca$Purchased = training_set$Purchased

test_set_pca = as.data.frame(predict(kpca, test_set))
test_set_pca$Purchased = test_set$Purchased

# Fitting Logistic Regression to the Training set


classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set_pca)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set_pca[-3])
y_pred = ifelse(prob_pred > 0.5, 1, 0)
# Making the Confusion Matrix
cm = table(test_set_pca[, 3], y_pred)
cm
Accuracy=sum(diag(cm)/sum(cm))
Accuracy
# Visualising the Training set results

library(ggplot2)

set <- training_set_pca
X1 <- seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.1)
X2 <- seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.1)
grid_set <- expand.grid(X1, X2)
colnames(grid_set) <- c('V1', 'V2')
prob_set <- predict(classifier, type = 'response', newdata = grid_set)
y_grid <- ifelse(prob_set > 0.5, 1, 0)

# Create data frames for plotting
plot_data <- data.frame(PC1 = set[, 1], PC2 = set[, 2], Class = factor(set[, 3]))
grid_data <- data.frame(PC1 = grid_set$V1, PC2 = grid_set$V2, Prob = prob_set, Class = factor(y_grid))

# Create the plot using ggplot2
ggplot() +
  geom_point(data = plot_data, aes(x = PC1, y = PC2, color = Class), size = 2) +
  geom_contour(data = grid_data, aes(x = PC1, y = PC2, z = Prob), breaks = 0.5, color = "black", linetype = "solid") +
  scale_color_manual(values = c("green4", "red3")) +
  labs(title = 'Logistic Regression (Training set)', x = 'PC1', y = 'PC2') +
  theme_minimal()



