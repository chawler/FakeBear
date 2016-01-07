//
//  Xxquan.m
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Xxquan.h"


NSString *const kXxquanCheckin = @"checkin";
NSString *const kXxquanInvite = @"invite";


@interface Xxquan ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Xxquan

@synthesize checkin = _checkin;
@synthesize invite = _invite;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.checkin = [[self objectOrNilForKey:kXxquanCheckin fromDictionary:dict] doubleValue];
            self.invite = [[self objectOrNilForKey:kXxquanInvite fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkin] forKey:kXxquanCheckin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.invite] forKey:kXxquanInvite];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.checkin = [aDecoder decodeDoubleForKey:kXxquanCheckin];
    self.invite = [aDecoder decodeDoubleForKey:kXxquanInvite];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_checkin forKey:kXxquanCheckin];
    [aCoder encodeDouble:_invite forKey:kXxquanInvite];
}

- (id)copyWithZone:(NSZone *)zone
{
    Xxquan *copy = [[Xxquan alloc] init];
    
    if (copy) {

        copy.checkin = self.checkin;
        copy.invite = self.invite;
    }
    
    return copy;
}


@end
