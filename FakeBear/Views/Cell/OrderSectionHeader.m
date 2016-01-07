//
//  OrderSectionHeader.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "OrderSectionHeader.h"

@interface OrderSectionHeader()

@property (nonatomic, strong) UIImageView *topLine;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *bottomLine;

@end

@implementation OrderSectionHeader

- (void)addSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topLine];
    [self addSubview:self.titleLabel];
    [self addSubview:self.bottomLine];
}

- (void)defineLayout
{
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(self);
        make.height.equalTo(@1);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@11.5);
        make.width.lessThanOrEqualTo(@100);
        make.centerY.equalTo(self);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.width.equalTo(self);
        make.height.equalTo(@1);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UIView createLabel:CGRectZero text:@"已经结束" size:17 textColor:HexRGB(0xFF510D)];
    }
    return _titleLabel;
}

- (UIImageView *)topLine
{
    if (!_topLine) {
        _topLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order-hor-line"]];
        _topLine.contentMode = UIViewContentModeScaleToFill;
    }
    return _topLine;
}

- (UIImageView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order-hor-line"]];
        _topLine.contentMode = UIViewContentModeScaleToFill;
    }
    return _bottomLine;
}

@end
