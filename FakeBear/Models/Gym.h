//
//	Gym.h
//
//	Create by 炜东 郑 on 7/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Gym : NSObject

@property (nonatomic, assign) NSInteger coType;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end