//
//  OrderSectionHeader.h
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseView.h"

@interface OrderSectionHeader : BaseView

@property (nonatomic, assign) BOOL hideTopLine;
@property (nonatomic, strong, readonly) UILabel *titleLabel;

@end
