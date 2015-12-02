//
//  NSObject+BWJSONMatcher.h
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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BWJSONMatcher)

/*!
 * Convert receiver to a json object
 * @return NSDictionary or NSArray depending on the type of receiver
 */
- (id)toJSONObject;

/*!
 * Convert receiver to a json string
 * @return JSON string that represents this receiver
 */
- (NSString *)toJSONString;

/*!
 * Convert receiver to a json data
 * @return JSON data that represents this receiver
 */
- (NSData *)toJSONData;

/*!
 * Parse a json object, convert it to an instance of receiver class
 * @param jsonObject json object you want to parse
 * @return A brand new instance of this class
 */
+ (nullable instancetype)fromJSONObject:(id)jsonObject;

/*!
 * Parse a json string, convert it to an instance of receiver class
 * @param jsonString json string you want to parse
 * @return A brand new instance of this class
 */
+ (nullable instancetype)fromJSONString:(NSString *)jsonString;

/*!
 * Parse a json data, convert it to an instance of receiver class
 * @param jsonData json data you want to parse
 * @return A brand new instance of this class
 */
+ (nullable instancetype)fromJSONData:(NSData *)jsonData;

@end

NS_ASSUME_NONNULL_END
