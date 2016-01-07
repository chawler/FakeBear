//
//  UIView+UIFactory.h
//  Chufaba
//
//  Created by 郑先生 on 14-11-12.
//  Copyright (c) 2014年 ChufabaAPP团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIFactory)

// Line
+ (id)createLineView:(CGRect)frame;
+ (id)createLineView:(CGRect)frame color:(UIColor *)color;

// Label
+ (id)createLabel;
+ (id)createLabel:(CGRect)frame;
+ (id)createLabel:(CGRect)frame text:(NSString *)text;
+ (id)createLabel:(CGRect)frame text:(NSString *)text size:(CGFloat)fontSize;
+ (id)createLabel:(CGRect)frame text:(NSString *)text size:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (id)createLabel:(CGRect)frame text:(NSString *)text size:(CGFloat)fontSize textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;

// TextField
+ (id)createTextField;
+ (id)createTextField:(CGRect)frame textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize placeholderFontSize:(CGFloat)placeholderFontSize placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor backgroundColor:(UIColor *)backgroundColor;
+ (id)createTextField:(CGRect)frame textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize placeholderFontSize:(CGFloat)placeholderFontSize placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


// TextView
+ (id)createTextView;
+ (id)createTextView:(CGRect)frame;
+ (id)createTextView:(CGRect)frame size:(CGFloat)fontSize;
+ (id)createTextView:(CGRect)frame size:(CGFloat)fontSize placeholder:(NSString *)placeholder;
+ (id)createTextView:(CGRect)frame size:(CGFloat)fontSize placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor;

// Button
+ (id)createButton:(CGRect)frame;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize;
+ (id)createButton:(CGRect)frame image:(UIImage *)image;
+ (id)createButton:(CGRect)frame image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
+ (id)createButton:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize title:(NSString *)title;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize title:(NSString *)title titleColor:(UIColor *)titleColor;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize title:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize title:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor;
+ (id)createButton:(CGRect)frame size:(CGFloat)fontSize title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor  cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

// ImageView
+ (id)createImageView;
+ (id)createImageView:(CGRect)frame;
+ (id)createImageView:(CGRect)frame image:(UIImage *)image;
+ (id)createImageView:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;
+ (id)createImageView:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage cornerRadius:(CGFloat)cornerRadius;

// ScrollView
+ (id)createScrollView;
+ (id)createScrollView:(CGRect)frame;
+ (id)createScrollView:(CGRect)frame contentSize:(CGSize)contentSize;
+ (id)createScrollView:(CGRect)frame contentSize:(CGSize)contentSize showsScrollIndicator:(BOOL)showsScrollIndicator;
+ (id)createScrollView:(CGRect)frame contentSize:(CGSize)contentSize showsScrollIndicator:(BOOL)showsScrollIndicator pagingEnabled:(BOOL)pagingEnabled;

// NavigationBar
+ (void)setNavigationBarStyle:(UINavigationBar *)navBar isGreen:(BOOL)isGreen isWhite:(BOOL)isWhite;

+ (UINavigationBar *)setFakeNavigationBarStyle:(UINavigationBar *)navBar forView:(UIView *)view isGreen:(BOOL)isGreen isWhite:(BOOL)isWhite;

- (void)distributeSpacingHorizontallyWith:(NSArray *)views vWidth:(CGFloat)width;

@end
