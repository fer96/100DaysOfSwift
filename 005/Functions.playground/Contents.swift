import Foundation

// MARK: - Functions

func sayHi() {
  print("Hi")
}

sayHi()

/*
 Accepting parameters
 */
func double(of: Int) {
  print(of * 2)
}

double(of: 2)

/*
 Return values
 */

func square(of number: Int) -> Int {
  number * number
}
 let pow = square(of: 9)

/*
 Omitting parameter
 */
func greet(_ person: String) {
  print("Hi \(person)")
}

greet("Fer")

/*
 Default parameters
 */
func count(to: Int = 3) {
  for number in 0...to {
    print(number)
  }
}

count()
count(to: 5)

/*
 Varidic functions
 
 Accept any numbers of parameters exemple func print
 */
func square(numbers: Int...) {
  for number in numbers {
    print(number * number)
  }
}

square(numbers: 1, 2, 3, 4)

/*
 Throwing functions
 */
enum ServiceError: Error {
  case badRequest
}

func responseService(with error: Bool) throws -> Bool {
  if error {
    throw ServiceError.badRequest
  }
  return true
}

do {
  try responseService(with: true)
  print("Response success")
} catch {
  print("Error")
}

/*
 Inout parameters
 
 All parameters are passed as constants
 */
func changeValue(number: inout Int) {
  number = 9
}

var number = 5

changeValue(number: &number)
print(number)
