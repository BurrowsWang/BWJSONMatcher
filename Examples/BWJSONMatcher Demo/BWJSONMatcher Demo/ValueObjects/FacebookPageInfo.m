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

- (void)matchDidFinish:(NSDictionary *)jsonDictionary {
    self.pageId = [jsonDictionary[@"id"] integerValue];
}

@end

@implementation FacebookLocationInfo

- (void)matchDidFinish:(NSDictionary *)jsonDictionary {
    self.zip = [NSString stringWithFormat:@"%@: %@", self.country, self.zip];
}

+ (NSDictionary *)propertyMapper {
    return @{@"empty": @"void"};
}

@end

@implementation FacebookParkingInfo

+ (NSArray *)ignoredProperties {
    return @[@"street", @"valet"];
}

@end
