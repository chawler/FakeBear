//
//  UIViewController+CustomNavController.h
//  Das
//
//  Created by Neo on 14-8-3.
//  Copyright (c) 2014年 Neo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LeftNavigationItemBlock)(void);
typedef void (^RightNavigationItemBlock)(void);
typedef void (^DefaultViewBlock)(void);

@interface UIViewController (CustomNavController)<UINavigationControllerDelegate>

@property (nonatomic,retain) NSObject *transfer;
@property (copy) DefaultViewBlock defaultViewBlock;

- (void)setDefaultNavigationLeftItem;
- (void)setDefaultNavigationLeftItemWithOffset:(CGFloat)offset;

- (void)setCustomNavigationLeftItem:(NSString*)text Block:(LeftNavigationItemBlock)block;
- (void)setCustomNavigationLeftItem:(NSString*)text tintColor:(UIColor *)textColor Block:(LeftNavigationItemBlock)block;
- (void)setCustomNavigationLeftItem:(NSString*)text;
- (void)setCustomNavigationLeftItem:(NSString*)text Font:(UIFont*)font FontColor:(UIColor*)textColor Block:(LeftNavigationItemBlock)block;
- (void)setCustomNavigationLeftItemWithBlock:(LeftNavigationItemBlock)block;
- (void)setCustomNavigationLeftItem:(UIImage*)normal Selected:(UIImage*)selected;
- (void)setCustomNavigationLeftItem:(UIImage*)normal Selected:(UIImage*)selected  Block:(LeftNavigationItemBlock)block;

- (void)setCustomNavigationLeftItemWithImage:(UIImage *)normal Block:(RightNavigationItemBlock)block;
- (void)setCustomNavigationRightItemWithImage:(UIImage *)normal Block:(RightNavigationItemBlock)block;
- (void)setCustomNavigationRightItemWithImage:(UIImage *)normal adjustmentOffset:(CGFloat)offset Block:(RightNavigationItemBlock)block;

- (void)setCustomNavigationRightItem:(NSString*)text Block:(RightNavigationItemBlock)block;
- (void)setCustomNavigationRightItem:(NSString*)text tintColor:(UIColor *)textColor Block:(RightNavigationItemBlock)block;
- (void)setCustomNavigationRightItem:(NSString*)text Font:(UIFont*)font FontColor:(UIColor*)textColor Block:(RightNavigationItemBlock)block;
- (void)setCustomNavigationRightItem:(UIImage*)normal Selected:(UIImage*)selected Block:(RightNavigationItemBlock)block;

- (void)setCustomNavigationLeftNil;

- (void)onBackNav:(id)sender;
- (void)setCustomNavigationRightItem:(NSString*)text;

/**
 *  默认页
 *
 *  @param view target view
 */
- (void)addDefaultView:(UIView *)view;
- (void)removeDefaultView;

/**
 *  无数据默认页
 *
 *  @param view
 *  @param tip  
 */
- (void)addNoDataDefaultView:(UIView *)view tips:(NSString *)tip;
- (void)removeNoDataDefaultView;


/*
  导航和状态栏高度
 */

-(float)heightOfNavAndStatusBar;


@end
