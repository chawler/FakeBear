//
//	Course.h
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Course : NSObject

@property (nonatomic, strong) NSString * end;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSObject * notice;
@property (nonatomic, strong) NSString * start;
@property (nonatomic, assign) NSInteger type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end