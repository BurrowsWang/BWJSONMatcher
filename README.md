BWJSONMatcher
=========
![Platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)
![Pod Version](https://img.shields.io/badge/pod-v1.0.2-green.svg)
![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-yellowgreen.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

BWJSONMatcher is a lightweight library which helps you easily match a JSON string or JSON object up with your data model.

It provides:

- A universal `JSON Matcher` that matches a JSON string or JSON object up with your data model
- A `catalog` based on `NSObject`, helps you easily transform JSON with any object
- A `protocol`, to which your data model should conforms

How To Use
----------
API documentation is available at [CocoaDocs - BWJSONMatcher](http://cocoadocs.org/docsets/BWJSONMatcher/)

The sample of DataModel or ValueObject can be found [here](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTestModel.h). And the counterpart JSON string can be inferred [here](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTests.m#L52).

#### Working with NSObject+BWJSONMatcher (Recommend)
```objective-c
#import "NSObject+BWJSONMatcher.h"

...
NSString *jsonString = @"{your-json-string}";
YourValueObject *dataModel = [YourValueObject fromJSONString:jsonString];

NSDictionary *jsonObject = @{your-json-object};
YourValueObject *dataModel = [YourValueObject fromJSONObject:jsonObject];
...
YourValueObject *dataModel = instance-of-your-value-object;
NSString *jsonString = [dataModel toJSONString];
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
YourValueObject *dataModel = instance-of-your-value-object;
NSDictionary *jsonObject = [BWJSONMatcher convertObjectToJSON:dataModel];
...

```

#### How to handle property with type NSArray
As with the example [here](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTestModel.h#L39), if you have a property with type NSArray, make your ValueObject conforms to the protocol [`BWJSONValueObject`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTestModel.h#L19) and implement method [`typeInProperty:`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTestModel.m#L29), tell BWJSONMatcher which type of object will be included in this array.

```objective-c
- (Class)typeInProperty:(NSString *)property {
    if ([property isEqualToString:@"parray"]) {
        return [TestModelB class];
    }
    
    return nil;
}
```

#### How to ignore certain properties
In some cases, there will be certain properties which don't need to be extracted from json data. Provide the property names you want to ignore in class method [`ignoredProperties`](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTestModel.m#L76), BWJSONMatcher will ignore these properties when matching json data with your ValueObject.

```objective-c
+ (NSArray *)ignoredProperties {
    return @[@"pint", @"pmodelc"];
}
```

Further detailed examples can be found [here](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/BWJSONMatcherTests/BWJSONMatcherTests.m#L87).

Installation
------------
#### Installation with CocoaPods (Recommend)

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

```ruby
platform :ios, '6.0'

pod 'BWJSONMatcher', '~>1.0.2'
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
- Importing the project as a static library, PS: ADD `-ObjC` TO BUILD SETTING _Other Linker Flags_

License
-------------------
All source code is licensed under the [MIT License](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/LICENSE).
