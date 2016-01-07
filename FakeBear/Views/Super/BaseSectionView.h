//
//  BaseSectionView.h
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSectionView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIImageView *imageView;

- (void)addSubviews;
- (void)defineLayout;

@end
