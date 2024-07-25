#R Introduction
60+50
1+3

#R Variables and Constants
a=76
a

#display the results
print(a)
print(76)
print("IMAGECON INDIA")
print('a')

print("a is",a)



###############################




#cat => Concatenate and Print
cat("a is",a)
#print(f"value is given {a}")
#########################################################################



#R Datatypes

#numeric
#integer
#Boolean or Logical
#character
#complex
#Raw




n = 5.5
n
j=5

class(n)#class() -> used to know the type of my data.
class(j)

#integer

i = 100L
i=5.6L
i
class(i)

#Boolean or Logical

b =10>3

b =TRUE

class(b)


#########################################################################
#character
c ="Hello World"
c
class(c)



#complex--written with an "i" as the imaginary part
com = 2+3i#only i alphabet is allowed
com
class(com)



#Raw--convert the character into machine code
r=charToRaw("Hello World")
r
class(r)




##In order to know the datatype taken by the variable - class() function
#class
class(i)
class(a)
class(b)
class(c)
class(com)
class(r)
######################################################################

##Inorder to do explicit conversion
##typecasting - need to use as
ii=9L
class(ii)
char = as.character(ii)
char
class(char)


v1=as.numeric(char)
class(v1)


iii=9
class(iii)






as.character(iii)
as.numeric(iii)#as -> converting into another datatype
as.raw(iii)
as.complex(iii)
as.logical(iii)
as.integer(iii)
#############################################################################################3
##In order to get the output as T or F - is()
ii=TRUE
class(ii)
is.numeric(ii)
#is -> checking the data whether it is in that datatype or not.
is.character(ii)
is.integer(ii)
is.raw(ii)
is.logical(ii)
#########################################################################
#Vector 
#combine class 
#c()

v = c(-1,2,3,4,5)

class(v)

v = c(1,2,3,4,5,'a')
class(v)

v = c('a','b','c','d',1)
class(v)

v=c("hello","HI")

class(v)



#Access the vector
v[]

v = c(-1,2,7,4,5)

v[-3]
v[3]

##Here's the vector again.

v=c(1, 4, 4, 3, 2,2, 3)

# Drop the first element
v[4]
# Drop first three

v[-1:-3]

#Add values to the vector
v = c(-1,2,3,4,5)

v[9]=900

v[3]=10

v[6]=9

v[1:4]=100
v

ve=c(1,2,c(10,20),c(11,333))

ve[6]








#########################################################################
#########################################################################
#list
list1 = list(10,20,3,4,5,'a','a',1)
class(list1)
list1 <- list(c(1,2,3,4),5,'a','a',1)#left assign operator 
list1 <- list(c(2,5,3),21.3,sin(90))

list1

list1 <- list(c(2,5,3),21.3,list(10,1),list(33,55)) 
list1
class(list1)
list1[3]


list1[[1]][2]

list1[[5]][1]

list1[[1]][4]

#Matrices - a two dimensional data set with columns and rows.
m = matrix(c(1,3,7,5,9,6),nrow=10,ncol=6,byrow =FALSE)
m
class(m)
m[2,3]#row,co
m[2,1:6]#row
m[1:10,1]#column
#SERIES ->1D
#DATAFRAME -> 2D
#more than 2 dim is called array
#2 dim is matrix
#to find the amount of rows and columns in a Matrix
dim(m)
#find the dimension of a Matrix i.e total number of values
length(m)
m



#add additional columns in a Matrix
mm=cbind(m,c(10,20,30,40,50))
#add additional rows in a Matrix:
mm=rbind(mm,c(100,200,300,400,500,600,700))
mm
#Combine two Matrices-it should be same size
m1=rbind(mm,mm)#row-wise
m2=cbind(mm,mm)#column-wise
m1
m2


#########################################################################
#Array - more than two dimensions-array()

a = array(c(1,2,3,4,5,6),dim = c(2,6,3))#row,column,array(dim)
a
class(a)
a[1,5,3]
a[2,6,2]

################################################################################
#Factor - store the distinct values of the element in a vector 
#unique values 
s = c("apple","orange","orange","grape","orange","pineapple","grape")
f=factor(s)
class(f)
levels(f)
nlevels(f)

