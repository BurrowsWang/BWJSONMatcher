//
//  GoogleGroupInfo.m
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "GoogleGroupInfo.h"

@implementation GoogleGroupInfo

- (void)matchDidFinish:(NSDictionary *)jsonDictionary {
    self.userDescription = jsonDictionary[@"description"];
}

@end
