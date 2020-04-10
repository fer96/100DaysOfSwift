# [016] We Split

## Basic structure of SwiftUI

* AppDelegate: contains code for managing our app
* SceneDelegate: contains code for launching one window in your app. On iPad where users can have multiple instances of your app open at the same time is important
* ContentView: contains the initial user interface (UI) for your program
* Assets.xcassets: is an asset catalog
* LaunchScreen.storyboard: is a visual editor for creating a small piece of UI to show when your app is launching
* Info.plist: is a collection of special values that describe to the system how your app works
* Preview Content is a yellow group, with Preview Assets.xcassets inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running

## Modifying program state

* @State: allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified. 
* Apple recommends we add private access control to those properties

## Binding state to user interface controls

* When you see a dollar sign before a property name, remember that it creates a two-way binding: the value of the property is read, but also written.

## Creating views in a loop

* ForEach: doesn’t get hit by the 10-view limit that would affect us if we had typed the views by hand.