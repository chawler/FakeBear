//
//  Course.h
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Course : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *courseIdentifier;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *notice;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSDate *start;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
