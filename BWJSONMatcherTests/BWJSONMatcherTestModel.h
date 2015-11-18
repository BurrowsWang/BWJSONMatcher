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

@interface TestModelBase : NSObject

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
@property (nonatomic, strong) NSDictionary          *pdictionary;
@property (nonatomic, strong) NSArray               *parray;
@property (nonatomic, strong) NSString              *pstring;
@property (nonatomic, strong) NSDecimalNumber       *pdecimalnumber;
@property (nonatomic, strong) NSNumber              *pnumber;
@property (nonatomic, strong) TestModelC            *pmodelc;

@end

@interface TestModelB : TestModelBase <BWJSONHasArrayProperties>

@property (nonatomic, strong) NSString              *bp1;
@property (nonatomic, strong) NSArray               *bp2;

@end

@interface TestModelC : NSObject

@property (nonatomic, strong) NSString              *cp1;
@property (nonatomic, strong) TestModelD            *cp2;

@end

@interface TestModelD : NSObject

@property (nonatomic, strong) NSString              *dp;

@end
