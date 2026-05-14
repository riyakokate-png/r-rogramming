#ASSIGNMENT NO :-9 Introduction to S3 and S4 Classes and Using R Objects and References 

#Q1) Customer Object Modeling (S3 System) 
#Scenario: A retail company wants to convert customer records into structured objects. 
#1. Create an S3 class "Customer" using dataset rows. 
#3. Create a custom print.Customer() method. 
#4. Extract and display customer details using object reference. 
#5. Modify one attribute and observe behavior.

.#1Create an S3 class Customer using dataset row
# Example dataset row
cust1 <- list(Name="Rohit", Age=25, Income=50000, Membership="Gold")

# Assign S3 class
class(cust1) <- "Customer"


#3.Create a custom print.Customer() method

print.Customer <- function(obj){
  cat("Customer Record\n")
  cat("Name:", obj$Name, "\n")
  cat("Age:", obj$Age, "\n")
  cat("Income:", obj$Income, "\n")
  cat("Membership:", obj$Membership, "\n")
  
 #4 Extract and display customer details using object reference
  # Print using custom method
  print(cust1)
  
  # Access specific attribute
  cust1$Income
}

#5.Modify one attribute and observe behavior
# Change Membership
cust1$Membership <- "Platinum"

# Print again to see updated details
print(cust1)
#Q2) Advanced Customer Class (S4 System) 
#Scenario: A banking system requires strict validation of customer records. 
#1. Define an S4 class "Customer" with slots (Age, Income, Membership). 
#2. Create objects from dataset rows. 
#3. Write a show() method.

#1. Define an S4 class Customer with slots

# Define S4 Class
setClass("Customer",
         slots = list(
           Name = "character",
           Age = "numeric",
           Income = "numeric",
           Membership = "character"
         ))

#2Create objects from dataset rows
# Create Customer objects
cust1 <- new("Customer", Name="Rohit", Age=25, Income=50000, Membership="Gold")
cust2 <- new("Customer", Name="Kiran", Age=30, Income=60000, Membership="Platinum")

#Write a show() method
setMethod("show", "Customer",
          function(object){
            cat("Customer Record\n")
            cat("Name:", object@Name, "\n")
            cat("Age:", object@Age, "\n")
            cat("Income:", object@Income, "\n")
            cat("Membership:", object@Membership, "\n")
          })

# Test
cust1
cust2


#Q3) Object Referencing and Copy Behavior 
#Scenario: A data analyst copies dataset for experimentation. 
#1. Assign dataset to new variable. 
#2. Modify one column in copied dataset. 
#3. Check if original dataset changes. 
#4. Use identical() to compare objects


#1.Assign dataset to new variable
# Original dataset
sales_data <- data.frame(
  Customer = c("Rohit", "Kiran"),
  Quantity = c(3, 5),
  Revenue = c(54000, 8000)
)

# 2.Copy dataset
experiment_data <- sales_data. 

Modify one column in copied dataset
# Change Quantity in copied dataset
experiment_data$Quantity <- c(10, 20)

#3Check if original dataset changes
View both datasets
sales_data
experiment_data

#4.Use identical() to compare objects
identical(sales_data, experiment_data)

#Q3) Object Referencing and Copy Behavior 
#Scenario: A data analyst copies dataset for experimentation. 
#1. Assign dataset to new variable. 
#2. Modify one column in copied dataset. 
#3. Check if original dataset changes. 
#4. Use identical() to compare objects.

#1.dataset to new variable
# Original dataset
sales_data <- data.frame(
  Customer = c("Rohit", "Kiran"),
  Quantity = c(3, 5),
  Revenue = c(54000, 8000)
)

# Copy dataset
experiment_data <- sales_data


#2.Modify one column in copied dataset
# Change Quantity in copied dataset
experiment_data$Quantity <- c(10, 20)

#3.Check if original dataset changes
# both datasets
sales_data
experiment_data

#4. Use identical() to compare objects
identical(sales_data, experiment_data)

#Q4) Memory Optimization Study 
#Scenario: Company wants to optimize memory usage. 
#1. Create large object from dataset. 
#2. Check memory usage using object.size(). 
#3. Remove unnecessary objects using rm(). 
#4. Run garbage collection.

#1.Create large object from dataset
# Create a large dataset (1 million rows)
large_data <- data.frame(
  ID = 1:1000000,
  Value = rnorm(1000000, mean=50, sd=10)
)


#2. Check memory usage using object.size()
object.size(large_data)
print(object.size(large_data), units="MB")

#3.Remove unnecessary objects using rm()
rm(large_data)   # Removes the object from memory

#4Run garbage collection
gc()   # Frees up unused memory


#Q5) List-Based Customer Object System 
#Scenario: System uses lists instead of data frames. 
#1. Convert dataset into list of customers. 
#2. Assign S3 class to each list element. 
#3. Access nested values. 
#4. Modify one customer's data. 
#5. Print structure using str().


#1.Convert dataset into list of customers
# Example dataset rows converted into list
cust_list <- list(
  list(Name="Rohit", Age=25, Income=50000, Membership="Gold"),
  list(Name="Kiran", Age=30, Income=60000, Membership="Platinum")
)

