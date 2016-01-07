//
//  UIPlaceHolderTextView.h
//  Chufaba
//
//  Created by 张辛欣 on 13-5-21.
//  Copyright (c) 2013年 ChufabaAPP团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIFont *placeholderFont;
@property (nonatomic, strong) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
