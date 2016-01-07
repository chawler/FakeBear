//
//	Gym.m
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Gym.h"

@interface Gym ()
@end
@implementation Gym




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"co_type"] isKindOfClass:[NSNull class]]){
		self.coType = [dictionary[@"co_type"] integerValue];
	}

	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"location"] isKindOfClass:[NSNull class]]){
		self.location = dictionary[@"location"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"co_type"] = @(self.coType);
	dictionary[@"id"] = @(self.idField);
	if(self.location != nil){
		dictionary[@"location"] = self.location;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.coType) forKey:@"co_type"];	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.location != nil){
		[aCoder encodeObject:self.location forKey:@"location"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.coType = [[aDecoder decodeObjectForKey:@"co_type"] integerValue];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.location = [aDecoder decodeObjectForKey:@"location"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	return self;

}
@end