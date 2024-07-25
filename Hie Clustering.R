# Hierarchical Clustering
# Importing the dataset


dataset = read.csv("D:\\Data Set\\Mall.csv")
dataset = dataset[4:5]

library(dendextend)


# Create the dendrogram
dendrogram <- hclust(d = dist(dataset, method = 'euclidean'), method = 'complete')

# Convert to a dendrogram object
dend <- as.dendrogram(dendrogram)

# Color the branches (e.g., 3 clusters)
dend <- color_branches(dend, k = 3)

# Plot the colored dendrogram
plot(dend, main = 'Dendrogram', xlab = 'Customers', ylab = 'Euclidean distances')


# Fitting Hierarchical Clustering to the dataset
hc = hclust(d = dist(dataset,method = 'euclidean'), method = 'complete')
y_hc = cutree(hc, 3)





# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_hc,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         labels= 5,
         plotchar = TRUE,
         span = FALSE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')



