# iExpense

## Why @State only works with Structs

* One of the main diference between Structs and Classes is that classes don't need _mutating_ keyword to change their properties
  * If whe use a class object with @State wrapper, _@State_ won't notice anything and couldn't reload the view
  * To fix this we must use __@ObservedObject__

## Sharing SwiftUI state with @ObjectObserved

* We now take three steps
  * Make a class that conforms to the ObservableObject protocol
  * Mark some properties with @Published so that any views using the class get updated when they change
  * Create an instance of our class using the @ObservedObject property wrapper

## Showing and hiding views

* We can use a __sheet__ to present more views on upside other
* To dismiss this views we can use __@Enviroment__ wrapper
  * Allow is to create properties that store values provided to us externally

## Reading and writting user data

* User Defaults
  * Everything in user defaults will automatically be loaded when your app launches

## Archiving Swift objects with Codable

* We need use __Codable__ protocol and __encode__ method from __JSONEncoder__ instance

## Review

* @Published publishes change announcements automatically.
* @ObservedObject watches for those announcements and refreshes any views using the object.
* sheet() watches a condition we specify and shows or hides a view automatically.
* Codable can convert Swift objects into JSON and back with almost no code from us.
* UserDefaults can read and write data so that we can save settings and more instantly.