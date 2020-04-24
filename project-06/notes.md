# Animation

## Implicit animations

* CGFloat is a Double under a different name, but on older hardware it uses a smaller type of number storage called Float
* CGFloat allowed Apple not to care about which type of hardware we were building for
* That asks SwiftUI for a default animation, and immediately you’ll see that tapping the button now causes it to scale up with an animation

```Swift
.animation(.default)
```

## Custom animation

* The animation() modifier can be applied to any SwiftUI binding, which causes the value to animate between its current and new value. This even works if the data in question isn’t really something that sounds like it can be animated, such as a Boolean

* SwiftUI is examining the state of our view before the binding changes, examining the target state of our views after the binding changes, then applying an animation to get from point A to point B
