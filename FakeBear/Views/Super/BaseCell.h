//
//  BaseCell.h
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell

- (void)addSubviews;
- (void)defineLayout;

- (void)layoutSubviewsWithData:(id)data;

@end
