
View(groceries)
#association Rule
library(arules)


rules<-apriori(groceries)
arules::inspect(rules)
rules.sorted<-sort(rules,by="lift")
arules::inspect(rules.sorted)

#rules with rhs 
groceries_rules<-apriori(groceries,parameter = list(support = 0.2,confidence = 0.5,minlen=3))
inspect(head(sort(rules, by = "lift"))) 
head(quality(rules))
itemFrequencyPlot(groceries,topN=5)


library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

arules::inspect(rules)

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)


#change in ratio
groceries_rules<-apriori(groceries,parameter = list(support = 0.3,confidence = 0.5,minlen=2))

library(arulesViz)
plot(groceries_rules,method = "scatterplot")

arules::inspect(rules)

-----------------------------------------------------------------------
###### different support and confidence values by changing min length 
  attach(groceries)

groceries_rules<-apriori(groceries,parameter = list(support = 0.06,confidence = 0.50,minlen=3))
inspect(head(sort(rules, by = "lift"))) 
head(quality(rules))
itemFrequencyPlot(groceries,topN=5)


library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

arules::inspect(rules)

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)


#change in ratio
groceries_rules<-apriori(groceries,parameter = list(support = 0.6,confidence = 0.5,minlen=2))

library(arulesViz)
plot(groceries_rules,method = "scatterplot")

arules::inspect(rules)
---------------------------------------------------------------------------------------------------------------
  ###### different support and confidence values by changing min length 
  attach(groceries)

groceries_rules<-apriori(groceries,parameter = list(support = 0.05,confidence = 0.7,minlen=6))
inspect(head(sort(rules, by = "lift"))) 
head(quality(rules))
itemFrequencyPlot(groceries,topN=5)


library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

arules::inspect(rules)

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)


#change in ratio
groceries_rules<-apriori(groceries,parameter = list(support = 0.2,confidence = 0.5,minlen=2))

library(arulesViz)
plot(groceries_rules,method = "scatterplot")

arules::inspect(rules)
---------------------------------------------------------------------------------------------------------------
  