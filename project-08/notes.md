# Moonshot

## Resizing images to fit the screen

### GeometryReader

* We need use __resizable()__ method to change our image size
* If we want a better looking we must use __aspectRadio()__ method
  * __.fit__ the entire image will fit inside the container
  * __.fill__ the view have no empty parts even if that means some of our image lies outside the container

* __GemoetrReader__ is a view with a __GeometryProxy__

## ScrollView

* If we use __ForEach__ SwiftUI won't wait until you scroll down, SwiftUI creates all the elements
* With a __List__ is like lazily, because only create the elemets when are really needed

## NavigationLink

* If for showing details about user's selection (push way)
* __Sheet()__ if for showing unrelated content (present way)

## Hierarchical Codable data

* The key is create separate types for each level you have
