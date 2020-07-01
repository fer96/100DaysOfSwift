# WebView

## Delegate

A delegate is one thing acting in place of another, effectively answering questions and responding to events on its behalf.

_In our example, we're using WKWebView: Apple's powerful, flexible and efficient web renderer. But as smart as WKWebView is, it doesn't know (or care) how our application wants to behave, because that's our custom code._

When you do this, two things happen:

* You must conform to the protocol. This is a fancy way of saying, "if you're telling me you can handle being my delegate, here are the methods you need to implement."
* Any methods you do implement will now be given control over the WKWebView's behavior. Any you don't implement will use the default behavior of WKWebView.
