//
//  BWJSONMatcherTestModel.m
//  BWJSONMatcher
//
//  Created by wangruicheng on 10/13/15.
//  Copyright © 2015 Burrows.Wang. All rights reserved.
//

#import "BWJSONMatcherTestModel.h"

@implementation TestModelBase

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TestModelBase class]]) {
        TestModelBase *target = (TestModelBase *)object;
        
        if (self.pbool == target.pbool) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation TestModelA

- (Class)typeInProperty:(NSString *)property {
    if ([property isEqualToString:@"parray"]) {
        return [TestModelB class];
    }
    
    return nil;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TestModelA class]]) {
        TestModelA *target = (TestModelA *)object;
        
        if ([super isEqual:target]
            && self.pint == target.pint
            && self.puint == target.puint
            && self.pshort == target.pshort
            && (self.pfloat - target.pfloat) <= 0.00000000001
            && (self.pdouble - target.pdouble) <= 0.00000000001
            && self.plong == target.plong
            && self.pulong == target.pulong
            && self.plonglong == target.plonglong
            && self.pulonglong == target.pulonglong
            && self.pinteger == target.pinteger
            && self.puinteger == target.puinteger
            && [self.pdictionary isEqualToDictionary:target.pdictionary]
            && [self.parray isEqualToArray:target.parray]
            && [self.pstring isEqualToString:target.pstring]
            && [self.pdecimalnumber isEqualToNumber:target.pdecimalnumber]
            && [self.pnumber isEqualToNumber:target.pnumber]
            && [self.pmodelc isEqual:target.pmodelc]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)matchDidFinish {
    // you can prune or amend some values here if necessory
    /*
    self.pfloat /= 1000.0f;
    self.pdouble *= 1000.0f;
     */
}

@end

@implementation TestModelB

- (Class)typeInProperty:(NSString *)property {
    if ([property isEqualToString:@"bp2"]) {
        return [TestModelC class];
    }
    
    return nil;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TestModelB class]]) {
        TestModelB *target = (TestModelB *)object;
        
        if ([super isEqual:target]
            && [self.bp1 isEqualToString:target.bp1]
            && [self.bp2 isEqualToArray:target.bp2]) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation TestModelC

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TestModelC class]]) {
        TestModelC *target = (TestModelC *)object;
        
        if ([self.cp1 isEqualToString:target.cp1]
            && [self.cp2 isEqual:target.cp2]) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation TestModelD

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[TestModelD class]]) {
        TestModelD *target = (TestModelD *)object;
        
        if ([self.dp isEqualToString:target.dp]) {
            return YES;
        }
    }
    
    return NO;
}

@end
