# Guess the flag

Later, introduced retina HD screens that have a 3x resolution, and these follow the same naming convention: hello@2x.png is for retina devices, and hello@3x for retina HD devices. You still just write “hello” in your code and user interfaces, and iOS does the rest.

You might think this sounds awfully heavy – why should a retina device have to download apps that include Retina HD content that it can’t show? Fortunately, the App Store uses a technology called app thinning that automatically delivers only the content each device is capable of showing – it strips out the other assets when the app is being downloaded, so there’s no space wasted.

* __CALayer__, which is a Core Animation data type responsible for managing the way your view looks.

CALayer has its own way of setting colors called CGColor, which comes from Apple's Core Graphics framework. This, like CALayer, is at a lower level than UIButton, so the two can talk happily – again, as long as you're happy with the extra complexity.

You can create your own color like this:

```Swift
  UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
```
