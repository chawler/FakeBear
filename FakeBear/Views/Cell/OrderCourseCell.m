//
//  OrderCourseCell.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "OrderCourseCell.h"
#import "Order.h"
#import "BaseOrderView.h"

@interface OrderCourseCell()

@property (nonatomic, strong) BaseOrderView *orderView;

@end

@implementation OrderCourseCell

- (void)addSubviews
{
    self.backgroundColor = self.contentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.orderView];
}

- (void)defineLayout
{
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)layoutSubviewsWithData:(Order *)order
{
    [self.orderView layoutSubviewsWithData:order];
}

- (BaseOrderView *)orderView
{
    if (!_orderView) {
        _orderView = [BaseOrderView new];
    }
    return _orderView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
