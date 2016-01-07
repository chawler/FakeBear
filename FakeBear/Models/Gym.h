//
//  Gym.h
//
//  Created by 炜东 郑 on 16/1/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Gym : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger gymIdentifier;
@property (nonatomic, assign) NSInteger coType;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
