//
//  BaseOrderHeader.h
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseView.h"

@interface BaseOrderHeader : BaseView

@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong, readonly) UILabel *textLabel;

@end
