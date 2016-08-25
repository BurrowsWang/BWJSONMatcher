//
//  BWJSONMatcherTestModel.h
//  BWJSONMatcher
//
//  Created by wangruicheng on 10/13/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "BWJSONValueObject.h"

#import <Foundation/Foundation.h>

@class TestModelBase;
@class TestModelA;
@class TestModelB;
@class TestModelC;
@class TestModelD;

@interface TestModelBase : NSObject <BWJSONHasToMapProperty>

@property (nonatomic, assign) NSInteger             objectId; // map to id
@property (nonatomic, assign) BOOL                  pbool;

@end

@interface TestModelA : TestModelBase <BWJSONHasArrayProperties, BWJSONHasIgnoredProperties, BWJSONHasToAmendProperties>

@property (nonatomic, assign) int                   pint;
@property (nonatomic, assign) unsigned int          puint;
@property (nonatomic, assign) short                 pshort;
@property (nonatomic, assign) float                 pfloat;
@property (nonatomic, assign) double                pdouble;
@property (nonatomic, assign) long                  plong;
@property (nonatomic, assign) unsigned long         pulong;
@property (nonatomic, assign) long long             plonglong;
@property (nonatomic, assign) unsigned long long    pulonglong;
@property (nonatomic, assign) NSInteger             pinteger;
@property (nonatomic, assign) NSUInteger            puinteger;
@property (nonatomic, copy) NSDictionary            *pdictionary;
@property (nonatomic, copy) NSArray                 *parray;
@property (nonatomic, copy) NSString                *pstring;
@property (nonatomic, strong) NSDecimalNumber       *pdecimalnumber;
@property (nonatomic, strong) NSNumber              *pnumber;
@property (nonatomic, strong) TestModelC            *pmodelc;

@property (nonatomic, assign) NSInteger             forId;
@property (nonatomic, copy) NSString                *forDescription;

@end

@interface TestModelB : TestModelBase <BWJSONHasArrayProperties, BWJSONHasToMapProperty>

@property (nonatomic, assign) BOOL                  couple; // map to double
@property (nonatomic, copy) NSString                *bp1;
@property (nonatomic, copy) NSArray                 *bp2;

@end

@interface TestModelC : NSObject

@property (nonatomic, copy) NSString                *cp1;
@property (nonatomic, strong) TestModelD            *cp2;

@end

@interface TestModelD : NSObject

@property (nonatomic, copy) NSString                *dp;

@end
