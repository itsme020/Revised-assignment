library(arules)
rules<-apriori(book)
rules <- apriori(as.matrix(book),parameter=list(support=0.02, confidence = 0.5,minlen=5))
inspect(head(sort(rules, by = "lift"))) 

head(quality(rules))
itemFrequencyPlot(book,topN=20)
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

---------------------------------------------------------------------------------------------------------
## with diifferent support and confidence values by changing min length 
  
rules <- apriori(as.matrix(book),parameter=list(support=0.03, confidence = 0.6,minlen=3))
inspect(head(sort(rules, by = "lift"))) 
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
----------------------------------------------------------------------------------------------------------
####### ## with diifferent support and confidence values by changing min length 
  
  attach(book)
rules <- apriori(as.matrix(book),parameter=list(support=0.005, confidence = 0.50,minlen=4))

inspect(head(sort(rules), n = 10))

inspect(head(sort(rules, by = "lift"))) 

plot(head(sort(rules, by = "lift"), n = 10), method = "graph", control = list(cex = 1.0))
plot(head(sort(rules), n = 10), method = "grouped", control = list(cex = 0.2))

head(quality(rules))
plot(rules)
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