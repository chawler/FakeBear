//
//	Order.m
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Order.h"

@interface Order ()
@end
@implementation Order




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"course"] isKindOfClass:[NSNull class]]){
		self.course = [[Course alloc] initWithDictionary:dictionary[@"course"]];
	}

	if(![dictionary[@"gym"] isKindOfClass:[NSNull class]]){
		self.gym = [[Gym alloc] initWithDictionary:dictionary[@"gym"]];
	}

	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"order_code"] isKindOfClass:[NSNull class]]){
		self.orderCode = dictionary[@"order_code"];
	}	
	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[@"status"] integerValue];
	}

	if(![dictionary[@"xxquan"] isKindOfClass:[NSNull class]]){
		self.xxquan = [[Xxquan alloc] initWithDictionary:dictionary[@"xxquan"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.course != nil){
		dictionary[@"course"] = [self.course toDictionary];
	}
	if(self.gym != nil){
		dictionary[@"gym"] = [self.gym toDictionary];
	}
	dictionary[@"id"] = @(self.idField);
	if(self.orderCode != nil){
		dictionary[@"order_code"] = self.orderCode;
	}
	dictionary[@"status"] = @(self.status);
	if(self.xxquan != nil){
		dictionary[@"xxquan"] = [self.xxquan toDictionary];
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
	if(self.course != nil){
		[aCoder encodeObject:self.course forKey:@"course"];
	}
	if(self.gym != nil){
		[aCoder encodeObject:self.gym forKey:@"gym"];
	}
	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.orderCode != nil){
		[aCoder encodeObject:self.orderCode forKey:@"order_code"];
	}
	[aCoder encodeObject:@(self.status) forKey:@"status"];	if(self.xxquan != nil){
		[aCoder encodeObject:self.xxquan forKey:@"xxquan"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.course = [aDecoder decodeObjectForKey:@"course"];
	self.gym = [aDecoder decodeObjectForKey:@"gym"];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.orderCode = [aDecoder decodeObjectForKey:@"order_code"];
	self.status = [[aDecoder decodeObjectForKey:@"status"] integerValue];
	self.xxquan = [aDecoder decodeObjectForKey:@"xxquan"];
	return self;

}
@end