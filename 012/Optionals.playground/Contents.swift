import Foundation

// MARK: - Optionals
var age: Int? = nil

age = 23

age

/*
 Unwrapping optionals
 */
var name: String? = nil

if let unwrapped = name {
  print(unwrapped.count)
} else {
  print("No name")
}

func unwrapName(name: String?) {
  guard let unwrapped = name else {
    print("No name")
    return
  }
  print(unwrapped.count)
}

unwrapName(name: name)

/*
 Force unwrapping
 
 Becarefull with this
 */
let number = "5"
let five = Int(number)!

print(type(of: five))

/*
 Implicitly unwrapped optionals
 */
let year: Int! = nil

/*
 Nil coalescing
 */

func returnOptional() -> Int? {
  let number: Int? = nil
  return number
}

let opNumber = returnOptional() ?? 9

/*
 Optional chaining
 */
let names = ["John", "Paul", "George", "Ringo"]
let numbers: [Int] = [Int]()

let beatle = names.first?.uppercased()
let one = numbers.first

/*
 Optional try
 */
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

/*
 Failable initializers
 */
struct Person {
  var id: String

  init?(id: String) {
    if id.count == 9 {
        self.id = id
    } else {
        return nil
    }
  }
}

let ed = Person(id: "Ed")

/*
 Typecasting
 */
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
