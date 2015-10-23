//
//  NSObject+BWJSONMatcher.m
//  BWJSONMatcher
//
//  Created by wangruicheng on 10/14/15.
//  Copyright © 2015 Burrows.Wang ( https://github.com/BurrowsWang ).
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSObject+BWJSONMatcher.h"

#import "BWJSONMatcher.h"

@implementation NSObject (BWJSONMatcher)

- (id)toJSONObject {
    return [BWJSONMatcher convertObjectToJSON:self];
}

- (NSString *)toJSONString {
    id jsonObj = [self toJSONObject];
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObj options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        
        return @"";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

+ (instancetype)fromJSONObject:(id)jsonObject {
    return [BWJSONMatcher matchJSON:jsonObject withClass:[self class]];
}

+ (instancetype)fromJSONString:(NSString *)jsonString {
    if (!jsonString) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        
        return nil;
    } else {
        return [BWJSONMatcher matchJSON:jsonObj withClass:[self class]];
    }
}

@end
