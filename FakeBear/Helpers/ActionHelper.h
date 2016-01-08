//
//  ActionHelper.h
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CommonModelBlock)(id);

@interface ActionHelper : NSObject

@property (nonatomic, copy) CommonModelBlock onCheckin;
@property (nonatomic, copy) CommonModelBlock onInvite;

+ (ActionHelper *)sharedInstance;

@end
