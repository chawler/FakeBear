//
//	Xxquan.m
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Xxquan.h"

@interface Xxquan ()
@end
@implementation Xxquan




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"checkin"] isKindOfClass:[NSNull class]]){
		self.checkin = [dictionary[@"checkin"] integerValue];
	}

	if(![dictionary[@"invite"] isKindOfClass:[NSNull class]]){
		self.invite = [dictionary[@"invite"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"checkin"] = @(self.checkin);
	dictionary[@"invite"] = @(self.invite);
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
	[aCoder encodeObject:@(self.checkin) forKey:@"checkin"];	[aCoder encodeObject:@(self.invite) forKey:@"invite"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.checkin = [[aDecoder decodeObjectForKey:@"checkin"] integerValue];
	self.invite = [[aDecoder decodeObjectForKey:@"invite"] integerValue];
	return self;

}
@end