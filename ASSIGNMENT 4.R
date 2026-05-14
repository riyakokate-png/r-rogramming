#ASSIGNMENT NO.4: Data Management and Manipulation in R


#Q1) Problems on Recoding Variables, Sorting and New Variable Creation  
#a) Create OrderSize (Small, Medium, Large) 
#b) Sort by Quantity descending 
#c) Sort by City and Revenue 
#d) Create Tax column 
#e) Create TotalBill column

#a. create OrderSize (Small, Medium, Large)

sales_data$OrderSize <- ifelse(sales_data$Quantity <= 3, "Small",
                               ifelse(sales_data$Quantity <= 7, "Medium", "Large"))

#b.Sort by Quantity descending
sales_data[order(-sales_data$Quantity), ]

#c.Sort by City and Revenue
# Ensure Revenue is numeric
sales_data$Revenue <- as.numeric(sales_data$Revenue)

# Sort by City (A–Z) and Revenue (High–Low)
sales_data[order(sales_data$City, -sales_data$Revenue), ]

#d.Create Tax column (10% of FinalAmount)
sales_data$Tax <- sales_data$FinalAmount * 0.10


#Q2) Problems on dplyr select() and filter() 
#a) Select CustomerName and Product 
#b) Select numeric columns 
#c) Remove Discount column 
#d) Filter Pune customers 
#e) Filter multiple conditions (Price > 20000 and Quantity > 5)

library(dplyr)

# a) Select CustomerName and Product
sales_data %>% 
  select(CustomerName, Product)

# b) Select numeric columns
sales_data %>% 
  select(where(is.numeric))

# c) Remove Discount column
sales_data %>% 
  select(-Discount)

# d) Filter Pune customers
sales_data %>% 
  filter(City == "Pune")

# e) Filter multiple conditions (Price > 20000 and Quantity > 5)
sales_data %>% 
  filter(Price > 20000 & Quantity > 5)

#Q3) Problems on Using mutate() and arrange() 
#a) Create Tax variable 
#b) Create Profit variable 
#c) Create OrderCategory 
#d) Create DiscountCategory 
#f) Sort by Revenue descending by using arrange()
library(dplyr)

sales_data <- sales_data %>%
  mutate(
    # a) Create Tax variable (10% of FinalAmount)
    Tax = FinalAmount * 0.10,
    
    # b) Create Profit variable (20% of FinalAmount)
    Profit = FinalAmount * 0.20,
    
    # c) Create OrderCategory (High if Revenue > 50000, else Low)
    OrderCategory = ifelse(Revenue > 50000, "High", "Low"),
    
    # d) Create DiscountCategory (High if Discount > 10, else Low)
    DiscountCategory = ifelse(Discount > 10, "High", "Low"),
    
    # e) Create PaymentType variable (Offline if Cash, else Online)
    PaymentType = ifelse(PaymentMethod == "Cash", "Offline", "Online")
  ) %>%
  
  # f) Sort by Revenue descending
  arrange(desc(Revenue))

#Q4) Problems on Using group_by() and summarise() 
#a) Total revenue by city 
#b) Average price by product 
#c) Total quantity sold by product 
#d) Maximum revenue by city 
#e) Minimum revenue by product

library(dplyr)

# a) Total revenue by city
sales_data %>% 
  group_by(City) %>% 
  summarise(TotalRevenue = sum(Revenue))

# b) Average price by product
sales_data %>% 
  group_by(Product) %>% 
  summarise(AveragePrice = mean(Price))

# c) Total quantity sold by product
sales_data %>% 
  group_by(Product) %>% 
  summarise(TotalQuantity = sum(Quantity))

# d) Maximum revenue

#Q5) Problems on Customer Analysis 
#1. Count orders per customer 
#2. Total revenue per customer 
#3. Average order value 
#4. Top customer 
#5. Sort customers by revenue

library(dplyr)

# 1. Count orders per customer
sales_data %>% 
  group_by(CustomerName) %>% 
  summarise(OrderCount = n())

# 2. Total revenue per customer
sales_data %>% 
  group_by(CustomerName) %>% 
  summarise(TotalRevenue = sum(Revenue))

# 3. Average order value per customer
sales_data %>% 
  group_by(CustomerName) %>% 
  summarise(AverageOrderValue = mean(Revenue))

# 4. Top customer (highest revenue)
sales_data %>% 
  group_by(CustomerName) %>% 
  summarise(TotalRevenue = sum(Revenue)) %>% 
  arrange(desc(TotalRevenue)) %>% 
  head(1)

# 5. Sort customers by revenue (descending)
sales_data %>% 
  group_by(CustomerName) %>% 
  summarise(TotalRevenue = sum(Revenue)) %>% 
  arrange(desc(TotalRevenue))
