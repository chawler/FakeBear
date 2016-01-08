//
//  OrderTableHeader.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "OrderTableHeader.h"
#import "BaseOrderView.h"
#import "BaseOrderHeader.h"
#import "NSDate+Helper.h"
#import "Order.h"

@interface OrderTableHeader()

@property (nonatomic, strong) BaseOrderHeader *header;
@property (nonatomic, strong) BaseOrderView *contentView;

@end

@implementation OrderTableHeader

- (void)addSubviews
{
    [self addSubview:self.header];
    [self addSubview:self.contentView];
}

- (void)defineLayout
{
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@80);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.header.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)setupData
{
    self.header.tips = @"即将开始";
    self.header.textLabel.text = [[NSDate date] stringWithFormat:@"MM月dd日"];
}

- (void)layoutSubviewsWithData:(Order *)order
{
    if (order.status == 0) {
        self.height = 290;
        [self.contentView layoutMoreViews];
    }
    [self.contentView layoutSubviewsWithData:order];
}

- (BaseOrderHeader *)header
{
    if (!_header) {
        _header = [BaseOrderHeader new];
    }
    return _header;
}

- (BaseOrderView *)contentView
{
    if (!_contentView) {
        _contentView = [BaseOrderView new];
    }
    return _contentView;
}

@end
