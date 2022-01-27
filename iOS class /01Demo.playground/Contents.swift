import UIKit

var greeting = "Hello, playground"
print("Hello",10,12.05)
print(greeting)

//String interpolation
//\(VariableName)

var language = "Swift"
print("I am going to code in \(language)!!!")

var name = "Saitej"
var pronoun = "I"
print("My name is \(name)!, \(pronoun) scored an A")

var age = 23
print("You are \(age) years old and in another \(age) years, you will be \(age * 2)")

print("""
Hello
World!
Welcome to Coding...
""")

print ("Hello All,\rWelcome to Swift programming")

//let is constant and var is variable
//explicit declaration the dataType
let  welcomeMessage : String = "Hello!"
   print(welcomeMessage , "All")


print("Welcome to Swift Programming")
print("Fall 2021")
print("*************")
print("Welcome to Swift Programming" , terminator : "! " )
print("Fall 2021")

let grade : String = "A"
var perc = 90
print("I am \(name)", terminator : "! ")
print("My grade is \(grade)", terminator : ".\n")
print("\(grade) is \(perc)")


print("The list of numbers are ", terminator: "-")
print(1,2,3,4,5,6)
print("The new pattern is" , terminator: " ")
print(1,2,3,4,5,6, separator: "*")

var mobileBrand = "Apple"
mobileBrand = "Samsung"
print(mobileBrand)



var aage : Int = 23
aage = aage * 2
print(aage)


var aweMessage = "This is Superb!"
print(aweMessage)
print("aweMessage")

var course1 = "iOS"
var course2 = "Java"
print(course1,course2)
print(course1,"-",course2)

print(10,20,30)
print(12.5,15.5)

let pi = 3.14
print(pi)


var httpError  = (errorCode : 404  , errorMessage : "Page Not Found")
print(httpError)
print(httpError.errorCode , terminator : ": ")
print(httpError.errorMessage )


var namee = ("John","Smith")
var fName = namee.0
var lName = namee.1
print(fName , terminator : ",")
print(lName)

var origin = (x : 0 , y : 0)
var point = origin
print(point)
print(point.x, point.y)


let city = (name : "Maryville" , population : "11,000", state : "Missouri")
let ( cityName ,cityPopulation, cityState ) = (city.0 , city.1, city.2)
print(cityName, terminator : ",")
print(cityState)
print(cityPopulation)
