# RouterManager

[![CI Status](http://img.shields.io/travis/wanjiehuizhaofang/RouterManager.svg?style=flat)](https://travis-ci.org/wanjiehuizhaofang/RouterManager)
[![Version](https://img.shields.io/cocoapods/v/RouterManager.svg?style=flat)](http://cocoapods.org/pods/RouterManager)
[![License](https://img.shields.io/cocoapods/l/RouterManager.svg?style=flat)](http://cocoapods.org/pods/RouterManager)
[![Platform](https://img.shields.io/cocoapods/p/RouterManager.svg?style=flat)](http://cocoapods.org/pods/RouterManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RouterManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RouterManager"
```

## Author

wallen, 910082734@qq.com


Example

#import "RouterManager.h"

[RouterManager PresentViewConrollerName:@"viewController1" parameters:@{@"label1":@"红色"}];

[RouterManager dismissViewControllerCompletion:^{
NSLog(@"出去啦");
}];


+ (void) pushViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter ;
+ (void) PresentViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter ;
+ (void) popRootViewController;
+ (void) popViewController;
+ (void) popToViewController:(NSString *)aController params:(NSDictionary *)aParams;
+ (void) dismissViewControllerCompletion:(void (^)(void))completion;




## License

RouterManager is available under the MIT license. See the LICENSE file for more info.
