# GEApplication

![Supported Platforms](https://img.shields.io/cocoapods/p/AXAListView.svg)
[![License](https://img.shields.io/cocoapods/l/AXAListView.svg?style=flat)](https://cocoapods.org/pods/AXAListView)
[![Releases](https://img.shields.io/github/release/haraldbregu/AXAListView.svg)](https://github.com/haraldbregu/AXAListView/releases) 
[![Latest pod release](https://img.shields.io/cocoapods/v/AXAListView.svg)](http://cocoapods.org/pods/axalistview)
[![Build Status](https://api.travis-ci.org/haraldbregu/AXAListView.svg?branch=master)](https://travis-ci.org/haraldbregu/AXAListView) 
[![Twitter](https://img.shields.io/badge/Twitter-@HaraldBregu-blue.svg?style=flat)](https://twitter.com/HaraldBregu)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.me/haraldbregu)

## About
This library is maintained by Harald Bregu.<br>
I'm specialized in the designing and coding of custom UI for iOS Apps and Developing New Patterns.<br>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

GEApplication is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GEApplication'
```
```swift
// Add Listener 
GEApplication.current.addListener(self) { application in
    
}
```
```swift
// Remove Listener 
GEApplication.current.removeListener(self)
```

```swift
// Add event to application and send signal to the listener 
let event = GAEvent()
event.name = "User did tap the help button"
GEApplication.current.sendEvent(event)
```

## Flow of events

To start using this library first you need to understand the logic behind. First add listener to each Controller or views and after you can send events to the GEApplication. Every time you send event a signal is sent to each listener. 

<p align="center" >
<img src="https://raw.githubusercontent.com/HaraldBregu/GEApplication/master/HowItWork.png" alt="GEApplication" title="GEApplication">
</p>

## Requirements
- iOS 9.0+
- Xcode 9

## Author

Harald Bregu, harald.bregu@gmail.com

## License

GEApplication is available under the MIT license. See the LICENSE file for more info.
