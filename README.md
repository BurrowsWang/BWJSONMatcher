BWJSONMatcher
=========
![Platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)
![Pod Version](https://img.shields.io/badge/pod-v1.0.0-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

BWJSONMatcher is a lightweight library which helps you easily match a JSON string or JSON object up with your data model.

It provides:

- A universal JSON Matcher that matches a JSON string or JSON object up with your data model
- A catalog based on NSObject, helps you easily transform JSON with any object
- A protocol, to which your data model should conforms

How To Use
----------
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

Installation
------------
#### Installation with CocoaPods (Recommend)

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

```ruby
platform :ios, '6.0'

pod 'BWJSONMatcher', '~>1.0.0'
```

#### Other Ways
- Copying all the files into your project
- Importing the project as a static library

License
-------------------
All source code is licensed under the [MIT License](https://github.com/BurrowsWang/BWJSONMatcher/blob/master/LICENSE).
