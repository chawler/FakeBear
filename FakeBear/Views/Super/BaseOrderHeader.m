//
//  BaseOrderHeader.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseOrderHeader.h"
#import "OrderSectionHeader.h"

@interface BaseOrderHeader()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) OrderSectionHeader *header;

@end

@implementation BaseOrderHeader

- (void)addSubviews
{
    self.backgroundColor = HexRGB(0xF1F1F1);
    [self addSubview:self.header];
    [self addSubview:self.imageView];
    [self addSubview:self.textLabel];
}

- (void)defineLayout
{
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@44);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.header.mas_bottom).with.offset(15);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView);
        make.left.equalTo(self.imageView.mas_right).offset(10);
        make.height.equalTo(@17);
        make.width.lessThanOrEqualTo(@80);
    }];
}

- (void)setFlag:(BOOL)flag
{
    if (flag) {
        [self.header mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.width.equalTo(self);
            make.height.equalTo(@44);
        }];
    } else {
        [self.header mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.width.equalTo(self);
            make.height.equalTo(@0);
        }];
        
    }
    self.header.hidden = !flag;
    _flag = flag;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show_time_icon"]];
    }
    return _imageView;
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [UIView createLabel:CGRectZero text:nil size:14 textColor:HexRGB(0x878787)];
    }
    return _textLabel;
}

- (OrderSectionHeader *)header
{
    if (!_header) {
        _header = [[OrderSectionHeader alloc] init];
    }
    return _header;
}

@end
