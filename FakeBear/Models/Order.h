//
//	Order.h
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Course.h"
#import "Gym.h"
#import "Xxquan.h"

@interface Order : NSObject

@property (nonatomic, strong) Course * course;
@property (nonatomic, strong) Gym * gym;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * orderCode;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) Xxquan * xxquan;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end