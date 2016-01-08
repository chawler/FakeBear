//
//  UIViewController+CustomNavController.m
//  Das
//
//  Created by Neo on 14-8-3.
//  Copyright (c) 2014年 Neo. All rights reserved.
//

#import "UIViewController+CustomNavController.h"
#import <objc/runtime.h>

#define kNavigationTitleSize 14
#define kNavigationSubTitleSize 12.0f

@interface UIViewController(Private)

@property (nonatomic, strong) UIView *defaultBgView;
@property (nonatomic, strong) UIView *defaultNoDataBgView;

- (void)onBackNav:(id)sender;

@end

@implementation UIViewController (CustomNavController)

const void *transferKey = (void*)@"Transfer";
const void *defaultView = (void*)@"DefaultView";
const void *defaultNoDataView = (void*)@"DefaultNoDataView";
const void *defaultBlock = (void*)@"DefaultViewBlock";

static char rightNavItemkey;
static char leftNavItemkey;

- (void)setTransfer:(NSObject *)transfer
{
    objc_setAssociatedObject(self, transferKey, transfer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSObject *)transfer
{
    return objc_getAssociatedObject(self, transferKey);
}

- (void)setDefaultBgView:(UIView *)defaultBgView
{
    objc_setAssociatedObject(self, defaultView, defaultBgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)defaultBgView
{
    return objc_getAssociatedObject(self, defaultView);
}

-(void)setDefaultNoDataBgView:(UIView *)defaultNoDataBgView
{
    objc_setAssociatedObject(self, defaultNoDataView, defaultNoDataBgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)defaultNoDataBgView
{
    return objc_getAssociatedObject(self, defaultNoDataView);
}

- (void)setDefaultViewBlock:(void (^)(void))defaultViewBlock
{
    objc_setAssociatedObject(self, defaultBlock, defaultViewBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))defaultViewBlock
{
    return objc_getAssociatedObject(self, defaultBlock);
}

- (void)onClickRight:(id)sender
{
    RightNavigationItemBlock block = objc_getAssociatedObject(self, &rightNavItemkey);
    if (block) {
        block();
    }
}


- (void)onClickLeft:(id)sender
{
    LeftNavigationItemBlock block = objc_getAssociatedObject(self, &leftNavItemkey);
    if (block) {
        block();
    }
}

- (void)setCustomNavigationLeftNil
{
//    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain handler:nil];
}

- (void)setCustomNavigationLeftItemWithBlock:(LeftNavigationItemBlock) block
{
    objc_setAssociatedObject(self, &leftNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIImage *normal = [UIImage imageNamed:@"back_gray_icon"];
    UIImage *selected = [UIImage imageNamed:@"back_gray_icon"];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];;
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:selected forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    [btn addTarget:self action:@selector(onClickLeft:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setDefaultNavigationLeftItem
{
    [self setDefaultNavigationLeftItemWithOffset:0];
}

- (void)setDefaultNavigationLeftItemWithOffset:(CGFloat)offset
{
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_gray_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(onBackNav:)];
    [backBarButtonItem setBackgroundVerticalPositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = 0;
    self.navigationItem.leftBarButtonItems = @[fixedSpace, backBarButtonItem];
}

- (void)setCustomNavigationLeftItem:(NSString*)text Block:(LeftNavigationItemBlock)block
{
    [self setCustomNavigationLeftItem:text Font:kFont(kNavigationTitleSize) FontColor:[UIColor blackColor] Block:block];
}

- (void)setCustomNavigationLeftItem:(NSString*)text tintColor:(UIColor *)textColor Block:(LeftNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &leftNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(onClickLeft:)];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setCustomNavigationLeftItem:(NSString*)text
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:nil];
    buttonItem.enabled = NO;
    self.navigationItem.leftBarButtonItem = buttonItem;
}

- (void)setCustomNavigationLeftItem:(NSString*)text Font:(UIFont*)font FontColor:(UIColor*)textColor Block:(LeftNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &leftNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(onClickLeft:)];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
}

- (void)setCustomNavigationLeftItem:(UIImage *)normal Selected:(UIImage*)selected  Block:(LeftNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &leftNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];;
    [leftBtn setImage:normal forState:UIControlStateNormal];
    [leftBtn setImage:selected forState:UIControlStateHighlighted];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [leftBtn addTarget:self action:@selector(onClickLeft:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setCustomNavigationLeftItem:(UIImage*)normal Selected:(UIImage*)selected
{
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];;
    [leftBtn setImage:normal forState:UIControlStateNormal];
    [leftBtn setImage:selected forState:UIControlStateHighlighted];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [leftBtn addTarget:self action:@selector(onBackNav:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = buttonItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setCustomNavigationLeftItemWithImage:(UIImage *)normal Block:(RightNavigationItemBlock)block
{
    [self setCustomNavigationLeftItemWithImage:normal adjustmentOffset:0 Block:block];
}

- (void)setCustomNavigationLeftItemWithImage:(UIImage *)normal adjustmentOffset:(CGFloat)offset Block:(RightNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &leftNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:normal style:UIBarButtonItemStylePlain target:self action:@selector(onClickLeft:)];
    [leftBarButtonItem setBackgroundVerticalPositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -5;
    
    self.navigationItem.leftBarButtonItems = @[space, leftBarButtonItem];
}

- (void)setCustomNavigationRightItemWithImage:(UIImage *)normal Block:(RightNavigationItemBlock)block
{
    [self setCustomNavigationRightItemWithImage:normal adjustmentOffset:0 Block:block];
}

- (void)setCustomNavigationRightItemWithImage:(UIImage *)normal adjustmentOffset:(CGFloat)offset Block:(RightNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &rightNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(onClickRight:)];
    [rightBarButtonItem setBackgroundVerticalPositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -5;
    
    self.navigationItem.rightBarButtonItems = @[space, rightBarButtonItem];
}


- (void)setCustomNavigationRightItem:(UIImage*)normal Selected:(UIImage*)selected Block:(RightNavigationItemBlock) block
{
    objc_setAssociatedObject(self, &rightNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:selected forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [btn addTarget:self action:@selector(onClickRight:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setCustomNavigationRightItem:(NSString*)text Block:(RightNavigationItemBlock)block
{
    [self setCustomNavigationRightItem:text Font:kFont(kNavigationTitleSize) FontColor:[UIColor blackColor] Block:block];
}

- (void)setCustomNavigationRightItem:(NSString*)text tintColor:(UIColor *)textColor Block:(RightNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &rightNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(onClickRight:)];
    
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

//设置右边按钮
- (void)setCustomNavigationRightItem:(NSString*)text
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:nil];
    buttonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)setCustomNavigationRightItem:(NSString*)text Font:(UIFont*)font FontColor:(UIColor*)textColor Block:(RightNavigationItemBlock)block
{
    objc_setAssociatedObject(self, &rightNavItemkey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(onClickRight:)];
    
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)onBackNav:(id)sender
{
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)addDefaultView:(UIView *)view
{
    self.defaultBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    self.defaultBgView.backgroundColor = HexRGB(0xf2f2f2);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth - 90)/2, (kDeviceHeight - 300)/2 + 12, 90, 90)];
    [imageView setImage:[UIImage imageNamed:@"empty-list"]];
    UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.yHeight - 20, kDeviceWidth, 100)];
    tips.textAlignment = NSTextAlignmentCenter;
    tips.numberOfLines = 0;
    tips.lineBreakMode = NSLineBreakByWordWrapping;
    tips.text = @"数据加载失败\n请检查你的手机是否联网,点击按钮重新加载";
    tips.font = kFont(kNavigationTitleSize);
    tips.textColor = HexRGB(0xb2b2b2);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kDeviceWidth - 280)/2, tips.yHeight - 15, 280, 44);
    [button setTitle:@"重新加载" forState:UIControlStateNormal];
    button.backgroundColor = HexRGB(0X32BE5B);
    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(reloadDefaultData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.defaultBgView addSubview:imageView];
    [self.defaultBgView addSubview:tips];
    [self.defaultBgView addSubview:button];
    [view addSubview:self.defaultBgView];
}

- (void)removeDefaultView
{
    if (self.defaultBgView) {
        [self.defaultBgView removeFromSuperview];
    }
}

- (void)reloadDefaultData
{
    self.defaultViewBlock();
}

- (void)addNoDataDefaultView:(UIView *)view tips:(NSString *)tip
{
    if (self.defaultNoDataBgView) {
        return;
    }
    self.defaultNoDataBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    self.defaultNoDataBgView.backgroundColor = HexRGB(0xf2f2f2);
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, kDeviceWidth - 2*20, 100)];
    contentLabel.textColor = HexRGB(0xb2b2b2);
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = tip;
    contentLabel.font = kFont(kNavigationTitleSize);
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.defaultNoDataBgView addSubview:contentLabel];
    [view addSubview:self.defaultNoDataBgView];
}

- (void)removeNoDataDefaultView
{
    if (self.defaultNoDataBgView) {
        [self.defaultNoDataBgView removeFromSuperview];
        self.defaultNoDataBgView = nil;
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //用UIImagePickerController会导致statusbar的样式变成黑色 需还原回来
    if ([navigationController isKindOfClass:[UIImagePickerController class]] &&
        ((UIImagePickerController *)navigationController).sourceType ==	 UIImagePickerControllerSourceTypePhotoLibrary) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
}


-(float)heightOfNavAndStatusBar
{
    return self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
}


@end
