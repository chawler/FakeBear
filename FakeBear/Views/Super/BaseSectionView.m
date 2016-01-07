//
//  BaseSectionView.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseSectionView.h"

@implementation BaseSectionView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)addSubviews
{
    [self.contentView addSubview:self.imageView];
}

- (void)defineLayout
{
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    UIView *v = [UIView new];
    v.backgroundColor = backgroundColor;
    self.backgroundView = v;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
