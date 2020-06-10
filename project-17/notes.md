# Flashzilla

## How to use gestures in SwiftUI

* __onTapGesture()__ can recive an count parameter to these to make them handle double taps, triple taps, and more
* __onLongPressGesture()__ you can specify a minimum duration for the press, so your action closure only triggers after a specific number of seconds have passed
* For more advanced gestures you should use the gesture() modifier with one of the gesture structs: __DragGesture, LongPressGesture, MagnificationGesture, RotationGesture, and TapGesture__
* SwiftUI will always give the child’s gesture priority
* If you want to change that you can use the __highPriorityGesture()__ modifier to force the parent’s gesture to trigger instead
* __simultaneousGesture()__ modifier to tell SwiftUI you want both the parent and child gestures to trigger at the same time

## Disabling user interactivity with allowsHitTesting()

* SwiftUI lets us control user interactivity in two useful ways, the first of which is the allowsHitTesting() modifier. When this is attached to a view with its parameter set to false, the view isn’t even considered tappable

## How to be notified when your SwiftUI app moves to the background

SwiftUI can detect when your app moves to the background (i.e., when the user returns to the home screen), when it comes back to the foreground, when the user takes a screenshot, and much more. This is all powered by Notification Center, which is the name for Apple’s internal message system – API that lets the system notify us when events happen, but also lets us post messages between different parts of our code.

* UIApplication.significantTimeChangeNotification is called when the user changes their clock or when daylight savings time changes.
* UIResponder.keyboardDidShowNotification is called when the keyboard is shown.

Each of these notifications works in exactly the same way: use onReceive() to catch notifications from the publisher, then take whatever action you want.
