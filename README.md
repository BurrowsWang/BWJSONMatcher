BWJSONMatcher
=========
![Platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)
![Pod Version](https://img.shields.io/badge/pod-v1.1.1-brightgreen.svg)
![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

BWJSONMatcher is a lightweight Objective-c library which helps you easily match a JSON data or JSON string or JSON object up with your data model.

It provides:

- A universal `JSON Matcher` that matches a JSON data or JSON string or JSON object up with your data model
- A `catalog` based on `NSObject`, helps you easily transform JSON with any object
- Three `protocols`, to which your data model should conforms

How To Use
----------
API documentation is available at [CocoaDocs - BWJSONMatcher](http://cocoadocs.org/docsets/BWJSONMatcher/).

[Sample project](https://github.com/BurrowsWang/BWJSONMatcher/archive/master.zip) can be found [here](https://github.com/BurrowsWang/BWJSONMatcher/tree/master/Examples/).

#### Working with NSObject+BWJSONMatcher (Recommend)
```objective-c
#import "NSObject+BWJSONMatcher.h"

...
// convert json data to data model
NSData *jsonData = your-json-bytes;
YourValueObject *dataModel = [YourValueObject fromJSONData:jsonData];

// convert json string to data model
NSString *jsonString = @"{your-json-string}";
YourValueObject *dataModel = [YourValueObject fromJSONString:jsonString];

// convert json object to data model
NSDictionary *jsonObject = @{your-json-object};
YourValueObject *dataModel = [YourValueObject fromJSONObject:jsonObject];

...
YourValueObject *dataModel = instance-of-your-value-object;

// convert data model to json data
NSData *jsonData = [dataModel toJSONData];
// convert data model to json string
NSString *jsonString = [dataModel toJSONString];
// convert data model to json object
NSDictionary *jsonObject = [dataModel toJSONObject];
...

```

#### Working with BWJSONMatcher
```objective-c
#import "BWJSONMatcher.h"

...
NSDictionary *jsonObject = @{your-json-object};
YourValueObject *dataModel = [BWJSONMatcher matchJSON:jsonObject withClass:[YourValueObject class]];

...
NSString *jsonString = "[{your-json-string}, ...]";
NSArray *jsonArray = [BWJSONMatcher matchJSONString:jsonObject withClass:[YourValueObject class]];

...
YourValueObject *dataModel = instance-of-your-value-object;
NSDictionary *jsonObject = [BWJSONMatcher convertObjectToJSON:dataModel];
...

```

#### How to handle property with type NSArray
As with the example [here](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/Examples/BWJSONMatcher%20Demo/BWJSONMatcher%20Demo/ValueObjects/FacebookPageInfo.h#L22), if you have a property with type NSArray, make your ValueObject conforms to the protocol [`BWJSONHasArrayProperties`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/Examples/BWJSONMatcher%20Demo/BWJSONMatcher%20Demo/ValueObjects/FacebookPageInfo.h#L17) and implement the method [`typeInProperty:`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/Examples/BWJSONMatcher%20Demo/BWJSONMatcher%20Demo/ValueObjects/FacebookPageInfo.m#L13), tell BWJSONMatcher which type of object will be included in this array.

```objective-c
- (Class)typeInProperty:(NSString *)property {
    if ([property isEqualToString:@"emails"]) {
        return [NSString class];
    }
    
    return nil;
}
```

#### How to ignore certain properties
In some cases, there will be certain properties which don't need to be extracted from json data. Make your ValueObject conforms to the protocol [`BWJSONHasIgnoredProperties`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/Examples/BWJSONMatcher%20Demo/BWJSONMatcher%20Demo/ValueObjects/FacebookPageInfo.h#L40), provide the property names you want to ignore in class method [`ignoredProperties:`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/Examples/BWJSONMatcher%20Demo/BWJSONMatcher%20Demo/ValueObjects/FacebookPageInfo.m#L33), BWJSONMatcher will ignore these properties when matching json data with your data model.

```objective-c
+ (NSArray *)ignoredProperties {
    return @[@"street", @"valet"];
}
```

Installation
------------
#### Installation with CocoaPods (Recommend)

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

```ruby
platform :ios, '6.0'

pod 'BWJSONMatcher', '~>1.1.1'
```

### Installation with Carthage (iOS 8+)

[Carthage](https://github.com/Carthage/Carthage) is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods.

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage)

```ruby
github "BurrowsWang/BWJSONMatcher"
```

#### Other Ways
- Copying all the files into your project
- Importing the project as a dynamic framework, PS: ADD FRAMEWORK TO `Embedded Binaries`
- Importing the project as a static library, PS: ADD `-ObjC` TO BUILD SETTING `Other Linker Flags`

License
-------------------
All source code is licensed under the [MIT License](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/LICENSE).
