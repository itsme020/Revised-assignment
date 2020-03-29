library(arules)
mymovie<-my_movies[6:15]
class(mymovie)

colnames(mymovie)
#mymovie1<-as(mymovie,"transactions")
#itemFrequencyPlot(mymovie,topN=15)

rules <- apriori(as.matrix(my_movies[,6:15],parameter=list(support=0.2, confidence = 0.5,minlen=3)))
inspect(head(sort(rules, by = "lift")))  

head(quality(rules))
#itemFrequencyPlot(mymovies,topN=15)

plot(rules,method = "scatterplot")
plot(rules, method = "grouped")
plot(rules,method = "graph")

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)
# Sorint rules by lift ratio

rules_lift <- sort(rules,by="lift")
inspect(rules_lift)
arules::inspect(rules_lift)

## with diifferent support and confidence values by changing min length 


rules <- apriori(as.matrix(my_movies[,6:15],parameter=list(support=0.5, confidence = 0.5,minlen=5)))                 

inspect(head(sort(rules, by = "lift")))  
head(quality(rules))


library(arulesViz)
plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)

# Sorint rules by lift ratio

rules_lift <- sort(rules,by="lift")
inspect(rules_lift)
arules::inspect(rules_lift)

#when the lift ratio is greater than 1 its positive.


rules <- apriori(as.matrix(my_movies[,6:15],parameter=list(support=0.25, confidence = 0.8,minlen=2)))                 

inspect(head(sort(rules, by = "lift")))  
head(quality(rules))


library(arulesViz)
plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)

# Sorint rules by lift ratio

rules_lift <- sort(rules,by="lift")
inspect(rules_lift)
arules::inspect(rules_lift)
