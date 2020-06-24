# StormViewer

## Multi-window support is happening

This is a result of the new multi-window support that landed with iPadOS, and effectively splits the work of the app delegate in two.

From iOS 13 onwards, your __app delegate__ should:

* Set up any data that you need for the duration of the app.
* Respond to any events that focus on the app, such as a file being shared with you.
* Register for external services, such as push notifications.
* Configure your initial scenes.

__Scene delegates__ are there to handle one instance of your app’s user interface. So, if the user has created two windows showing your app, you have two scenes, both backed by the same app delegate.

_Keep in mind that these scenes are designed to work independently from each other. So, your application no longer moves to the background, but instead individual scenes do – the user might move one to the background while keeping another open._
