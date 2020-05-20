# Instafilter

## How property wrappers become structs

* We can’t modify properties in our views because they are structs, and are therefore fixed

## Integrating Core Image with SwiftUI

* If we want to use Core Image hen SwiftUI’s images aren’t up to the job
* Apple gives us three other image types to work with, and cunningly we need to use all three if we want to work with Core Image:
  * __UIImage__ which comes from UIKit, is the standard image type for UIKit, and of the three it’s closest to SwiftUI’s Image type
  * __CGImage__ which comes from Core Graphics. This is a simpler image type that is really just a two-dimensional array of pixels
  * __CIImage__ which comes from Core Image. This stores all the information required to produce an image but doesn’t actually turn that into pixels unless it’s asked to
* We can create a UIImage from a CGImage, and create a CGImage from a UIImage
* We can create a CIImage from a UIImage and from a CGImage, and can create a CGImage from a CIImage
* We can create a SwiftUI Image from both a UIImage and a CGImage

## Wrapping a UIViewController in a SwiftUI view

* Wrapping a __UIKit__ view controller requires us to create a struct that conforms to the __UIViewControllerRepresentable__ protocol
* __makeUIViewController()__ is responsible for creating the initial view controller
* __updateUIViewController()__ is designed to let us update the view controller when some SwiftUI state changes

## Using coordinators to manage SwiftUI view controllers

* SwiftUI’s __coordinators__ are designed to act as delegates for UIKit view controllers. Remember, __delegates__ are objects that respond to events that occur elsewhere
* SwiftUI’s __coordinators__ are nothing like the __coordinator pattern__ many developers used with UIKit
