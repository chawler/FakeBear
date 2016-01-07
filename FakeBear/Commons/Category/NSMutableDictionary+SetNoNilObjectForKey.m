//
//  NSMutableDictionary+SetNoNilObjectForKey.m
//  Chufaba
//
//  Created by Perry on 14-10-11.
//  Copyright (c) 2014年 ChufabaAPP团队. All rights reserved.
//

#import "NSMutableDictionary+SetNoNilObjectForKey.h"

@implementation NSMutableDictionary (SetNoNilObjectForKey)

- (void)setNoNilObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (!anObject) {
        [self setObject:[NSNull null] forKey:aKey];
    } else {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)setNumber:(NSNumber *)anNumber forKey:(id <NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (![anNumber isKindOfClass:[NSNumber class]]) {
        [self setObject:@(0) forKey:aKey];
    } else {
        [self setObject:anNumber forKey:aKey];
    }
}

- (void)setString:(NSString *)anString forKey:(id <NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (![anString isKindOfClass:[NSString class]]) {
        [self setObject:@"" forKey:aKey];
    } else {
        [self setObject:anString forKey:aKey];
    }
}

- (void)setArray:(NSArray *)anArray forKey:(id <NSCopying>)aKey
{
    if (!aKey) {
        return;
    }
    if (![anArray isKindOfClass:[NSArray class]]) {
        [self setObject:@[] forKey:aKey];
    } else {
        [self setObject:anArray forKey:aKey];
    }
}

@end
