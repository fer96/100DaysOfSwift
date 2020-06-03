# Hot Prospects

## Reading custom values from the environment with @EnvironmentObject

* @EnvironmentObject can place an object into the environment so that any child view can automatically have access to it

## Creating tabs with TabView and tabItem()

* Create an @State property to track the tab that is currently showing.
* Modify that property to a new value whenever we want to jump to a different tab.
* Pass that as a binding into the TabView, so it will be tracked automatically.
* Tell SwiftUI which tab should be shown for each value of that property.

* It’s common to want to use NavigationView and TabView at the same time, but you should be careful: TabView should be the parent view, with the tabs inside it having a NavigationView as necessary, rather than the other way around.

## Understanding Swift’s Result type

``` Swift
enum NetworkError: Error {
  case badURL, requestFailed, unknown
}

func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
  // check the URL is OK, otherwise return with a failure
 guard let url = URL(string: urlString) else {
   completion(.failure(.badURL))
   return
  }

  URLSession.shared.dataTask(with: url) { data, response, error in
// the task has completed – push our work back to the main thread
  DispatchQueue.main.async {
    if let data = data {
// success: convert the data to a string and send it back
      let stringData = String(decoding: data, as: UTF8.self)
      completion(.success(stringData))
    } else if error != nil {
// any sort of network failure
      completion(.failure(.requestFailed))
    } else {
// this ought not to be possible, yet here we are
      completion(.failure(.unknown))
    }
  }}.resume()
}
```

## Manually publishing ObservableObject changes

* For little more control and SwiftUI’s solution is called objectWillChange
* Every class that conforms to ObservableObject automatically gains a property called objectWillChange. This is a publisher, which means it does the same job as the @Published property wrapper: it notifies any views that are observing that object that something important has changed

```Swift
var value = 0 {
  willSet {
    objectWillChange.send()
  }
}

@ObservedObject var updater = DelayedUpdater()
```
