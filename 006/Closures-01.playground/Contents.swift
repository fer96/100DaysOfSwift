import Foundation

// MARK: - Closures part 1

/// Closure is a function as data type
let driving = {
  print("Driving")
}

driving()

/*
 Accepting parameters inside a closure
 */
let drivingTo = { (place: String) in
  print("Driving to \(place)")
}

drivingTo("Mexico")

/*
 Return values from a closure
 */
let drivingReturn = { (place: String) -> String in
  "Driving to \(place)"
}

let action = drivingReturn("Mexico")
print(action)

/*
 Closure as parameter
 */
func travel(action: () -> Void) {
  action()
}

travel(action: driving)

/*
 Trailing closure sintax
 
 Apply for the last parameter in function
 */
travel() {
  driving()
}
/// Even better
travel {
  driving()
}
