//
//  Course.m
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Course.h"
#import "NSDate+Helper.h"


NSString *const kCourseId = @"id";
NSString *const kCourseEnd = @"end";
NSString *const kCourseNotice = @"notice";
NSString *const kCourseName = @"name";
NSString *const kCourseType = @"type";
NSString *const kCourseStart = @"start";


@interface Course ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Course

@synthesize courseIdentifier = _courseIdentifier;
@synthesize endProperty = _endProperty;
@synthesize notice = _notice;
@synthesize name = _name;
@synthesize type = _type;
@synthesize start = _start;


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
            self.courseIdentifier = [self objectOrNilForKey:kCourseId fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kCourseEnd fromDictionary:dict];
            self.notice = [self objectOrNilForKey:kCourseNotice fromDictionary:dict];
            self.name = [self objectOrNilForKey:kCourseName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kCourseType fromDictionary:dict] integerValue];
            self.start = [NSDate dateFromUTCString:[self objectOrNilForKey:kCourseStart fromDictionary:dict]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.courseIdentifier forKey:kCourseId];
    [mutableDict setValue:self.endProperty forKey:kCourseEnd];
    [mutableDict setValue:self.notice forKey:kCourseNotice];
    [mutableDict setValue:self.name forKey:kCourseName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kCourseType];
    [mutableDict setValue:self.start forKey:kCourseStart];

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

    self.courseIdentifier = [aDecoder decodeObjectForKey:kCourseId];
    self.endProperty = [aDecoder decodeObjectForKey:kCourseEnd];
    self.notice = [aDecoder decodeObjectForKey:kCourseNotice];
    self.name = [aDecoder decodeObjectForKey:kCourseName];
    self.type = [aDecoder decodeDoubleForKey:kCourseType];
    self.start = [aDecoder decodeObjectForKey:kCourseStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_courseIdentifier forKey:kCourseId];
    [aCoder encodeObject:_endProperty forKey:kCourseEnd];
    [aCoder encodeObject:_notice forKey:kCourseNotice];
    [aCoder encodeObject:_name forKey:kCourseName];
    [aCoder encodeDouble:_type forKey:kCourseType];
    [aCoder encodeObject:_start forKey:kCourseStart];
}

- (id)copyWithZone:(NSZone *)zone
{
    Course *copy = [[Course alloc] init];
    
    if (copy) {

        copy.courseIdentifier = [self.courseIdentifier copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.notice = [self.notice copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
        copy.start = [self.start copyWithZone:zone];
    }
    
    return copy;
}


@end
