//
//  BaseView.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (id)init
{
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addSubviews];
    [self defineLayout];
}

- (void)addSubviews
{
    
}

- (void)defineLayout
{
    
}

- (void)layoutSubviewsWithData:(id)data
{
    
}

@end
