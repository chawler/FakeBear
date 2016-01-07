//
//  NSMutableDictionary+SetNoNilObjectForKey.h
//  Chufaba
//
//  Created by Perry on 14-10-11.
//  Copyright (c) 2014年 ChufabaAPP团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SetNoNilObjectForKey)

- (void)setNoNilObject:(id)anObject forKey:(id <NSCopying>)aKey;

- (void)setNumber:(NSNumber *)anNumber forKey:(id <NSCopying>)aKey;
- (void)setString:(NSString *)anString forKey:(id <NSCopying>)aKey;
- (void)setArray:(NSArray *)anArray forKey:(id <NSCopying>)aKey;

@end
