//
//  FacebookPageInfo.m
//  BWJSONMatcher Demo
//
//  Created by wangruicheng on 11/17/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "FacebookPageInfo.h"

@implementation FacebookPageInfo

- (Class)typeInProperty:(NSString *)property {
    if ([property isEqualToString:@"emails"]) {
        return [NSString class];
    }
    
    return nil;
}

@end

@implementation FacebookLocationInfo

- (void)matchDidFinish {
    self.zip = [NSString stringWithFormat:@"%@: %@", self.country, self.zip];
}

@end

@implementation FacebookParkingInfo

+ (NSArray *)ignoredProperties {
    return @[@"street", @"valet"];
}

@end