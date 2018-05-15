#Assignment 3.4

#Question 1. Import the Titanic Dataset from the link Titanic Data Set.
#Perform the following:
# a. Is there any difference in fares by different class of tickets?
#  Note - Show a boxplot displaying the distribution of fares by class
#  b. Is there any association with Passenger class and gender?
#  Note - Show a stacked bar chart

#Answer1  
#a)

#use titanic dataset
TitanicData <- read.csv("C:/Users/mudassar/Desktop/farha/train.csv", header=FALSE)
View(TitanicData)#Perform the following:
Titanic <- TitanicData
#a
library(reshape)
Titanic = rename (Titanic, c(V1 = "PassengerId",
                             V2 = "Survived",
                             V3 = "Pclass",
                             V4 = "Name",
                             V5 = "Sex",
                             V6 = "Age",
                             V7 = "SinSP",
                             V8 = "Parch",
                             V9 = "Ticket",
                             V10 = "Fare",
                             V11 = "Cabin",
                             V12 = "Embarked"))
Titanic$Pclass <- as.factor(Titanic$Pclass)
Titanic$Name <- as.character(Titanic$Name)
boxplot(Fare~Pclass,data= Titanic,
        main="Fares Versus Pclass",xlab="Fares",ylab="PClass",col=topo.colors(3))
#b
#stacked bar chart

counts=table(Titanic$Sex,Titanic$Pclass)
barplot(counts, main = "Distribution of Class by gender", xlab="Pclass", col=c("blue", "red"), legend = c("Female","Male"), names.arg = c("Pclass1st", "Pclass2nd","Pclass3rd"))

#we can do chisq test also for checking association
chisq.test(titanic$pclass ,titanic$sex)