#DataFrames --Tabular DATA objects
d = data.frame(Name=c('CSK','CSK'),
               Category=c('vs MI','vs RCB'),location = 'Chennai',win ="CSK")

d

class(d)





##############################################################################
############################################################################################################################################################


##R Operators
##Arithmetic operators
##Logical operators
##Relational Operators
##Assignment operators
#Miscellaneous Operators



##Arithmetic operators
list1 = c(1,5,4,4,5)
list2 = c(0,2,3,7,5)
print(list1+list2)
print(list1-list2)
print(list1*list2)
print(list1/list2)
print(list1%%list2)
print(list1%/%list2)#round of quotient value
print(list1^list2)




##Logical operators
#Element wise - Logical And(&),Logical NOT(!),Logical OR(|)
list1 = c(1,7,3,4,0)
list2 = c(0,-4,5,7,0)
print(list1&list2)
print(list1|list2)
print(!list1)
#0-> false #1-> true
###################################################################################


##Relational Operators-elementwise

list1 = c(1,7,3,4,5)
list2 = c(0,4,5,7,5)
print(list1<list2)
print(list1>list2)
print(list1<=list2)
print(list1>=list2)
print(list1!=list2)
print(list1==list2)

##Assignment operators
#<-,->,=
a=5
b<-5#left assignment
5->aa#right assignment
a 
a
aa
b
#Miscellaneous Operators 
#1.:
#2.%in%(in is membership operator in python )

l <- 1:700 #Creates a series of numbers in a sequence
l
# %in%---Find out if an element belongs to a vector
v1 <- 3 
v2 <- 12 
t <- 1:10 
print(v1 %in% t) 
print(v2 %in% t) 
t

###################################################################



#Control Structures
#If statement
#if condition,if else,nested if else,nested if

#if(condition){
  
#}


q=200

if(q>100){
  print("Imagecon")
}




q=200

if(q<100){
  print('IMAGECON')
}else{
  print("academy")
}



a1 = 2L

class(a1)
a1=as.character(a1)
class(a1)
a1

if(is.numeric(a1)){       #main if
  print("a1 is numeric")
}else if(is.complex(a1)){
  print("a1 is complex")
}else if(is.character(a1)){
  print("a1 is character")
}else{
  print('a1 is unkonwn')
}


#switch statement
#switch (object,case = action)


a=10
b=5

sw = switch(4,c=a+b,c=a-b,c=a*b,"dont do that")
sw

##Looping
###for loop
#for (variable in vector) 
a=c(1,2,10,89)

for (e in a){
  #c=1+e#e is an iteration variable
  print(e)
}




for (e in c(1,2,10,89)){
  c=1+e                   #e is an iteration variable
  print(c)
}

##While loop
y=0
while(y<=10){
  y=y+1
  print(y)
}

#do same process 
##repeat loop
x=20
repeat{
  print(x)
  x=x+1
  if(x>30){
    break
  }
}

print(x)

#################################################################
#Set of instrection to perform a task
#Functions
#system defined Funtions in R
#function is a collection of instructions

LETTERS[1:26]
letters[1:26]
pi
month.name
month.abb
max(500, 7.7, 30)
min(500, 7.7, 30)
ss=1:5
ss
sum(ss)
prod(ss)
ses=10:25
ses
se=seq(1,3,0.01)
se
sqrt(3)
abs(-2.6)#negative to positive 



ceiling(60.5)#rounds a number upwards to its nearest integer
floor(63.9)#rounds a number downwards to its nearest integer
#user Defined functions










##########-------------evening
function(){
}

#arg
#a=10
#b=10


add = function(a=10,b=5){
  print(a-b)
}


add()
add(2,11)
add(b=2,a=11)




looping = function(){#function creation
  for(i in 1:4){
    print(i*i)
  }
}


looping()#function calling


###############################################################################


##String handling

a='hello'
b='how are you'
c="I hope your all are fine"
p=paste(a,b,c) ##concatenating two or more string
nchar(p) ##counting number of characters in a string
p
A = toupper(a)
a = tolower(A)
a=c('hello','kind','friend')
grepl("hello", a)#check if a character or a sequence of characters are present in a string
A
a


##Grepl() return TRUE if the given pattern is present in the vector. 
#Otherwise, it return FALSE
a='hello'
sub = substring(a,1)
sub




###############################################################################

