help("princomp")


data <- wine[,-1]



cor(data)
# cor = TRUE use correlation matrix for getting PCA scores
?princomp
pcaObj<-princomp(data, cor = TRUE, scores = TRUE, covmat = NULL)
str(pcaObj)
summary(pcaObj)
#str(pcaObj)
loadings(pcaObj)
plot(pcaObj)
biplot(pcaObj)
screeplot(pcaObj)



###Cluster Analysis - All Variables
library(cluster)
library(NbClust)
no_of_Clusters = NbClust(data, distance = "euclidean", min.nc = 2, max.nc = 10, method = "complete", index ="all")

###Optimal number of clusters is  7 
d<-dist(data,method="euclidean")
fit<-hclust(d,method="complete")
groups<-cutree(fit, k=7)

View(clusters)


plot(cumsum(pcaObj$sdev*pcaObj$sdev)*100/(sum(pcaObj$sdev*pcaObj$sdev)),type="b")


pcaObj$scores[,1:3] # Top 3 PCA Scores which represents the whole data
wine<-cbind(wine,pcaObj$scores[,1:3])
View(wine)

# preparing data for clustering (considering only pca scores as they represent the entire data)
clus_data<-wine[,15:17]


# Normalizing the data 
norm_clus<-scale(clus_data) # Scale function is used to normalize data
dist1<-dist(norm_clus,method = "euclidean") # method for finding the distance
# here I am considering Euclidean distance



# Clustering the data using hclust function --> Hierarchical
fit1<-hclust(dist1,method="average") # method here is complete linkage

plot(fit1) # Displaying Dendrogram

groups<-cutree(fit1,6) # Cutting the dendrogram for 6 clusters

membership_1<-as.matrix(groups) # cluster numbering 

View(membership_1)

final1<-cbind(membership_1,wine) # binding column wise with orginal data
View(final1)
