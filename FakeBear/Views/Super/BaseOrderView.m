//
//  BaseOrderView.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseOrderView.h"
#import "Course.h"
#import "Gym.h"
#import "Xxquan.h"
#import "NSDate+Helper.h"
#import "ActionHelper.h"

@interface BaseOrderView()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *courseIcon;
@property (nonatomic, strong) UILabel *courseNameLabel;
@property (nonatomic, strong) UILabel *courseTimeLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIImageView *locIcon;
@property (nonatomic, strong) UILabel *locDetailLabel;
@property (nonatomic, strong) UIImageView *sepLine;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIImageView *verLine;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) Order *order;

@end

@implementation BaseOrderView

- (void)addSubviews
{
    [super addSubviews];
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.courseIcon];
    [self.containerView addSubview:self.courseNameLabel];
    [self.containerView addSubview:self.courseTimeLabel];
    [self.containerView addSubview:self.statusLabel];
    [self.containerView addSubview:self.locIcon];
    [self.containerView addSubview:self.locDetailLabel];
    [self.containerView addSubview:self.sepLine];
    [self.containerView addSubview:self.verLine];
    [self.containerView addSubview:self.leftBtn];
    [self.containerView addSubview:self.rightBtn];
}

- (void)defineLayout
{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(3, 18, 14, 18));
    }];
    [self.courseIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView.mas_left).offset(15);
        make.top.equalTo(self.containerView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseIcon.mas_right).offset(10);
        make.top.equalTo(self.courseIcon.mas_top);
        make.size.mas_equalTo(CGSizeMake(64, 20));
    }];
    [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseNameLabel.mas_right).offset(10);
        make.top.equalTo(self.containerView.mas_top).offset(16.5);
        make.size.mas_equalTo(CGSizeMake(85, 17));
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.containerView.mas_right).offset(-15);
        make.top.equalTo(self.courseTimeLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(42, 17));
    }];
    [self.locIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.courseNameLabel.mas_bottom).offset(3);
        make.left.equalTo(self.courseNameLabel.mas_left).offset(-3);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    [self.locDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locIcon);
        make.left.equalTo(self.locIcon.mas_right).offset(2);
        make.right.equalTo(self.containerView.mas_right).offset(-15);
    }];
    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.locIcon.mas_bottom).offset(10);
        make.left.equalTo(self.containerView.mas_left).offset(15);
        make.right.equalTo(self.containerView.mas_right).offset(-15);
        make.height.equalTo(@1);
    }];
    [self.verLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.sepLine.mas_bottom).offset(5);
        make.width.equalTo(@1);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-5);
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verLine.mas_top);
        make.left.equalTo(self.sepLine.mas_left);
        make.right.equalTo(self.verLine.mas_left);
        make.height.equalTo(@33);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verLine.mas_top);
        make.width.equalTo(self.leftBtn);
        make.left.equalTo(self.verLine.mas_right);
        make.height.equalTo(@33);
    }];
}

- (void)layoutSubviewsWithData:(Order *)order
{
    _order = order;
    
    self.courseNameLabel.text = order.course.name;
    
    NSString *start = [order.course.start stringWithFormat:@"HH:mm"];
    NSString *end = [order.course.endProperty stringWithFormat:@"HH:mm"];
    self.courseTimeLabel.text = [start append:@"-%@", end];
    
    if (order.status == 0) {
        self.statusLabel.text = @"已过期";
    } else {
        self.statusLabel.text = @"已验证";
    }
    
    self.locDetailLabel.text = order.gym.name;
    
    if (order.xxquan.checkin > 0) {
        [self.leftBtn setTitle:@"查看打卡" forState:UIControlStateNormal];
    } else {
        [self.leftBtn setTitle:@"健身打卡" forState:UIControlStateNormal];
    }
    self.leftBtn.enabled = self.rightBtn.enabled = (order.status > 0);
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.cornerRadius = 5.0f;
    }
    return _containerView;
}

- (UIImageView *)courseIcon
{
    if (!_courseIcon) {
        _courseIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"108_apparatus_icon"]];
    }
    return _courseIcon;
}

- (UILabel *)courseNameLabel
{
    if (!_courseNameLabel) {
        _courseNameLabel = [UIView createLabel:CGRectZero text:nil size:16 textColor:HexRGB(0x4C4E53)];
    }
    return _courseNameLabel;
}

- (UILabel *)courseTimeLabel
{
    if (!_courseTimeLabel) {
        _courseTimeLabel = [UIView createLabel:CGRectZero text:nil size:14 textColor:HexRGB(0x535353)];
    }
    return _courseTimeLabel;
}

- (UILabel *)statusLabel
{
    if (!_statusLabel) {
        _statusLabel = [UIView createLabel:CGRectZero text:nil size:14 textColor:HexRGB(0xAAAAAA)];
    }
    return _statusLabel;
}

- (UIImageView *)locIcon
{
    if (!_locIcon) {
        _locIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gym-location"]];
    }
    return _locIcon;
}

- (UILabel *)locDetailLabel
{
    if (!_locDetailLabel) {
        _locDetailLabel = [UIView createLabel:CGRectZero text:nil size:14 textColor:HexRGB(0x878787)];
    }
    return _locDetailLabel;
}

- (UIImageView *)sepLine
{
    if (!_sepLine) {
        _sepLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gym-hor-line-light"]];
    }
    return _sepLine;
}

- (UIButton *)leftBtn
{
    if (!_leftBtn) {
        ESWeakSelf;
        _leftBtn = [UIView createButton:CGRectZero size:17 title:@"健身打卡" titleColor:HexRGB(0x555555)];
        [_leftBtn setTitleColor:HexRGB(0xAAAAAA) forState:UIControlStateDisabled];
        [_leftBtn addTargetActionWithBlock:^{
            [ActionHelper sharedInstance].onCheckin(__weakSelf.order);
        }];
    }
    return _leftBtn;
}

- (UIImageView *)verLine
{
    if (!_verLine) {
        _verLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gym-vert-line-light"]];
    }
    return _verLine;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIView createButton:CGRectZero size:17 title:@"点评一下" titleColor:HexRGB(0x555555)];;
        [_rightBtn setTitleColor:HexRGB(0xAAAAAA) forState:UIControlStateDisabled];
    }
    return _rightBtn;
}

@end
