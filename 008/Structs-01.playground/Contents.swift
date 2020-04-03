import Foundation

// MARK: - Structs part 1

/*
 Creating Structs
 */
struct Sport {
  var name: String
}

let tennis = Sport(name: "Tennis")
tennis.name

/*
 Computed properties
 
 A property that runs code to figure out its value
 */
struct Animal {
  var race: String
  var isBig: Bool
  
  var canGrowUpAtHome: String {
    if isBig {
      return "No, this animal can't grow up at home"
    } else {
      return "Yes, this animal can grow up at home"
    }
  }
}

let lion = Animal(race: "Lion", isBig: true)
lion.canGrowUpAtHome

/*
 Property observers
 
 Run your code before and after any property change
 */
struct Color {
  var name: String
  var brightness: Int {
    didSet {
      print("\(name) has now \(brightness)%")
    }
    willSet {
      print("\(name) had \(brightness)%")
    }
  }
}

var red = Color(name: "Red", brightness: 10)
red.brightness = 20
red.brightness = 30

/*
 Methods inside Structs
 */
struct City {
  var population: Int
  func collectTaxes() -> Int {
    population * 100
  }
}

let cdmx = City(population: 10_000_000)
cdmx.collectTaxes()

/*
 Mutating methods
 */
struct Person {
  var name: String
  
  mutating func makeAnonymous() {
    self.name = "****"
  }
}

var person = Person(name: "Edd")

print(person.name)
person.makeAnonymous()
print(person.name)

/*
 Data types as String or Arrays in fact are Structs!!!!
 */
