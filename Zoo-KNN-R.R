table(Zoo$animal.name)

prop.table(table(Zoo$animal.name))*100

##zoo$animal.name<-factor(zoo$animal.name,levels=c("B","M"),labels=c("Benign","Malignant"))

round(prop.table(table(Zoo$animal.name))*100,digits = 1)

#normalization
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}

#normalize
Zoo_n<-as.data.frame(lapply(Zoo[2:18],normalize))

Zoo_n1<-cbind(Zoo_n,Zoo$animal.name)


#test normalization
normalize(c(1,2,3,4,5))
normalize(c(10,20,30,40,50))

##create training and test datasets 
Zoo_train<-Zoo_n[1:81,]
Zoo_test<-Zoo_n[82:101,]


#Get labels for training and test datasets
Zoo_train_labels<-Zoo[1:81,18]
Zoo_test_labels<-Zoo[82:101,18]

#training models on the data
#install.packages("class")
library(class)

#install.packages("gmodels")
library(gmodels)


# declaration to initiate for loop
test_acc <- NULL
train_acc <- NULL
for (i in seq(2,80,4))
{
  train_Zoo_pred<-knn(train = Zoo_train,test = Zoo_train, cl=Zoo_train_labels,k=i)
  train_acc<-c(train_acc,mean(train_Zoo_pred==Zoo_train_labels))
  test_Zooo_pred<-knn(train = Zoo_train,test =Zoo_test,cl=Zoo_train_labels,k=i)
  test_acc<-c(test_acc,mean(test_Zooo_pred==Zoo_test_labels))
}



par(mfrow=c(1,2)) # c(1,2) => indicates 1 row and 2 columns
plot(seq(2,80,4),train_acc,type="l",main="Train_accuracy",col="blue")
plot(seq(2,80,4),test_acc,type="l",main="Test_accuracy",col="red")

acc_neigh_df <- data.frame(list(train_acc=train_acc,test_acc=test_acc,neigh=seq(2,80,4)))

#install.packages("ggplot2")
library(ggplot2)
ggplot(acc_neigh_df,aes(x=neigh))+
  geom_line(aes(y=train_acc,colour="train_acc"),lwd=1.5)+
  geom_line(aes(y=test_acc,colour="test_acc"),lwd=1.5)+
  scale_fill_manual(" ",breaks=c("train_acc","test_acc"),values = c("train_acc"="green","test_acc"="red"))

#K-25 
zoo_pred <- knn(train = Zoo_train, test = Zoo_test, cl = Zoo_train_labels, k=25)
zoo_pred
plot(zoo_pred, type="b", xlab="K- Value",ylab="Accuracy level")




wss<-c(zoo_pred)
plot(wcss)
elbowPoint_info = getelbow====t(x_values = nb_clusters, y_values = wcss_values)
