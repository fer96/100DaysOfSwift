# Drawing

## Creating custom paths with Swift UI

* Paths are views like colors, gradients and shapes
* One of the problem of these raw paths: we need to use exact coordinates
* __ShapeStyle__ gives us control over how every line should be connected to the line after it (line join) and how every line should be drawn when it ends without a connection after it (line cap)

## Shapes vs paths in Swift UI

* The key to understanding the difference between Path and Shape is reusability: paths are designed to do one specific thing, whereas shapes have the flexibility of drawing space and can also accept parameters to let us customize them further.
* Shapes measure their coordinates from the bottom-left corner rather than the top-left corner, which means SwiftUI goes the other way around from one angle to the other.

## Adding strokeBorder() support with InsettableShape

* Swift strokes the inside of the circle rather than centering on the line.
