import UIKit

////////////////////////////////////////////////////////// VARIABLES

var str = "Hello, playground"

str = "Hi, playground"

let otherStr = "Hi, Quentin" //otherStr cannot be chnanged

//Strings

let name = "Maxime"

print("Hello " + name)

//Integer (whole number)

var myInt = 8

print(myInt*2)

print(myInt+100)

myInt += 1

myInt /= 5

print("myInt has value \(myInt)")

let age = 21

print("My name is \(name) and I am \(age) years old")

//Doubles and Floats

var a: Double = 8.73

var b: Float = 3.78

var c = 7.38

print(a/c)

// print(a/b) can't combine two different types

print(Double(myInt) + a)


//Boolean

let gameOver = false

var gameOverString = String(gameOver)

//Challenge
let d: Double = 5.76
let i: Int = 8

print("The product of \(d) and \(i) is \(d*Double(i))")


////////////////////////////////////////////////////////// Arrays

var array = [35,36,23,15]

print(array[1])

print(array.count)

array.append(12)

array.remove(at: 1)

array.sort()

print(array)

// Challenge

var array2 = [3.87, 7.1, 8.9]
array2.remove(at: 1)
array2.append(array2[0]*array2[1])

let mixArray: Any = ["Rob", 35, true]

let stringArray = [String]()

////////////////////////////////////////////////////////// Dictionary

var dictionary = ["computer":"Something to play CoD on", "coffee":"The best drink ever"]
print(dictionary["computer"]!)
print(dictionary["house"])
print(dictionary.count)
dictionary["pen"] = "Old fashioned writing implement"
print(dictionary)
dictionary.removeValue(forKey: "computer")
print(dictionary)

var gameCharacters = [String: Decimal]()
gameCharacters["Ghost"] = 8.7
print(gameCharacters)

///Challenge

var menu = ["pizza": 10.99, "ice cream": 4.99, "salad": 7.99]
print("The cost of my meal is \(menu["pizza"]! + menu["ice cream"]!)")


/////////////////////////////////////////////////////////// If statement

let age2 = 13

if age2 > 18
{
    print("You can play !")
}
else
{
    print("You are too young!")
}

//Check someone username

let username = "Kristen"

if username == "rob"{
    print("it's you!")
}
else
{
    print("It's not you!")
}

if username == "rob" && age2 > 18 {
    print("You can play")
}
else if name == "rob"{
    print("Sorry you have to be older !")
}
else{
    print("You aren't rob")
}

if username == "Kristen" || age2>18
{
    print("You can play!")
}

// Boolean with if statement

let isMale = true

if isMale{
    print("You are male!")
}

// Challenge
let username2 = "Quentin"
let password = "haha"

if username2 == "Quentin" && password == "haha" {
    print("They are correct!")
}else if username2 != "Quentin" && password == "haha" {
    print("The username is wrong")
}else if  username2 == "Quentin" && password != "haha"{
    print("The password is wrong")
}else{
    print("They are wrong!")
}

//Random number
let diceRoll = arc4random_uniform(6)

////////////////////////////////////////////////// While loop

var cnt = 1

while cnt <= 10 {
    print(cnt)
    cnt += 1
}

var counter = 1

while counter <= 20 {
    print(counter*7)
    counter += 1
}

var tab = [12,34,67,76]
cnt = 0
while cnt < tab.count {
    tab[cnt] += 1
    cnt += 1
}

print(tab)


////////////////////////////////////////////////////// For loop

let tab2 = [2,17,83,89]

for number in tab2 {
    print(number)
}

// Challenge

let family = ["Blaise","Quentin","Sabine","Céline"]

for f in family{
    print("Hi there \(f) !")
}

//
var  numbers: [Int] = [1,3,5,7]

for (index,value) in numbers.enumerated(){
    numbers[index] = value+1
}
print(numbers)

// Challenge

var myArray: [Double] = [8,7,6,5]

for (index,value) in myArray.enumerated(){
    myArray[index] = value/2
}
print(myArray)

///////////////////////////////////////////// Classes & Objects

class Ghost{
    
    var isAlive = true
    var strength = 9
    
    func kill(){
        isAlive = false
    }
    
    func isStrong() -> Bool {
        if strength > 10{
            return true
        }else{
            return false
        }
    }
    
}

var ghost = Ghost()
print(ghost.isAlive)
ghost.strength = 20
print(ghost.strength)
ghost.kill()
print(ghost.isAlive)
print(ghost.isStrong())

/////////////////////////////////////////////// Optionnals masterclass

var number3 : Int?
print(number3)

let userEntered = "three"

let userEnteredInteger = Int(userEntered)

//let catAge = userEnteredInteger!*7 //Have crash of it's not a number
//OR
if let cat = userEnteredInteger{
    print(cat*7)
}

//////////////////////////////////////////////// Is It Prime

let prime = 17

var isPrime = true

if prime == 1 {
    isPrime = false;
}

var i2 = 2

while i2 < prime {
    if prime%i2==0{
        isPrime = false
    }
    i2 += 1
}

print(isPrime)


