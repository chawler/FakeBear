//
//  BaseCell.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation BaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)addSubviews
{
    [self.contentView addSubview:self.containerView];
}

- (void)defineLayout
{
    
}

- (void)layoutSubviewsWithData:(id)data
{
    assert(@"must be override!!!");
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

@end
