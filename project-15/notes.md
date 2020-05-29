# Accessibility

## Identifying views with useful labels

* We can control what VoiceOver reads for a given view by attaching two modifiers __.accessibility(label:)__ and __.accessibility(hint:)__ 
* They both take text views containing anything we want, but they serve different purposes

## Hiding and grouping accessibility data

* We can tell SwiftUI that a particular image is just there to make the UI look better by using __Image(decorative:)__
* __.accessibilityElement(children:)__ modifier comes in: we can apply it to a parent view, and ask it to combine children into a single accessibility element
* Better solution here is to use __.accessibilityElement(children: .ignore)__ so the child views are invisible to VoiceOver, then provide a custom label to the parent

## Reading the value of controls

* For slider you can override the value VoiceOver reads out by using the __accessibility(value:)__ modifier to provide some alternative text
