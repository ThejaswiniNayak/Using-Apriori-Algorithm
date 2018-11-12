setwd("~/Personal/Study/Crosssell and Upsell/Upsell_model/Initial Data")
library('arules')
txn= read.transactions("MBAEMCdata.csv",rm.duplicates = FALSE,format="single",sep=",",cols=c(1,2))
#inspect transaction data
head(txn,n=5)
txn
txn@itemInfo
image(txn)
#mine association rules
basket_rules = apriori(txn,parameter = list(sup=0.1,conf=0.8),
                       appearance = list (default="lhs",rhs="ISILON"), 
                       control = list (verbose=F))
inspect(basket_rules)

#extract the top 10 rulkes with high lift
rules_high_lift = head(sort(basket_rules,by="lift"))
inspect(rules_high_lift)


rules_conf <- sort (basket_rules, by="confidence", decreasing=TRUE)
inspect(rules_conf)

help(apriori)