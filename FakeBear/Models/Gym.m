//
//  Gym.m
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Gym.h"


NSString *const kGymId = @"id";
NSString *const kGymCoType = @"co_type";
NSString *const kGymLocation = @"location";
NSString *const kGymName = @"name";


@interface Gym ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Gym

@synthesize gymIdentifier = _gymIdentifier;
@synthesize coType = _coType;
@synthesize location = _location;
@synthesize name = _name;


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
            self.gymIdentifier = [[self objectOrNilForKey:kGymId fromDictionary:dict] integerValue];
            self.coType = [[self objectOrNilForKey:kGymCoType fromDictionary:dict] integerValue];
            self.location = [self objectOrNilForKey:kGymLocation fromDictionary:dict];
            self.name = [self objectOrNilForKey:kGymName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.gymIdentifier] forKey:kGymId];
    [mutableDict setValue:[NSNumber numberWithInteger:self.coType] forKey:kGymCoType];
    [mutableDict setValue:self.location forKey:kGymLocation];
    [mutableDict setValue:self.name forKey:kGymName];

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

    self.gymIdentifier = [aDecoder decodeIntegerForKey:kGymId];
    self.coType = [aDecoder decodeIntegerForKey:kGymCoType];
    self.location = [aDecoder decodeObjectForKey:kGymLocation];
    self.name = [aDecoder decodeObjectForKey:kGymName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_gymIdentifier forKey:kGymId];
    [aCoder encodeDouble:_coType forKey:kGymCoType];
    [aCoder encodeObject:_location forKey:kGymLocation];
    [aCoder encodeObject:_name forKey:kGymName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Gym *copy = [[Gym alloc] init];
    
    if (copy) {

        copy.gymIdentifier = self.gymIdentifier;
        copy.coType = self.coType;
        copy.location = [self.location copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
