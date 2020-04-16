# Views and modifiers

## Why SwiftUI use structs for views

* Element performance, structs are faster than classes
* SwiftUI encourages us to move to a more functional design approach

## Whats behind the main SwiftUI view

* **Nothing**
* UIHostingController it's a bridge between UIKit and SwiftUI (Don't modify it)

## Why modifier order matters

* SwiftUI apply the modifiers in order that we code

## Why does SwiftUI use some View for its view type

* Returning *some View* has two diferences to just returning *View*:
  * We must always return same type of view
  * Even though we don't know what type of view is going back, the compiler dows
    * TupleView (used in V, Z o H stacks) just handle 10 views but no more

## Custom

* SwiftUI let us create custom Views as properties
* Custom modifiers with a gruop of a specific modifiers and apply for N views
* GridStack

  ```swift
  struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        // more to come
    }
  }```
