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
    return [BWJSONMatcher convertObjectToJSONString:self];
}

- (NSData *)toJSONData {
    return [BWJSONMatcher convertObjectToJSONData:self];
}

+ (nullable instancetype)fromJSONObject:(id)jsonObject {
    return [BWJSONMatcher matchJSON:jsonObject withClass:[self class]];
}

+ (nullable instancetype)fromJSONString:(NSString *)jsonString {
    return [BWJSONMatcher matchJSONString:jsonString withClass:[self class]];
}

+ (nullable instancetype)fromJSONData:(NSData *)jsonData {
    return [BWJSONMatcher matchJSONData:jsonData withClass:[self class]];
}

@end
