# Bucket list

## Adding conformance to Comparable for custom types

* Comparable protocol, which means it defines a function that takes two integers and returns true if the first should be sorted before the second
* __lhs__ and __rhs__ are coding conventions short for “left-hand side” and “right-hand side”

## Writing data to the documents directory

* iOS makes it very easy to read and write data from device storage, and in fact all apps get a directory for storing any kind of documents we want. Files here are automatically synchronized with iCloud backups, so if the user gets a new device then our data will be restored along with all the other system data

* For writing data we need to use the __write(to:)__ method. When used with strings this takes three parameters:
  * A URL to write to.
  * Whether to make the write atomic, which means “all at once”.
  * What character encoding to use.

## Switching view states with enums

*