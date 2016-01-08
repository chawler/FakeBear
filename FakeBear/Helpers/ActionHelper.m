//
//  ActionHelper.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "ActionHelper.h"

@implementation ActionHelper

+ (id)sharedInstance
{
    static ActionHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ActionHelper alloc] init];
    });
    return sharedInstance;
}

@end
