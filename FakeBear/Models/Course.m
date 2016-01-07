//
//	Course.m
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Course.h"

@interface Course ()
@end
@implementation Course




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"end"] isKindOfClass:[NSNull class]]){
		self.end = dictionary[@"end"];
	}	
	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"id"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"notice"] isKindOfClass:[NSNull class]]){
		self.notice = dictionary[@"notice"];
	}	
	if(![dictionary[@"start"] isKindOfClass:[NSNull class]]){
		self.start = dictionary[@"start"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[@"type"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.end != nil){
		dictionary[@"end"] = self.end;
	}
	if(self.idField != nil){
		dictionary[@"id"] = self.idField;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.notice != nil){
		dictionary[@"notice"] = self.notice;
	}
	if(self.start != nil){
		dictionary[@"start"] = self.start;
	}
	dictionary[@"type"] = @(self.type);
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
	if(self.end != nil){
		[aCoder encodeObject:self.end forKey:@"end"];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:@"id"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.notice != nil){
		[aCoder encodeObject:self.notice forKey:@"notice"];
	}
	if(self.start != nil){
		[aCoder encodeObject:self.start forKey:@"start"];
	}
	[aCoder encodeObject:@(self.type) forKey:@"type"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.end = [aDecoder decodeObjectForKey:@"end"];
	self.idField = [aDecoder decodeObjectForKey:@"id"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.notice = [aDecoder decodeObjectForKey:@"notice"];
	self.start = [aDecoder decodeObjectForKey:@"start"];
	self.type = [[aDecoder decodeObjectForKey:@"type"] integerValue];
	return self;

}
@end