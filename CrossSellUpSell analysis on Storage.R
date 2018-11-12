setwd("~/Personal/Study/Crosssell and Upsell")
library(arules)
#install.packages("readxl")
library(readxl)
data_for_mining= read_excel("~/Personal/Study/Crosssell and Upsell/Cust_Prod_Details.xlsx")
data_for_mining[] <- lapply(data_for_mining, factor)


Super_Family_data <- data.frame(data_for_mining$Account_Name, 
                                     data_for_mining$Super_Family)
#mine association rules
Super_Family_Rules=apriori(Super_Family_data,parameter = list(support=0.01,confidence=0.01))
inspect(Super_Family_Rules)


Product_Family_data <- data.frame(data_for_mining$Account_Name, 
                                data_for_mining$Product_Family)
#mine association rules
Product_Family_Rules=apriori(Product_Family_data,parameter = list(support=0.01,confidence=0.01))
inspect(Product_Family_Rules)

Product_Name_data <- data.frame(data_for_mining$Product_Name)
#mine association rules
Product_Name_Rules=apriori(Product_Name_data,parameter = list(support=0.001,confidence=0.0001))
rules_high_lift = head(sort(Product_Name_Rules,by="lift"),3)
inspect(rules_high_lift)