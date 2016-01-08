//
//  OrderSectionView.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "OrderSectionView.h"
#import "BaseOrderHeader.h"

@interface OrderSectionView()

@property (nonatomic, strong) BaseOrderHeader *header;

@end

@implementation OrderSectionView

@synthesize textLabel = _textLabel;

- (void)addSubviews
{
    [self.contentView addSubview:self.header];
}

- (void)defineLayout
{
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setFlag:(BOOL)flag
{
    self.header.flag = flag;
    _flag = flag;
}

- (UILabel *)textLabel
{
    return self.header.textLabel;
}

- (BaseOrderHeader *)header
{
    if (!_header) {
        _header = [[BaseOrderHeader alloc] init];
    }
    return _header;
}

@end
