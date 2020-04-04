import Foundation

// MARK: - Classes

/*
 Classes must have an initializer
 */
class Dog {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

let dog = Dog(name: "Pipper")
dog.name

/*
 Inheritance
 
 Classes could have properties and functions from a parent class
 */
class Puppy: Dog {
  var age: Int = 0
  
  init(name: String, age: Int) {
    super.init(name: name)
    self.age = age
  }
}

let puppy = Puppy(name: "Bucky", age: 2)
puppy.name
puppy.age

/*
 Override functions
 */
class Pet {
  func noise() {
    print("NOISE")
  }
}

class Cat: Pet {
  override func noise() {
    print("Meow")
  }
}

let cat = Cat()
cat.noise()

/*
 Final classes
 
 It's a class that can't inherit to other classes.
 */
final class iPhone {}

/*
 Copy objects
 
 A diference with the Structs when you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
 */
class Person {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

var ed = Person(name: "Ed")
var mj = ed

mj.name = "MJ"

ed.name
mj.name

/*
 Deinitializers
 */
class Color {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("Out \(name)")
  }
}

for _ in 1...3 {
  let color = Color(name: "red")
  color.name
}

/*
 Mutability
 
 To avoid change the value of the properties of a class the property must have be declare as constant
 */
class Music {
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

var rock = Music(name: "Rock")
let reggae = Music(name: "Reggae")

rock.name
reggae.name
