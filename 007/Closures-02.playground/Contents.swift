import Foundation

// MARK: - Closures part 2

let drivingTo = { (place: String) in
  print("Driving to \(place)")
}

let drivingReturn = { (place: String) -> String in
  "Driving to \(place)"
}

/*
 Using closures as parameters when they accept parameters
 */
func travelTo(action: (String) -> Void) {
  action("Mexico")
}

travelTo { (place: String) in
  drivingTo(place)
}

/*
 Using closures as parameters when they return values
 */
func travelReturn(action: (String) -> String) {
  let result = action("Mexico")
  print(result)
}

travelReturn { (place: String) -> String in
  return drivingReturn(place)
}

/*
 Shorthand parameter names
 */
travelReturn { (place) -> String in
  return drivingReturn(place)
}
/// Even better
travelReturn { place -> String in
  return drivingReturn(place)
}
/// Even better
travelReturn { place in
  return drivingReturn(place)
}
/// If the function has only one line we can revome keyword 'return'
travelReturn { place in
  drivingReturn(place)
}
/// More short but a little tricky
travelReturn {
  drivingReturn($0)
}

/*
 Closures with multiple parameters
 */
func travelMultiple(action: (String, Int) -> String) {
  action("Mexico", 9)
}

travelMultiple { (place, number) -> String in
  "I've visit \(place) \(number) times"
}

travelMultiple {
  "I've visit \($0) \($1) times"
}

/*
 Retur closure from functions
 */
func travel() -> (String) -> Void {
  return {
    print("I'm going to \($0)")
  }
}

let result = travel()
result("Mexico")

/*
 Capturing values
 */
func travelCapturing() -> (String) -> Void {
  var count = 1
  return {
    print("\(count). \($0)")
    count += 1
  }
}

let resultCount = travelCapturing()
resultCount("Mexico")
resultCount("Mexico")
resultCount("CDMX")
resultCount("CDMX")
