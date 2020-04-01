import Foundation

// MARK: - Loops

/*
 For loops
 */
let numbers =  1...10

for number in numbers {
  print(number)
}

/*
 While loops
 */
var min = 1

while min <= 3 {
  print(min)
  min += 1
}

/*
 Repeat loops
 */
repeat {
  print(min)
  min += 1
} while min <= 5

print(min)

/*
 Exiting loops
 */

while min <= 10 {
  print(min)
  if min == 9 {
    break
  } else {
    min += 1
  }
}

/*
 Exiting nested loops
 */
outerLoop: for number in numbers {
  print(number)
  innerLoop: for innerNumber in numbers {
    print(number, innerNumber)
    if innerNumber == 9 {
      break innerLoop // or just break
    } else if number == 5 {
      break outerLoop
    }
  }
}

/*
 Skipping items
 */
for number in numbers {
  if number % 2 == 0 {
    continue
  }
  print(number)
}
