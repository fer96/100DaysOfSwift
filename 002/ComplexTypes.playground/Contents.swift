import Foundation

// MARK: - Complex types

/*
 Arrays store items in the order you add them, and you access them using numerical positions.
 */
let one = 1
let two = 2
let three = 3

let numbers = [one, two, three]

let uno = numbers[0]
let dos = numbers[1]
let tres = numbers[2]

/*
 Sets store items without any order, so you can’t access them using numerical positions.
 Sets don't have mora than once the same value
 */
let colors = Set(["red", "green", "blue"])
let colores = Set(["red", "red", "green", "green", "blue", "blue"])

/*
 Tuples are fixed in size, and you can attach names to each of their items.
 You can read items using numerical positions or using your names.
 */
let person = (name: "Fernando", lastName: "De La Rosa")
let name = person.name
let nombre = person.0

/*
 Dictionaries store items according to a key, and you can read items using those keys.
 Get default value when dictionarie does not found a key.
 */
let heights = [
  "Fernando": 1.80,
  "Bolt": 1.92,
]

let boltHeight = heights["Bolt"]
let unknowHeight = heights["MJ", default : 0.0]

/*
 Enums are a way of grouping related values so you can use them without spelling mistakes.
 Enum associated values let us add those additional details.
 */
enum Platform {
  case swift(platform: String)
  case python(platform: String)
}

enum Lenguages: String {
  case swift
  case python = "Python"
}

let ios = Platform.swift(platform: "iOS")
let swift = Lenguages.swift.rawValue
let python = Lenguages.python.rawValue
