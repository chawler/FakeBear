//
//  Order.m
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Order.h"
#import "Xxquan.h"
#import "Course.h"
#import "Gym.h"


NSString *const kOrderStatus = @"status";
NSString *const kOrderXxquan = @"xxquan";
NSString *const kOrderId = @"id";
NSString *const kOrderCourse = @"course";
NSString *const kOrderOrderCode = @"order_code";
NSString *const kOrderGym = @"gym";


@interface Order ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Order

@synthesize status = _status;
@synthesize xxquan = _xxquan;
@synthesize orderIdentifier = _orderIdentifier;
@synthesize course = _course;
@synthesize orderCode = _orderCode;
@synthesize gym = _gym;


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
            self.status = [[self objectOrNilForKey:kOrderStatus fromDictionary:dict] boolValue];
            self.xxquan = [Xxquan modelObjectWithDictionary:[dict objectForKey:kOrderXxquan]];
            self.orderIdentifier = [[self objectOrNilForKey:kOrderId fromDictionary:dict] integerValue];
            self.course = [Course modelObjectWithDictionary:[dict objectForKey:kOrderCourse]];
            self.orderCode = [self objectOrNilForKey:kOrderOrderCode fromDictionary:dict];
            self.gym = [Gym modelObjectWithDictionary:[dict objectForKey:kOrderGym]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.status] forKey:kOrderStatus];
    [mutableDict setValue:[self.xxquan dictionaryRepresentation] forKey:kOrderXxquan];
    [mutableDict setValue:[NSNumber numberWithInteger:self.orderIdentifier] forKey:kOrderId];
    [mutableDict setValue:[self.course dictionaryRepresentation] forKey:kOrderCourse];
    [mutableDict setValue:self.orderCode forKey:kOrderOrderCode];
    [mutableDict setValue:[self.gym dictionaryRepresentation] forKey:kOrderGym];

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

    self.status = [aDecoder decodeBoolForKey:kOrderStatus];
    self.xxquan = [aDecoder decodeObjectForKey:kOrderXxquan];
    self.orderIdentifier = [aDecoder decodeIntegerForKey:kOrderId];
    self.course = [aDecoder decodeObjectForKey:kOrderCourse];
    self.orderCode = [aDecoder decodeObjectForKey:kOrderOrderCode];
    self.gym = [aDecoder decodeObjectForKey:kOrderGym];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kOrderStatus];
    [aCoder encodeObject:_xxquan forKey:kOrderXxquan];
    [aCoder encodeDouble:_orderIdentifier forKey:kOrderId];
    [aCoder encodeObject:_course forKey:kOrderCourse];
    [aCoder encodeObject:_orderCode forKey:kOrderOrderCode];
    [aCoder encodeObject:_gym forKey:kOrderGym];
}

- (id)copyWithZone:(NSZone *)zone
{
    Order *copy = [[Order alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.xxquan = [self.xxquan copyWithZone:zone];
        copy.orderIdentifier = self.orderIdentifier;
        copy.course = [self.course copyWithZone:zone];
        copy.orderCode = [self.orderCode copyWithZone:zone];
        copy.gym = [self.gym copyWithZone:zone];
    }
    
    return copy;
}


@end
