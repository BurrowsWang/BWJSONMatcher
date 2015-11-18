//
//  FacebookPageInfo.h
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import <BWJSONMatcher/BWJSONMatcher.h>
#import <BWJSONMatcher/BWJSONValueObject.h>

#import <Foundation/Foundation.h>

@class FacebookLocationInfo;
@class FacebookParkingInfo;

@interface FacebookPageInfo : NSObject <BWJSONHasArrayProperties>

@property (nonatomic, strong) NSString                      *about;
@property (nonatomic, strong) FacebookLocationInfo          *location;
@property (nonatomic, strong) FacebookParkingInfo           *parking;
@property (nonatomic, strong) NSArray                       *emails;
@property (nonatomic, strong) NSString                      *website;
@property (nonatomic, strong) NSString                      *id;

@end

@interface FacebookLocationInfo : NSObject <BWJSONHasToAmendProperties>

@property (nonatomic, strong) NSString                      *city;
@property (nonatomic, strong) NSString                      *country;
@property (nonatomic, assign) double                        latitude;
@property (nonatomic, assign) double                        longitude;
@property (nonatomic, strong) NSString                      *state;
@property (nonatomic, strong) NSString                      *street;
@property (nonatomic, strong) NSString                      *zip;

@end

@interface FacebookParkingInfo : NSObject <BWJSONHasIgnoredProperties>

@property (nonatomic, assign) BOOL                          lot;
@property (nonatomic, assign) BOOL                          street;
@property (nonatomic, assign) BOOL                          valet;

@end
