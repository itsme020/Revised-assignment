mydata<-crime_data
mydata<-scale(mydata[,2:5])
d<-dist(mydata,method="euclidean")
fit<-hclust(d,method="centroid")
groups<-cutree(fit, k=4)
rect.hclust(fit,k=4, border="red")
clusters=data.frame('crime_data'=mydata[,1],'cluster'=groups)
View(clusters)


mydata<-crime_data
mydata<-scale(mydata[,2:5])
d<-dist(mydata,method="euclidean")
fit<-hclust(d,method="single")
groups<-cutree(fit, k=4)
rect.hclust(fit,k=4, border="red")
clusters=data.frame('crime_data'=mydata[,1],'cluster'=groups)
View(clusters)

mydata<-crime_data
mydata<-scale(mydata[,2:5])
d<-dist(mydata,method="euclidean")
fit<-hclust(d,method="complete")
groups<-cutree(fit, k=3)
rect.hclust(fit,k=3, border="red")
clusters=data.frame('crime_data'=mydata[,1],'cluster'=groups)
View(clusters)
