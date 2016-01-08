//
//  Order.h
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Xxquan, Course, Gym;

@interface Order : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL status;
@property (nonatomic, strong) Xxquan *xxquan;
@property (nonatomic, assign) NSInteger orderIdentifier;
@property (nonatomic, strong) Course *course;
@property (nonatomic, strong) NSString *orderCode;
@property (nonatomic, strong) Gym *gym;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
