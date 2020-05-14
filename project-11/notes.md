# Bookworm

## Creating a custom component with @Binding

* __@State__ property wrapper lets us work with local value types
* __@ObservedObject__ lets us work with shareable reference types
* __@Binding__ which lets us connect an @State property of one view to some underlying model data
* __@Binding__ it allows us to create a two-way connection

## Using size classes with AnyView type erasure

* SwiftUI gives each of our views access to a shared pool of information known as the __environment__
* This environment is actually packed full of interesting things we can read to help make our apps work better
  * Core Data
  * Size classes

* Size classes are Apple’s thoroughly vague way of telling us how much space we have for our views
* __AnyView__ conforms __View__ protocol but anyView don't expose what it contains
* When SwiftUI knows exactly what’s in our view hierarchy, it can add and remove small parts trivially as needed
* If we use AnyView we’re actively denying SwiftUI that information so it’s generally best to avoid AnyView unless you specifically need it

## How combine Core Data and SwiftUI

* Core Data is an object graph and persistence framework
  * Which is a fancy way of saying it lets us define objects and properties of those objects, then lets us read and write them from permanent storage
* In Core Data __entities__ are like classes or structs and __attributes__ are their properties
* __@FetchRequest__ it’s another property wrapper this fetch request stays up to date over time, so that as Objects are created or removed our UI stays synchronized
