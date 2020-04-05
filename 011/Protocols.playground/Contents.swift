import Foundation

// MARK: - Protocols

/*
 Are a way of describing what properties and methods something must have.
 */
protocol Id {
  var name: String { get set }
}

struct User: Id {
  var name: String
}

let user = User(name: "Edd")

func displayName(_ thing: Id) {
  print(thing.name)
}

displayName(user)

/*
 Protocol Inheritance
 */
protocol Secret: Id {
  var password: String { get set }
}

/*
 Extensions
 */
extension Int {
  func square() -> Int {
    self * self
  }
}

let number: Int = 3
number.square()

/*
 Protocol extension
 */
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

/*
 Protocol-oriented programming
 */
protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct Person: Identifiable {
    var id: String
}

let twostraws = Person(id: "twostraws")
twostraws.identify()
