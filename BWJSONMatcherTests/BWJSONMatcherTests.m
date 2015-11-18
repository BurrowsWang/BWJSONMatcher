//
//  BWJSONMatcherTests.m
//  BWJSONMatcherTests
//
//  Created by wangruicheng on 10/13/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BWJSONMatcherTestModel.h"

#import "BWJSONMatcher.h"
#import "NSObject+BWJSONMatcher.h"

#define kDataBool                   YES
#define kDataInt                    -65537
#define kDataUint                   65537
#define kDataShort                  -256
#define kDataFloat                  3.141592
#define kDataFloatString            @"3.141592"
#define kDataDouble                 3.14159265358979323846264338327
#define kDataDoubleString           @"3.14159265358979323846264338327"
#define kDataLong                   -3141592653
#define kDataUlong                  3141592653
#define kDataLongLong               -314159265358979323
#define kDataUlongLong              314159265358979323
#define kDataInteger                -3141592
#define kDataUinteger               3141592
#define kDataString                 @"This is a string."
#define kDataDecimal                [[NSDecimalNumber alloc] initWithString:@"3.14159265358979"]
#define kDataNumber                 [NSNumber numberWithInteger:kDataInt]

@interface BWJSONMatcherTests : XCTestCase

@property (nonatomic, strong) NSDictionary          *dictionaryA;

@end

@implementation BWJSONMatcherTests

