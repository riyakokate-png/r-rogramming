#Assignment No :- 2-Data Structures and Control Structures in R

#Q1) Filtering Rows 
#1. Show orders where Price > 20000. 
#2. Show orders where City = Pune. 
#3. Show orders where Quantity > 5. 
#4. Show orders where Category = Electronics. 
#5. Combine two conditions.

#1.orders where Price > 20000
subset(sales_data, Price > 20000)

#2.subset(sales_data, City == "Pune")
subset(sales_data, Quantity > 5)

#3.Orders where Quantity > 5
subset(sales_data, Quantity > 5)

#4.Orders where Category = Electronics
subset(sales_data, Category == "Electronics")

#5.Combine two conditions (Price > 20000 AND City = Pune)
subset(sales_data, Price > 20000 & City == "Pune")

#Q2) Sorting Data 
#1. Sort dataset by Price. 
#2. Sort dataset by Revenue. 
#3. Sort by City alphabetically. 
#4. Sort by Quantity descending. 
#5. Sort by multiple columns.

#1.Sort dataset by Price
sales_data[order(sales_data$Price), ]

#2.Sort dataset by Revenue
sales_data[order(sales_data$Revenue), ]

#3.Sort by City alphabetically
sales_data[order(sales_data$City), ]

#4.Sort by Quantity descending
sales_data[order(-sales_data$Quantity), ]

#5.Sort by multiple columns (City, then Price)
sales_data[order(sales_data$City, sales_data$Price), ]

#Q3) Aggregation 
#1. Total revenue by city. 
#2. Average price by category. 
#3. Total quantity sold by product. 
#4. Maximum order value by city. 
#5. Minimum order value by product. 

#1.Total revenue by city
aggregate(Revenue ~ City, data = sales_data, sum)

#2.Average price by category
aggregate(Price ~ Category, data = sales_data, mean)

#3.Total quantity sold by product
aggregate(Quantity ~ Product, data = sales_data, sum)

#4.Maximum order value by city
aggregate(FinalAmount ~ City, data = sales_data, max)

#5.Minimum order value by product. 
aggregate(FinalAmount ~ Product, data = sales_data, min)

#Q4) Conditional Statements 
#1. If discount > 10 mark "High Discount". 
#2. Classify orders into High / Medium / Low value by using if else. 
#3. Print revenue of each order by using for loop. 
#4. Calculate cumulative revenue by using while loop 
#5. Skip fashion category. 

#1.If discount > 10 mark "High Discount"
sales_data$DiscountFlag <- ifelse(sales_data$Discount > 10, "High Discount", "Normal")

#2Classify orders into High / Medium / Low value (using ifelse)
sales_data$OrderValue <- ifelse(sales_data$FinalAmount > 40000, "High",
                                ifelse(sales_data$FinalAmount > 20000, "Medium", "Low"))

#3.Print revenue of each order (using for loop)
for(i in 1:nrow(sales_data)){
  cat("OrderID:", sales_data$OrderID[i], "- Revenue:", sales_data$Revenue[i], "\n")
}

#4.Calculate cumulative revenue (using while loop)
i <- 1
cumulative <- 0
while(i <= nrow(sales_data)){
  cumulative <- cumulative + sales_data$Revenue[i]
  i <- i + 1
}
cat("Cumulative Revenue:", cumulative, "\n")

#5.Skip fashion category

skip_fashion <- subset(sales_data, Category != "Fashion")
print(skip_fashion)

#Q5) Discount Analysis 
#1. Find Average discount. 
#2. Orders with discount > 10%. 
#3. Total discount amount. 
#4. City with highest discount. 
#5. Count discount level

#1.Find Average discount
mean(sales_data$Discount)

#2.Orders with discount > 10%
subset(sales_data, Discount > 10)

#3.Total discount amount
sum(sales_data$DiscountAmount)

#4.City with highest discount
aggregate(DiscountAmount ~ City, data = sales_data, sum)

#5.Count discount levels
table(sales_data$Discount)

#Q6) Multi Condition Filtering 
#1. Electronics + Price > 20000 
#2. Fashion + Quantity > 5 
#3. Pune + Discount > 10 
#4. Revenue > 50000 + Cash payment 
#5. High price + high quantity

#1.Electronics + Price > 20000
subset(sales_data, Category == "Electronics" & Price > 20000)

#2.Fashion + Quantity > 5
subset(sales_data, Category == "Fashion" & Quantity > 5)

#3.Pune + Discount > 10
subset(sales_data, City == "Pune" & Discount > 10)

#4.Revenue > 50000 + Cash payment
subset(sales_data, Revenue > 50000 & PaymentMethod == "Cash")

#5 High price + high quantity (Price > 30000 & Quantity > 5)
subset(sales_data, Price > 30000 & Quantity > 5)
