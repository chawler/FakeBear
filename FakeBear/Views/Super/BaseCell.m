//
//  BaseCell.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseCell.h"

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
    
}

- (void)defineLayout
{
    
}

- (void)layoutSubviewsWithData:(id)data
{
    assert(@"must be override!!!");
}

@end
