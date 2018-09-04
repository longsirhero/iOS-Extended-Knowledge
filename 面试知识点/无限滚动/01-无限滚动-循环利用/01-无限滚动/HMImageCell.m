//
//  HMImageCell.m
//  01-无限滚动
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMImageCell.h"


@interface HMImageCell()
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation HMImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}

- (void)setIcon:(NSString *)icon
{
    _icon = [icon copy];
    
    self.imageView.image = [UIImage imageNamed:icon];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 5;
    CGFloat y = 0;
    CGFloat w = self.bounds.size.width - 2 * x;
    CGFloat h = self.bounds.size.height;
    self.imageView.frame = CGRectMake(x, y, w, h);
}

@end
