# Capture lists in Swift: what’s the difference between weak, strong, and unowned references

## Strong capturing

Swift uses strong capturing. This means the closure will capture any external values that are used inside the closure, and make sure they never get destroyed.

## Weak capturing

Swift lets us specify a capture list to determine how values used inside the closure should be captured. The most common alternative to strong capturing is called weak capturing, and it changes two things:

Weakly captured values aren’t kept alive by the closure, so they might be destroyed and be set to nil.
As a result of 1, weakly captured values are always optional in Swift. This stops you assuming they are present when in fact they might not be.

## Unowned capturing

An alternative to weak is unowned, which behaves more like implicitly unwrapped optionals. Like weak capturing, unowned capturing allows values to become nil at any point in the future. However, you can work with them as if they are always going to be there – you don’t need to unwrap optionals.

## Capture lists alongside parameters

When using capture lists and closure parameters together the capture list must always come first, then the word in to mark the start of your closure body – trying to put it after the closure parameters will stop your code from compiling.
