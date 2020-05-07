# Guess the flag

## VStack, HStack and ZStack

* By default Stacks places little or no spacing between the two views, but we can control the spacing by providing
* Stacks can have a maximum of 10 children – if you want to add more, you should wrap them inside a Group
* Spacer views to push the contents of your stack to one side
* ZStack draws its contents from top to bottom, back to front

  * This means if you have an image then some text ZStack will draw them in that order, placing the text on top of the image

## Gradients

* Gradients are made up of several components:
  * An array of colors to show
  * Size and direction information
  * The type of gradient to use

## Bottons and images

* SwiftUI has a dedicated Image type for handling pictures in your apps, and there are three main ways you will create them:
  * Image("pencil") will load an image called “Pencil” that you have added to your project.
  * Image(decorative: "pencil") will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
  * Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple’s SF Symbols icon collection, and you can search for icons you like – download Apple’s free SF Symbols app from the web to see the full set.

## Showing alert messages

* SwiftUI will automatically set showingAlert back to false when the alert is dismissed