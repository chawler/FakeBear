//
//  QRScanController.m
//  FakeBear
//
//  Created by 郑先生 on 16/2/17.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "QRScanController.h"
#import "QRVerifyController.h"
#import "Order.h"
#import "QRCodeView.h"

@interface QRScanController () <QRCodeViewDelegate>

@property (nonatomic, strong) Order *order;
@property (nonatomic, strong) QRCodeView *qrCodeView;
@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation QRScanController

- (id)initWithOrder:(Order *)order
{
    if (self = [super init]) {
        self.order = order;
        self.title = @"扫码验证";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavigationLeftItem];
    [self.view addSubview:self.qrCodeView];
    [self.view addSubview:self.tipsLabel];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.qrCodeView start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)qrCodeView:(QRCodeView *)qrCodeView didCatchCodeString:(NSString *)codeString
{
    if (codeString.length > 0) {
        [codeString writeToFile:[DOCUMENT_FOLDER stringByAppendingPathComponent:@"test.txt"] atomically:YES withBlock:^(BOOL result) {
            if (result) {
                NSLog(@"二维码内容写入成功");
            }
        }];
    }
    QRVerifyController *qrvc = [[QRVerifyController alloc] initWithOrder:self.order];
    [self.navigationController pushViewController:qrvc animated:YES];
}

- (QRCodeView *)qrCodeView
{
    if (!_qrCodeView) {
        _qrCodeView = [[QRCodeView alloc] initWithFrame:self.view.bounds];
        _qrCodeView.delegate = self;
    }
    return _qrCodeView;
}

- (UILabel *)tipsLabel
{
    if (!_tipsLabel) {
        _tipsLabel = [UIView createLabel:CGRectMake(0, (self.view.height)/3*2+40, kDeviceWidth, 20) text:@"将二维码放入框内，即可自动扫描" size:18 textColor:[UIColor whiteColor]];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipsLabel;
}

@end
