# Core Data Project

## Why does \\.self work for ForEach

* When we use __\\.self__ as an identifier, we mean “the whole object”, Swift computes the hash value of the struct, which is a way of representing complex data in fixed-size values, then uses that hash as an identifier
* Hash values can be generated in any number of ways, but the concept is identical for all hash-generating functions:
  * Regardless of the input size, the output should be the same fixed size
  * Calculating the same hash for an object twice in a row should return the same value
* If we want to make a custom type conform to Hashable, then as long as everything it contains also conforms to Hashable then we don’t need to do any work
* __\\.self__ works for anything that conforms to Hashable, because Swift will generate the hash value for the object and use that to uniquely identify it
* This also works for Core Data’s objects because they already conform to Hashable

## Creating NSManagedObject subclasses

* Core Data is lazy
* Core Data is trying to minimize its memory impact

## Conditional saving of NSManagedObjectContext

* Apple specifically states that we should always check for uncommitted changes before calling save(), to avoid making Core Data do work that isn’t required
* Every managed object is given a __hasChanges__ property, that is true when the object has unsaved changes
* The entire context also contains a __hasChanges__ property that checks whether any object owned by the context has changes

## Ensuring Core Data objects are unique using constraints

* Core Data gives us constraints: we can make one attribute constrained so that it must always be unique
