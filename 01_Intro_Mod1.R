

#####################################################################
####                                                             ####
####                   R Intro, Workshop 1                       ####
####                     Carleton University                     ####
####                     ISAP 3001                               ####
####                     Fall 2024                               ####
####                                                             ####
#####################################################################

#The objective of this script is to get you started working and scripting in R

#####################################################################

##Getting started with scripting:

## Start each script with a description (like the one above)
## Along the way: write yourself notes with a hashtag in front so you
## know what you did and why

##THIS IS A GOOD WAY TO START EACH R SESSION
rm(list=ls())
#It removes everything from the R environment - always copy and paste it at the top

#Loading libraries
library(stringr)

## Explore the console, command line, environment, and output components of RStudio

# At it's most basic, R is a calculator 
1 / 200 * 30  #Try hitting "run" at the top right of the script
2+3 #Now try CTRL+Enter

# +,-,*,/ for addition, subtraction, multiplication, division
# Familiar calculator functions also work as built in functions within R. 
# For example, to take the natural log of 2
log(2)

#Try log and a few other functions (you can find some online)
ln()

#Hot tip: This is a good way to break your code into sections: CTRL+Shift+R

# Creating an object --------------------------------------------------------
#Now have a look at the drop down menu on the lower left


# In R you can store or assign numbers and character strings to named variables called vectors, 
# which are a type of "object" in R. For example, to assign the number 1 to a variable a, use
a=1                   # Have a look at what appears in the environment

b=2
c=3

a<-1                   # the arrow is also a storage operator
b<-2                   # it is more standard convention to use<-
c<-3

Rachel <- 10

# Hot tip: a keyboard shortcut for the arrow storage operator is ALT+- (alt and the minus sign)
c1 <- c
c2 <- c1+3

d+1
# You can also assign character strings (enter using single or double quotes) to named variables. 
d <- 'Hello' # single or double quotes needed
print(d)  
d

e                     #What happens here? Why?

#At any time, enter ls() to see the names of all the objects in the working R environment
ls()                  

####  Remove R Objects

rm(a,b,c,c1,c2,d, Rachel)             # remove objects
ls()                          # now the environment is empty

#OR
a <- 1
b <- 2
c <- 3
rm(list=ls()) #(like above), will remove everything from the environment

#Hot tip: Object names must start with a letter and can only contain letters, numbers, _, and .
data_on_50_birds <- seq(1,50)
#data on 50 birds <- seq(1,50) #Not going to work
#50birds<-seq(1,50) #Not going to work

# Making different types of objects ---------------------------------------

#1) Vector
#Vectors in R are used to represent variables. 
#R can assign sets of numbers or character strings to named variables 
x <- c(1,2,333,65,45,-88)

#the c() command, for concatenate

# Assign a set of 10 numbers to a variable x. Make sure it includes some positive and 
# some negative numbers. To see the contents afterward, enter x on the command line. 
# Is it really a vector? Enter is.vector(x) to confirm.
x<-c(1,-2, 3, -4, 5,-6, 7, -8, 9, -10)
is.vector(x)

#2) Matrix
d <- matrix(c(1,2,3,4,5,6),3,2) #Create a matrix
View(d) #Have a look

#3) Data frame
d.df <- data.frame(d1=c(8,9,10),d2=c(11,12,13))  # create data frame
d.df #Have a look in the console
View(d.df) #Have a look in the environment
names(d.df)          # view column names

d.df <- data.frame(d)        # create data frame another way
d.df
names(d.df)
names(d.df) <- c("Bananas","Pears")        # provide new names for columns
d.df

#4) Lists
d.list=vector("list",2)        # create empty list with 2 elements
d.list[[1]] <- c(1,2,3)          # Fill the first list element
d.list[[2]] <- c(4,5,6)          # Fill the second list element
d.list

d.list[[1]]
d.list[[2]]

#5) Functions 
# General structure:
#function_name(arg1 = val1, arg2 = val2, ...)

d.f <- function(){        # create R function
  out <- matrix(1:6,3,2)        # use colon operator to create sequence
  return(out)
}

d.f()                                # invoke function d.f

dd=d.f()                        # store output in variable dd
dd

d.f <- function(x,y){                # make function with inputs
  out <- matrix(1:(x*y),x,y)
  return(out)
}
d.f(x=3,y=2)
d.f(2,3)
d.f(4,5)

# 6) Strings
# Can be created using double or single quotes

string1<- "This is a string"
string2<- 'If I want to include a "quote" inside a string, I use single quotes'

#To include a literal single or double quote in a string, you can use \ to “escape” it:
double_quote <- "\""
single_quote <- '\''

