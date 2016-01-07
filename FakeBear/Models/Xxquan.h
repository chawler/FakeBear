//
//	Xxquan.h
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Xxquan : NSObject

@property (nonatomic, assign) NSInteger checkin;
@property (nonatomic, assign) NSInteger invite;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end