# Cupcake Corner

## Adding Codable conformance for @Published properties

* The @Published property wrapper isn’t magic the name property wrapper comes from the fact that our name property is automatically wrapped inside another type that adds some additional functionality
* In the case of @Published that’s a struct called Published that can store any kind of value
* __CodingKey__ enum that conforms to a special protocol called __CodingKey__, which means that every case in our enum is the name of a property we want to load and save

## Sending and receiving Codable data with URLSession and SwiftUI

* Inside loadData method we need to complete:
  * Creating the URL we want to read
  * Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
  * Create and start a networking task from that URL request.
  * Handle the result of that networking task.

* it’s a much better idea to fetch your data in the background, decode it from JSON in the background, then actually update the property on the main thread to avoid any potential for problems

## Extra

* Really helpful website called [https://reqres.in] – it lets us send any data we want, and will automatically send it back. This is a great way of prototyping network code, because you’ll get real data back from whatever you send
