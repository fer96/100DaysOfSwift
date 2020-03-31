import Foundation

// MARK: - Operators and Conditions

/*
 Arithmetic Operators
 */

let value: Float = 5.0
let secondValue: Float = 4.0

value + secondValue
value - secondValue
value * secondValue
value / secondValue
Int(value) % Int(secondValue)

/*
 Operator overloading
 
 You can't use '+' between diferent types
 */
let text = "Hi"
let secondText = "homms"

text + secondText

let names = ["Fer"]
let secondNames = ["De La Rosa"]

names + secondNames

/*
 Compound assignment operators
 */

var score = 0
var scoreText = "score"

score += 5
score -= 1
score *= 3
score /= 2
scoreText += " <- resutl"

/*
 Comparasion operators
 
 Also with strings --> Alphabetical order
 */

value == secondValue
value != secondValue
value < secondValue
value >= secondValue
text < secondText

/*
 Conditions
 */

if value + secondValue == 9 {
  print("Yep is 9")
} else if value + secondValue == 10 {
  print("Are you sure that is 10?")
} else {
  print("Just for fun")
}

/*
 Combining conditions
 */

let age = 23
let secondAge = 24

if age > 24 && secondAge >= 24 {
  print("Both are older than 24")
}

if age > 24 || secondAge >= 24 {
  print("One of them is older than 24")
}

/*
 Ternary operator
 
 Is an if in one line
 */

print(value > secondValue ? "Yep \(value) is greater than \(secondValue)" : "Its false")

/*
 Switch statements
 
 You can execute nexts case if you use 'fallthrough' at the end of the case
 */
enum Colors {
  case red
  case green
  case blue
}

let color: Colors = .red

switch color {
case .red:
  print("It's red")
default:
  print("No is red")
}

let optionalColor: Colors? = nil

switch optionalColor {
case .red:
  print("It's red")
case .blue:
  print("It's blue")
case .green:
  print("It's green")
case .none:
  print("There is no color")
}

/*
 Range operators
 */
let min = 85

switch min {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
