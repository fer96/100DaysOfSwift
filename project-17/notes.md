# Flashzilla

## How to use gestures in SwiftUI

* __onTapGesture()__ can recive an count parameter to these to make them handle double taps, triple taps, and more
* __onLongPressGesture()__ you can specify a minimum duration for the press, so your action closure only triggers after a specific number of seconds have passed
* For more advanced gestures you should use the gesture() modifier with one of the gesture structs: __DragGesture, LongPressGesture, MagnificationGesture, RotationGesture, and TapGesture__
* SwiftUI will always give the child’s gesture priority
* If you want to change that you can use the __highPriorityGesture()__ modifier to force the parent’s gesture to trigger instead
* __simultaneousGesture()__ modifier to tell SwiftUI you want both the parent and child gestures to trigger at the same time


## Making vibrations with UINotificationFeedbackGenerator and Core Haptics

## Disabling user interactivity with allowsHitTesting()
