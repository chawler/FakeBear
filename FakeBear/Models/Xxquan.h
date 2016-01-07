//
//  Xxquan.h
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Xxquan : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger checkin;
@property (nonatomic, assign) NSInteger invite;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
