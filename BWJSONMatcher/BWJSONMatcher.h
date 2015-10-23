//
//  BWJSONMatcher.h
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

/*!
 * This method is inspired by and refered to https://github.com/AFNetworking/AFNetworking/blob/master/AFNetworking/AFURLResponseSerialization.m#L61 thanks to @cnoon and @kylef
 * Delete all of the null values in a json object
 * @param json      The json object that you want to delete all the null values, could be NSDictionary or NSArray
 * @param options   The options used when making the final json
 * @return A json object with no null values in it
 */
id BWJSONObjectByRemovingKeysWithNullValues(id json, NSJSONReadingOptions options);


@interface BWJSONMatcher : NSObject

/*!
 * Match all properties of a json object with those of a Class, convert the json object to an object of the given class type
 * @param json The json object, which should be NSDictionary or NSArray
 * @param classType To which type you want convert this json object to,
 *        if the type of json is NSArray, parameter classType indicate the object inside json array
 * @return A converted data model of the given class or nil if any parameter is invalid
 */
+ (id)matchJSON:(id)json withClass:(__unsafe_unretained Class)classType;

/*!
 * Convert a data model to json object
 * @param object The object you want to convert
 * @return A json object that converted from parameter object, could be NSDictionary or NSArray depending on the parameter you passed
 */
+ (id)convertObjectToJSON:(id)object;

@end

NS_ASSUME_NONNULL_END
