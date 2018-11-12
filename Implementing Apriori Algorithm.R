setwd("~/Personal/Study/Crosssell and Upsell")
product_purchase=read.csv("test.csv")

product_purchase <- product_purchase[order(product_purchase$Tran_ID),]
product_purchase$Tran_ID <- as.numeric(product_purchase$Tran_ID)

#install.packages("plyr", dependencies= TRUE)
library(plyr)

product_purchase <- ddply(product_purchase,c("Tran_ID"),
                          function(df1)paste(df1$Product_Name, collapse = ","))
product_purchase$Tran_ID <- NULL

#Rename column headers for ease of use
colnames(product_purchase) <- c("itemList")

write.csv(product_purchase, file = "~/Personal/Study/Crosssell and Upsell/product_purchase.csv",
          row.names = FALSE)

library(arules)
txn = read.transactions(file="product_purchase.csv", rm.duplicates= TRUE, 
                        format="basket",sep=",",cols=1)

head(txn)
image(txn)
basket_rules = apriori(txn,parameter = list(sup=0.01,conf=0.01,target="rules"))


