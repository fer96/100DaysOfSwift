# Layout and geometry

## How layout works in SwiftUI

All SwiftUI layout happens in three simple steps, and understanding these steps is the key to getting great layouts every time. The steps are:

* A parent view proposes a size for its child.
* Based on that information, the child then chooses its own size and the parent must respect that choice.
* The parent then positions the child in its coordinate space.

## Alignment and alignment guides

The simplest alignment option is to use the alignment parameter of a frame() modifier. Remember, a text view always uses the exact width and height required to show its text, but when we place a frame around it that can be any size.

## Absolute positioning for SwiftUI views

SwiftUI gives us two ways of positioning views: absolute positions using position(), and relative positions using offset()

Three step layout process of SwiftUI:

* A parent view proposes a size for its child.
* Based on that information, the child then chooses its own size and the parent must respect that choice.
* The parent then positions the child in its coordinate space.

## Understanding frames and coordinates inside GeometryReader

SwiftUI’s three-step layout system when working with GeometryReader: parent proposes a size for the child, the child uses that to determine its own size, and parent uses that to position the child appropriately.

Which coordinate space you want to use depends on what question you want to answer:

* Want to know where this view is on the screen? Use the global space.
* Want to know where this view is relative to its parent? Use the local space.
* What to know where this view is relative to some other view? Use a custom space.