# If you want to include a literal backslash in your string, you’ll need to escape it: "\\"
backslash <- "\\"

# Note that the printed representation of a string is not the same as the string itself because 
# the printed representation shows the escapes 
# (in other words, when you print a string, you can copy and paste the output to recreate that string).
# To see the raw contents of the string, use str_view()
x <- c(single_quote, double_quote, backslash)
x

str_view(x)

# As well as \", \', and \\, there are a handful of other special characters that may come in handy. 
# The most common are \n, a new line, and \t, tab. You’ll also sometimes see strings containing 
# Unicode escapes that start with \u or \U. This is a way of writing non-English characters that 
# work on all systems. You can see the complete list of other special characters in ?Quotes

x <- c("one\ntwo", "one\ttwo", "\u00b5", "\U0001f604")
x

str_view(x)

# Functions ---------------------------------------------------------------

# One of the beautiful features of R is how easy it is to write your own functions and
# access functions others have written (R has a large collection of built-in functions)
# This is a great way to stream-line your code and minimize repetition 
# (which is also a good way to prevent copy-paste errors).

# Here's a function you've already used:
d <- c(1,2,3)            # the function "c()" concatenates or joins elements
                      # together into one vector

d                     # d is now a "vector" in R

# the function "seq" creates a sequence of numbers from the first you provide to the last
d <- seq(1:10)            
f <- seq(1,10,.5)        # you can also sequence in different increments
e <- rev(d)              # the function "rev" reverses the order of the sequence

# the function "rep" repeats numbers
g <- rep(0,3)                
rep(1:3,2)                # repeat 1:3 two times
rep(1:3,each=2)        # repeat each element of 1:3 two times

# Getting help with functions
?seq                   # View help pertaining to function seq (in the output)
?rep
#Type se and hit TAB. A popup shows you possible completions. 

rm(list=ls())

# Making your own functions (as above)

myfunction1 <- function(x) {
  out <- 2*x^2 + 3
  return(out)
}

z <- myfunction1(5)
z

# Try this function with some different values of x.
myfunction1(10)

# Now try typing the variable name out into the R console. This should cause an error
# The variable out is only defined locally within myfunction1, so if you try to access 
# it from "outside" the function, it won't exist.
x

# Construct your own function with two arguments (call them x' and y'). Name this function 
# myfunction2. Try calling this function with some different combinations ofxandy.
function2<-function(x,y) {
  out <- 2*x^2 + y
  return(out)
}

function2(2,5)

# You can use various apply statements (there are many lapply,mapply, sapply,tapply, rapply) 
# to apply functions to vectors, lists, matrices, etc. For example, we could apply myfunction1 
# to the vector

x <- c(1,2,333,65,45,-88)
sapply(x, myfunction1)

# Subsetting objects ------------------------------------------------------

##Vector
# Make a vector that has 5 values, with some negative and positive values, store it in an object
# called Vec1

length(Vec1) # make sure your vector has 5 values

Vec1[3]                # 3rd element of Vec1 vector
Vec1[-2]        # all elements of Vec1 vector except 2

##Matrices
# Make a matrix with 4 rows and 2 columns with some negative and positive vaues (8 values total), 
# store it in an object called Mat1

dim(Mat1)        # Obtain dimensions of your matrix to make sure there are 4 rows and 2 columns

## To subset use square brackets [rows,columns]
Mat1[,2]                # 2nd column of d
Mat1[2,]                # 2nd row of d
Mat1[2:3,]        # 2nd and 3rd rows of d in a matrix

##Dataframes
# Make a data frame out of Mat1, name column 1 "Pears" and column 2 "Peaches", store it in an object
# called DF1

DF1$Pears      # Accessing columns of a dataframe
DF1[,1]

DF1$Peaches
DF1$Peaches[3]  # subset an element of a data frame

# Logic -------------------------------------------------------------------

# R as a calculator will also give a TRUE or FALSE response to a logical operation. 

2 + 2 == 4   # == is the logical for 'is equal to'

3 <= 2     # 'less than or equal to'

'A' > 'a'   # 'greater than'

'Hi' != 'hi'  # 'not equal to' (i.e., R is case sensitive)

#Hot tip: Want to hashtag out (comment out) an entire section? Highlight the whole thing and
#Use CTRL+SHIFT+C

##Before you go:

# R will do the tedious computations for you, but in exchange, you must be completely precise in your 
# instructions. If not, you’re likely to get an error that says the object you’re looking for was not 
# found. Typos matter; R can’t read your mind and say, “oh, they probably meant r_rocks when they typed 
# r_rock”. Case matters; similarly, R can’t read your mind and say, “oh, they probably meant r_rocks 
# when they typed R_rocks”.