- (void)setUp {
    [super setUp];
    
    self.dictionaryA = [self makeDictionaryA];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testModelFromJSONString {
    NSString *jsonString = [self.dictionaryA toJSONString];
    NSLog(@"%@", jsonString);
    
    TestModelA *dataModelA = [TestModelA fromJSONString:jsonString];
    
    XCTAssertEqual(dataModelA.pint, kDataInt, @"pint error");
    XCTAssertEqual(dataModelA.puint, kDataUint, @"puint error");
    XCTAssertEqual(dataModelA.pshort, kDataShort, @"pshort error");
    
    // can't pass this assert here, we will lose accuracy when using float
//    XCTAssertEqual(dataModelA.pfloat, kDataFloat, @"pfloat error");
    XCTAssert((dataModelA.pfloat - kDataFloat < 0.000001), @"pfloat error");
    
    XCTAssertEqual(dataModelA.pdouble, kDataDouble, @"pdouble error");
    XCTAssertEqual(dataModelA.plong, kDataLong, @"plong error");
    XCTAssertEqual(dataModelA.pulong, kDataUlong, @"pulong error");
    XCTAssertEqual(dataModelA.plonglong, kDataLongLong, @"plonglong error");
    XCTAssertEqual(dataModelA.pulonglong, kDataUlongLong, @"pulonglong error");
    XCTAssertEqual(dataModelA.pinteger, kDataInteger, @"pinteger error");
    XCTAssertEqual(dataModelA.puinteger, kDataUinteger, @"puinteger error");
    
    NSLog(@"%@", dataModelA.pdictionary);
    XCTAssert([dataModelA.pdictionary[@"keyB"][@"bp2"][0][@"cp2"][@"dp"] isEqualToString:kDataString], @"pdictionary error");
    
    NSLog(@"%@", dataModelA.parray);
    TestModelB *modelB = dataModelA.parray[2];
    TestModelC *modelC = modelB.bp2[0];
    XCTAssert([modelC.cp2.dp isEqualToString:kDataString], @"parray error");
    
    XCTAssert([dataModelA.pstring isEqualToString:kDataString], @"pstring error");
    XCTAssertEqualObjects(dataModelA.pdecimalnumber, kDataDecimal, @"pdecimalnumber error");
    XCTAssertEqualObjects(dataModelA.pnumber, kDataNumber, @"pnumber error");
    XCTAssert([dataModelA.pmodelc.cp2.dp isEqualToString:kDataString], @"pmodelc error");
}

- (void)testArrayFromJSONArray {
    NSString *jsonString = [self.dictionaryA toJSONString];
    TestModelA *dataModelA = [TestModelA fromJSONString:jsonString];
    
    NSString *arrayString = [BWJSONMatcher convertObjectToJSONString:dataModelA.parray];
    NSArray *modelBArray = [BWJSONMatcher matchJSONString:arrayString withClass:[TestModelB class]];
    
    XCTAssertEqualObjects(dataModelA.parray, modelBArray, @"match array with json array error");
}

- (void)testMutualConvert {
    NSString *jsonString = [self.dictionaryA toJSONString];
    NSLog(@"%@", jsonString);
    
    TestModelA *dataModelA1 = [TestModelA fromJSONString:jsonString];
    NSString *middleString = [dataModelA1 toJSONString];
    
    TestModelA *dataModelA2 = [TestModelA fromJSONString:middleString];
    
    XCTAssertEqualObjects(dataModelA1, dataModelA2, @"mutual match error");
}

- (void)testMonkeyActivity {
    NSDictionary *monkeyDictionary = @{@"pbool": @"true",
                                       @"pint": @"314159265358979323846264338327",
                                       @"puint": @(-128),
                                       @"pshort": @{@"test": @"monkey"},
                                       @"pfloat": @"中文字符",
                                       @"pdouble": @(kDataDouble),
                                       @"plong": @(kDataLong),
                                       @"pulong": @(kDataUlong),
                                       @"plonglong": @(kDataLongLong),
                                       @"pulonglong": @(kDataUlongLong),
                                       @"pinteger": @(kDataInteger),
                                       @"puinteger": @(kDataUinteger),
                                       @"pdictionary": @[@(3.14)],
                                       @"parray": @[@"1", @"2", @"3"],
                                       @"pstring": @(0),
                                       @"pdecimalnumber": @"3.1415",
                                       @"pnumber": kDataNumber,
                                       @"pmodelc": kDataString};
    
    TestModelA *monkeyModelA = [TestModelA fromJSONObject:monkeyDictionary];
    NSString *monkeyJSONString = [monkeyModelA toJSONString];
    NSLog(@"%@", monkeyJSONString);
    
    XCTAssert(YES, @"no crash is good performance");
}

- (void)testPerformanceEfficiency {
    NSString *jsonString = [self.dictionaryA toJSONString];
    __block NSInteger totalCount = 100;
    
    [self measureBlock:^{
        while (totalCount > 0) {
            TestModelA *modelA = [TestModelA fromJSONString:jsonString];
            
            totalCount--;
        }
    }];
}

- (NSDictionary *)makeDictionaryA {
    NSDictionary *dictionaryB1 = [self makeDictionaryB];
    NSDictionary *dictionaryB2 = [self makeDictionaryB];
    NSDictionary *dictionaryB3 = [self makeDictionaryB];
    NSDictionary *dictionaryC1 = [self makeDictionaryC];
    NSDictionary *dictionaryB = [self makeDictionaryB];
    NSDictionary *dictionaryC = [self makeDictionaryC];
    NSDictionary *dictionaryD = [self makeDictionaryD];
    
    NSDictionary *dictionaryProperty = @{@"keyB": dictionaryB,
                                         @"keyC": dictionaryC,
                                         @"keyD": dictionaryD};
    
    return @{@"pint": @(kDataInt),
             @"puint": @(kDataUint),
             @"pshort": @(kDataShort),
             @"pfloat": kDataFloatString,
             @"pdouble": kDataDoubleString,
             @"plong": @(kDataLong),
             @"pulong": @(kDataUlong),
             @"plonglong": @(kDataLongLong),
             @"pulonglong": @(kDataUlongLong),
             @"pinteger": @(kDataInteger),
             @"puinteger": @(kDataUinteger),
             @"pdictionary": dictionaryProperty,
             @"parray": @[dictionaryB1, dictionaryB2, dictionaryB3],
             @"pstring": kDataString,
             @"pdecimalnumber": kDataDecimal,
             @"pnumber": kDataNumber,
             @"pmodelc": dictionaryC1};
}

- (NSDictionary *)makeDictionaryB {
    NSDictionary *dictionaryC1 = [self makeDictionaryC];
    NSDictionary *dictionaryC2 = [self makeDictionaryC];
    NSDictionary *dictionaryC3 = [self makeDictionaryC];
    
    return @{@"bp1": kDataString,
             @"bp2": @[dictionaryC1, dictionaryC2, dictionaryC3]};
}

- (NSDictionary *)makeDictionaryC {
    NSDictionary *dictionaryD = [self makeDictionaryD];
    return @{@"cp1": kDataString,
             @"cp2": dictionaryD};
}

- (NSDictionary *)makeDictionaryD {
    return @{@"dp": kDataString};
}

@end
