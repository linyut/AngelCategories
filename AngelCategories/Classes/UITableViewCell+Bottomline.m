//
//  UITableViewCell+Bottomline.m
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import "UITableViewCell+Bottomline.h"

@implementation UITableViewCell (Bottomline)

- (void)hiddenLine
{
    UIEdgeInsets line = UIEdgeInsetsMake(0, 0, 0, 500);
    [self setInsertEdge:line];
}

- (void)wholeLine
{
    UIEdgeInsets line = UIEdgeInsetsMake(0, 0, 0, 0);
    [self setInsertEdge:line];
}


- (void)equalSpacing:(CGFloat)space
{
    UIEdgeInsets line = UIEdgeInsetsMake(0, space, 0, space);
    [self setInsertEdge:line];
}
//设置间隙线条
- (void)setInsertEdge:(UIEdgeInsets)line
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:line];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:line];
    }
}

@end
