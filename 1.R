#ASSIGNMENT NO.1: Introduction to R and Basic Operations  

#Q1) Write an R program that:  
#1. Takes two numeric values from user.  
#2. Performs all arithmetic operations (+, −, *, /, power, modulus).  
#3. Stores the results in a vector.  
#4. Displays the maximum, minimum, and average value of the results

# Q1: Arithmetic Operations in R

# Step 1: Take two numeric values from user
num1 <- as.numeric(readline("Enter first number: "))
num2 <- as.numeric(readline("Enter second number: "))

# Step 2: Perform all arithmetic operations
results <- c(
  Addition = num1 + num2,
  Subtraction = num1 - num2,
  Multiplication = num1 * num2,
  Division = num1 / num2,
  Power = num1 ^ num2,
  Modulus = num1 %% num2
)

# Step 3: Store results in a vector
print(results)

# Step 4: Display maximum, minimum, and average
cat("Maximum:", max(results), "\n")
cat("Minimum:", min(results), "\n")
cat("Average:", mean(results), "\n")


#Q2) Create an R program that: 
#1. Generates 10 random numbers between 1 and 100. 
#2. Calculates square root and then rounded value, ceiling, and floor for each square root value. 
#3. Stores results in a data frame.

# Q2: Random Numbers and Square Roots

# Step 1: Generate 10 random numbers between 1 and 100
nums <- sample(1:100, 10)

# Step 2: Calculate square root values
sqrt_vals <- sqrt(nums)

# Step 3: Create a data frame with rounded, ceiling, and floor values
df <- data.frame(
  Number = nums,
  SquareRoot = sqrt_vals,
  Rounded = round(sqrt_vals),
  Ceiling = ceiling(sqrt_vals),
  Floor = floor(sqrt_vals)
)

# Step 4: Display results
print(df)



#Q3) Write an R program that: 
#1. Takes a list of names. 
#2. Converts all names to uppercase. 
#3. Calculates the number of characters in each name. 
#4. Combines the name and its length into a formatted sentence

# Q3: Names Manipulation

# Step 1: Take a list of names
names <- c("Riya", "Sahil", "Ananya", "Vikram")

# Step 2: Convert all names to uppercase
upper_names <- toupper(names)

# Step 3: Calculate the number of characters in each name
name_lengths <- nchar(names)

# Step 4: Combine name and its length into a formatted sentence
sentences <- paste(upper_names, "has", name_lengths, "characters.")
print(sentences)


#Q4) Write an R program that: 
# 1. Creates a vector of numbers from 1 to 200. 
#3. Calculates square root and square of those numbers. 
#4. Displays results in a table format.

# Q4: Numbers divisible by 3 and 5 in R

# Step 1: Create a vector of numbers from 1 to 200
nums <- 1:200

# Step 2: Find numbers divisible by both 3 and 5
divisible <- nums[nums %% 3 == 0 & nums %% 5 == 0]

# Step 3: Calculate square root and square of those numbers
df <- data.frame(
  Number = divisible,
  SquareRoot = sqrt(divisible),
  Square = divisible^2
)


#Q5) Write an R program to evaluate a quadratic equation for given a, b, c values  
#and return real or complex roots. 
#formula:  
#  For ax² + bx + c = 0 
#Discriminant: D = b² − 4ac 

#Roots:   x = (-b ± √D) / 2a 


  # Q5: Quadratic Equation Roots in R
  
  # Step 1: Take input values for a, b, c
  a <- as.numeric(readline("Enter a: "))
  b <- as.numeric(readline("Enter b: "))
  c <- as.numeric(readline("Enter c: "))
  
  # Step 2: Calculate discriminant
  D <- b^2 - 4*a*c
  
  # Step 3: Evaluate roots based on discriminant
  if(D > 0){
    root1 <- (-b + sqrt(D)) / (2*a)
    root2 <- (-b - sqrt(D)) / (2*a)
    cat("Two Real Roots:", root1, "and", root2, "\n")
  } else if(D == 0){
    root <- -b / (2*a)
    cat("One Real Root:", root, "\n")
  } else {
    realPart <- -b / (2*a)
    imagPart <- sqrt(-D) / (2*a)
    cat("Complex Roots:", realPart, "+", imagPart, "i and",
        realPart, "-", imagPart, "i\n")
  }
  