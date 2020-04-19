# Better Rest

## Stepper

* Steppers are smart enough to work with any kind of number type you like (Int, Double, and more) and it will automatically adapt.

```Swift
/*
  - Value: value to display
  - In: a range to set the minimum and maximum
  - Step: a value to increase or decrease
*/
Stepper(value: $value, in: min...max, step: value)
```

## Data picker

* Use a Date picker inseide a **Form** to get a better UI

```Swift
Form {
  DatePicker("Please enter a date", selection: Date())
}
```

* Date pickers provide us with a couple of configuration options that control how they work

  * If you don’t provide this parameter, users see a day, hour, and minute.
  * If you use **.date** users see month, day, and year.
  * If you use **.hourAndMinute** users see just the hour and minute components.

* We can create a range using Date type

```Swift
DatePicker("Please enter a date", selection: Date(), in: Date()...)
```

## Working with dates

* Tip: use command "cal" in your terminal to display a little calendar, even better

```prompt
cal month year
```

* DateComponents lets us read or write specific parts of a date rather than the whole thing

```Swift
let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
let hour = components.hour ?? 0
let minute = components.minute ?? 0
```

* DateFormatter, and it lets us convert a date into a string in a variety of ways

```Swift
let formatter = DateFormatter()
formatter.timeStyle = .short
let dateString = formatter.string(from: Date())
```

## Create ML (Machine Learning)

* Create ML added “easy to do” to the list, and then a second year later Apple introduced a Create ML app that made the whole process drag and drop

* Create ML doesn’t actually care what the values are, it only cares what the relationships are between data
