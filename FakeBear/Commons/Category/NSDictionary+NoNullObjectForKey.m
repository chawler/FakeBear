//
//  NSDictionary+NoNullObjectForKey.m
//  Chufaba
//
//  Created by Perry on 14-4-15.
//  Copyright (c) 2014年 ChufabaAPP团队. All rights reserved.
//

#import "NSDictionary+NoNullObjectForKey.h"

@implementation NSDictionary (NoNullObjectForKey)

-(id)noNullObjectForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    } else{
        return object;
    }
}

-(NSString *)stringForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@"null"]) {
            return @"";
        }
        return object;
    } else {
        return @"";
    }
}

-(NSNumber *)numberForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return object;
    } else {
        return @0;
    }
}

-(NSArray *)arrayForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    } else {
        return @[];
    }
}

-(NSDictionary *)dictForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    } else {
        return @{};
    }
}

-(BOOL)boolForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object boolValue];
    } else {
        return false;
    }
}

- (BOOL)hasEqualId:(NSDictionary *)dict
{
    if ([dict isKindOfClass:[NSDictionary class]]) {
        if ([[self stringForKey:@"id"] isEqualToString:[dict stringForKey:@"id"]]) {
            return YES;
        }
    }
    return NO;
}

@end
