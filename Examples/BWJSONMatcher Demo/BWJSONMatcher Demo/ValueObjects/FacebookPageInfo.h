//
//  FacebookPageInfo.h
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "BWJSONMatcher.h"
#import "BWJSONValueObject.h"

#import <Foundation/Foundation.h>

@class FacebookLocationInfo;
@class FacebookParkingInfo;

@interface FacebookPageInfo : NSObject <BWJSONHasArrayProperties, BWJSONHasToAmendProperties>

@property (nonatomic, copy) NSString                *about;
@property (nonatomic, strong) FacebookLocationInfo  *location;
@property (nonatomic, strong) FacebookParkingInfo   *parking;
@property (nonatomic, copy) NSArray                 *emails;
@property (nonatomic, copy) NSString                *website;
//@property (nonatomic, copy) NSString                *id;

@property (nonatomic, assign) NSInteger             pageId;

@end

@interface FacebookLocationInfo : NSObject <BWJSONHasToAmendProperties, BWJSONHasToMapProperty>

@property (nonatomic, copy) NSString                *city;
@property (nonatomic, copy) NSString                *country;
@property (nonatomic, assign) double                latitude;
@property (nonatomic, assign) double                longitude;
@property (nonatomic, copy) NSString                *state;
@property (nonatomic, copy) NSString                *street;
@property (nonatomic, copy) NSString                *zip;
@property (nonatomic, assign) BOOL                  empty;

@end

@interface FacebookParkingInfo : NSObject <BWJSONHasIgnoredProperties>

@property (nonatomic, assign) BOOL                  lot;
@property (nonatomic, assign) BOOL                  street;
@property (nonatomic, assign) BOOL                  valet;

@end