#2.Assign S3 class to each list element
class(cust_list[[1]]) <- "Customer"
class(cust_list[[2]]) <- "Customer"

#3.Access nested values
# Access Kiran's Income
cust_list[[2]]$Income

#4.Modify one customer's data
# Update Rohit's Membership
cust_list[[1]]$Membership <- "Platinum"

#5.Print structure using str()
str(cust_list)

#Q6) Class Inspection and Documentation 
#Scenario: Developer needs to inspect object structure. 
# Check class of dataset. 
#2. Use str() to inspect structure. 
#3. Extract attributes. 
#4. Use summary() for overview.

#1. Check class of dataset
class(sales_data)

#2. Use str() to inspect structure
str(sales_data)

#3. Extract attributes
attributes(sales_data)

#4.Use summary() for overview
summary(sales_data)

#Q7) S4 Slot Manipulation 
#Scenario: Product system tracks spending behavior. 
#1. Create S4 class "SpendingProfile". 
#2. Add slots for SpendingScore and Income. 
#3. Create object using dataset values. 
#4. Access slots using @. 
#5. Modify slot values and validate.

#1. Create S4 class SpendingProfile
setClass("SpendingProfile",
         slots = list(
           Name = "character",
           SpendingScore = "numeric",
           Income = "numeric"
         ))
#3.Create object using dataset values
profile1 <- new("SpendingProfile",
                Name="Rohit",
                SpendingScore=75,
                Income=50000)

#4.Access slots using @
profile1@Name
profile1@SpendingScore
profile1@Income

#5.Modify slot values and validate
# Update SpendingScore
profile1@SpendingScore <- 90

# Check updated object
profile1

#Q8) Advanced Data Structure Integration 
#Scenario: Company integrates multiple data sources. 
#1. Create nested list containing dataset and summary. 
#2. Access inner elements. 
#3. Modify nested structure. 
#4. Apply class to nested object. 
#5. Display structure using str().

#1. Create nested list containing dataset and summary
# Example dataset
sales_data <- data.frame(
  Customer = c("Rohit", "Kiran"),
  Quantity = c(3, 5),
  Revenue = c(54000, 8000)
)

# Nested list with dataset + summary
nested_obj <- list(
  Data = sales_data,
  Summary = summary(sales_data)
)5. Display structure using str()
R
str(nested_obj)

#2.Access inner elements
# Access dataset
nested_obj$Data

# Access summary of Revenue
nested_obj$Summary$Revenue

#3. Modify nested structure
# Add new element
nested_obj$Meta <- list(Source="Retail System", Date="2026-05-14")

#4. Apply class to nested object
class(nested_obj) <- "CustomerData"

#Q9) Object-Oriented Data Analysis 
#Scenario: Analyst builds reusable object-based analysis system. 
#1. Convert dataset into S3 object. 
#2. Create function to calculate average income. 
#3. Apply function to object. 
#4. Extend object with new attribute. 
#5. Validate object consistency. 


#Convert dataset into S3 object
# Example dataset row
cust_data <- list(
  Name = "Rohit",
  Age = 25,
  Income = 50000,
  Membership = "Gold"
)

# Assign S3 class
class(cust_data) <- "Customer"

#2. Create function to calculate average income
avgIncome.Customer <- function(obj_list){
  incomes <- sapply(obj_list, function(x) x$Income)
  mean(incomes)
}

#3. Apply function to object
# Create multiple customer objects
cust1 <- list(Name="Rohit", Age=25, Income=50000, Membership="Gold")
class(cust1) <- "Customer"

cust2 <- list(Name="Kiran", Age=30, Income=60000, Membership="Platinum")
class(cust2) <- "Customer"

cust_list <- list(cust1, cust2)

# Apply average income function
avgIncome.Customer(cust_list)

#4. Extend object with new attribute
# Add new attribute: SpendingScore
cust1$SpendingScore <- 80

#5. Validate object consistency
# Check class and structure
class(cust1)
str(cust1)


#Q10) Enterprise-Level Object System Design 
#Scenario: A company wants scalable object-oriented design. 
#1. Create both S3 and S4 versions of dataset. 
#2. Compare flexibility vs strictness. 
#3. Implement method for summary statistics. 
#4. Document differences between systems.


#1. Create both S3 and S4 versions of dataset
# --- S3 Version ---
cust_s3 <- list(Name="Rohit", Age=25, Income=50000, Membership="Gold")
class(cust_s3) <- "Customer"

# --- S4 Version ---
setClass("Customer",
         slots = list(Name="character", Age="numeric",
                      Income="numeric", Membership="character"))

cust_s4 <- new("Customer", Name="Rohit", Age=25,
               Income=50000, Membership="Gold")

#implement method for summary statistic

# .S3 method
summary.Customer <- function(obj){
  cat("Customer Summary\n")
  cat("Name:", obj$Name, "\nAge:", obj$Age,
      "\nIncome:", obj$Income, "\nMembership:", obj$Membership, "\n")
}

summary(cust_s3)

# S4 method
setMethod("summary", "Customer",
          function(object){
            cat("Customer Summary\n")
            cat("Name:", object@Name, "\nAge:", object@Age,
                "\nIncome:", object@Income, "\nMembership:", object@Membership, "\n")
          })

summary(cust_s4)


