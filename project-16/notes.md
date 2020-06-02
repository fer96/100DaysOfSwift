# Hot Prospects

## Reading custom values from the environment with @EnvironmentObject

* @EnvironmentObject can place an object into the environment so that any child view can automatically have access to it

## Creating tabs with TabView and tabItem()

* Create an @State property to track the tab that is currently showing.
* Modify that property to a new value whenever we want to jump to a different tab.
* Pass that as a binding into the TabView, so it will be tracked automatically.
* Tell SwiftUI which tab should be shown for each value of that property.

* It’s common to want to use NavigationView and TabView at the same time, but you should be careful: TabView should be the parent view, with the tabs inside it having a NavigationView as necessary, rather than the other way around.
