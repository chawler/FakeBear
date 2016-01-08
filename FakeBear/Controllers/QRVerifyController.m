//
//  QRVerifyController.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/8.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "QRVerifyController.h"
#import "Order.h"
#import "Course.h"
#import "Gym.h"
#import "NSDate+Helper.h"

@interface QRVerifyController ()

@property (nonatomic, strong) Order *order;
@property (nonatomic, strong) UIImageView *successIcon;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *successLabel;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, copy) NSArray *subjects;
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UIButton *entryBtn;

@end

@implementation QRVerifyController

- (id)initWithOrder:(Order *)order
{
    if (self = [super init]) {
        self.order = order;
        self.hidesBottomBarWhenPushed = YES;
        self.subjects = @[@"验证码：", @"课程：", @"时间：", @"场馆："];
        self.items = @[order.orderCode, order.course.name, [[[NSDate date] stringWithFormat:@"MM月dd日"] append:@" 10:00-21:00"], order.gym.name];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码验证";
    
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.successIcon];
    
    [self.scrollView addSubview:self.successLabel];
    
    [self.scrollView addSubview:self.containerView];
    
    [self.scrollView addSubview:self.entryBtn];
    
    [self layoutSubviews];
    
    [self setupData];
}

- (void)setupData
{
    UILabel *last = nil;
    for (int i=0; i<self.subjects.count; i++) {
        UILabel *label = [UIView createLabel:CGRectZero text:self.subjects[i] size:15 textColor:HexRGB(0x676767)];
        label.textAlignment = NSTextAlignmentRight;
        [self.containerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView.mas_left);
            make.top.equalTo(last ? last.mas_bottom : self.containerView.mas_top).offset(last ? 23 : 30);
            make.size.mas_equalTo(CGSizeMake(80, 18));
        }];
        UILabel *subLabel = [UIView createLabel:CGRectZero text:self.items[i] size:15 textColor:HexRGB(0x4a4853)];
        [self.containerView addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label.mas_right);
            make.centerY.equalTo(label);
            make.size.mas_lessThanOrEqualTo(CGSizeMake(200, 18));
        }];
        last = label;
    }
}

- (void)layoutSubviews
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.successIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView).offset(35);
        make.centerX.equalTo(self.scrollView);
        make.size.mas_equalTo(self.successIcon.size);
    }];
    [self.successLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.successIcon.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_lessThanOrEqualTo(CGSizeMake(80, 20));
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.successLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(kDeviceWidth-40, 200));
    }];
    [self.entryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 48));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    }
    return _scrollView;
}

- (UIImageView *)successIcon
{
    if (!_successIcon) {
        _successIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-in-success"]];
    }
    return _successIcon;
}

- (UILabel *)successLabel
{
    if (!_successLabel) {
        _successLabel = [UIView createLabel:CGRectZero text:@"验证成功" size:17 textColor:HexRGB(0x59c25d)];
        _successLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _successLabel;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = HexRGB(0xf1f1f1);
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.cornerRadius = 5.0f;
        _containerView.layer.borderColor = HexRGB(0xd5d5d5).CGColor;
        _containerView.layer.borderWidth = 1.0f;
    }
    return _containerView;
}

- (UIButton *)entryBtn
{
    if (!_entryBtn) {
        _entryBtn = [UIView createButton:CGRectZero size:16 title:@"确定" titleColor:[UIColor whiteColor]];
        _entryBtn.layer.masksToBounds = YES;
        _entryBtn.layer.cornerRadius = 5.0f;
        _entryBtn.backgroundColor = HexRGB(0xf81f18);
    }
    return _entryBtn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
