import Foundation

/*
 Use var for variables and let for constants
 */

var str = "Hello, playground"
let str2 = "Hello, playground"

str = "Bye, playground"

/*
 Use multiples quotes for string with multiple lines
 */

str = """
  Multilpe
  lines in a
  simple string
  """
      
/*
 Other types are Integers, Doubles and Booleans
 */

var number = 1
var pi = 3.1416
var bool = true

/*
 Use string interpolation
 */

let interpolation = "This is a string interpolation example; number = \(number) and pi = \(pi)"

/*
 Swift use type inference but you can use explicit type
 */

let implicit = 1.0
let explicit: Double = 1.0

