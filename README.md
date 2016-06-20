# KeyboardResize
[![Version](https://img.shields.io/cocoapods/v/KeyboardResize.svg?style=flat)](http://cocoapods.org/pods/KeyboardResize)
[![License](https://img.shields.io/cocoapods/l/KeyboardResize.svg?style=flat)](http://cocoapods.org/pods/KeyboardResize)
[![Platform](https://img.shields.io/cocoapods/p/KeyboardResize.svg?style=flat)](http://cocoapods.org/pods/KeyboardResize)

KeyboardResize is a library that automatically resizes the view of your controllers when the keyboard appears.

## Installation

```ruby
pod 'KeyboardResize', '~> 1.0'
```

## Usage

```swift
import KeyboardResize

override func viewDidLoad() {
    super.viewDidLoad()

    kr_resizeViewWhenKeyboardAppears = true
}
```

## License

KeyboardResize is available under the MIT license. See the LICENSE file for more info.
