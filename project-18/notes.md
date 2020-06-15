# Layout and geometry

## How layout works in SwiftUI

All SwiftUI layout happens in three simple steps, and understanding these steps is the key to getting great layouts every time. The steps are:

* A parent view proposes a size for its child.
* Based on that information, the child then chooses its own size and the parent must respect that choice.
* The parent then positions the child in its coordinate space.

## Alignment and alignment guides

The simplest alignment option is to use the alignment parameter of a frame() modifier. Remember, a text view always uses the exact width and height required to show its text, but when we place a frame around it that can be any size.
