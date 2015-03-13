## BAColoredIconManager

[![CI Status](http://img.shields.io/travis/Marcus Fleischmann/BAColoredIconManager.svg?style=flat)](https://travis-ci.org/Marcus Fleischmann/BAColoredIconManager)
[![Version](https://img.shields.io/cocoapods/v/BAColoredIconManager.svg?style=flat)](http://cocoadocs.org/docsets/BAColoredIconManager)
[![License](https://img.shields.io/cocoapods/l/BAColoredIconManager.svg?style=flat)](http://cocoadocs.org/docsets/BAColoredIconManager)
[![Platform](https://img.shields.io/cocoapods/p/BAColoredIconManager.svg?style=flat)](http://cocoadocs.org/docsets/BAColoredIconManager)

The BAColoredIconManager is a simple pod that allows you to color PNG icons that are black on transparent background to any color you want on runtime.

### Installation

BAColoredIconManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "BAColoredIconManager"

### Getting Started

#### Example Project
To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Usage
Import BAColoredIconManager/BAColoredIconManagerFactory.h where you want to use the manager.

	#import <BAColoredIconManager/BAColoredIconManagerFactory.h>

Create a manager via the manager factory and set the icon color you want to have. **Note** that you should create multiple manager objects if you want to manage multiple colors at the same time because setting the icon property causes the internal cache to be cleared. Therefore the performance might decrease.
	
	id<BAColoredIconManager> manager = [BAColoredIconManagerFactory createManager];
	
	manager.color = [UIColor redColor];
	
Get a colored image via the manager object. **Note** that the image has to be in the bundle and monochrome black on transparent background. Check the example app if you're not sure on how it should look like.

	UIImage *icon = [manager iconNamed:@"your-black-on-transparent-icon.png"];

### Author

Marcus Fleischmann, marcus@bitartists.com

Credit for the approach on how to color icons at runtime goes to Dominique Siacci from GoodBarber in his [blog post](http://blog.goodbarber.com/Tech-How-we-do-icon-coloration-at-runtime-Objective-C-iOS_a88.html).

### License

BAColoredIconManager is available under the MIT license. See the LICENSE file for more info.

