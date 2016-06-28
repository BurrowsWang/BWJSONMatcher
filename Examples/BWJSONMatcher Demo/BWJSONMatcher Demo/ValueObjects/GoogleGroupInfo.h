//
//  GoogleGroupInfo.h
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "BWJSONValueObject.h"

@interface GoogleGroupInfo : NSObject <BWJSONHasToAmendProperties>

@property (nonatomic, copy) NSString                *firstname;
@property (nonatomic, copy) NSString                *lastname;
@property (nonatomic, copy) NSString                *email;

@property (nonatomic, copy) NSString                *userDescription;

@end
