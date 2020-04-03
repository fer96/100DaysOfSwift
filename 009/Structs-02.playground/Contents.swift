import Foundation

// MARK: - Structs part 2

/*
 Initializers
 */
struct User {
  var name: String
  
  init() {
    name = "***"
  }
}

let user = User()
user.name

/*
 Referring to the current instance
 */
struct Doggo {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

let puppy = Doggo(name: "Pipper")
puppy.name

/*
 Lazy properties
 
 Only create the property when it's first access
 */
struct Color {
  var name: String
  lazy var shadow: Int = 0
}

var red = Color(name: "Red")
red.shadow

/*
 Static properties and methods
 */
struct Student {
  static var classSize: Int = 0
  var name: String
  
  init(name: String) {
    self.name = name
    Student.classSize += 1
  }
}

let student = Student(name: "Edd")
Student.classSize

/*
 Acces control
 
 Check this `https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html`
 */
struct UserControl {
  private var password: String
  
  init(pass: String) {
    password = pass
  }
  
  func getPassword() -> String {
    password
  }
}

let control = UserControl(pass: "pass123")
