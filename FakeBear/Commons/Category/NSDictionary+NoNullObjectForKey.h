//
//  NSDictionary+NoNullObjectForKey.h
//  Chufaba
//
//  Created by Perry on 14-4-15.
//  Copyright (c) 2014年 ChufabaAPP团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NoNullObjectForKey)

-(id)noNullObjectForKey:(id)key;
-(NSString *)stringForKey:(id)key;
-(NSNumber *)numberForKey:(id)key;
-(NSArray *)arrayForKey:(id)key;
-(NSDictionary *)dictForKey:(id)key;
-(BOOL)boolForKey:(id)key;
- (BOOL)hasEqualId:(id)object;

@end
