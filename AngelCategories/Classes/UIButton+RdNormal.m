//
//  UIButton+RdNormal.m
//  Pods
//
//  Created by Liang Shen on 2016/11/16.
//
//

#import "UIButton+RdNormal.h"
#import "UIImage+Tint.m"

@implementation UIButton (RdNormal)

-(void)setNormalBackground:(UIColor *)normalColor withHightedColor:(UIColor *)hightedColor withDisabelColor:(UIColor *)disableColor
{
    [self setNormalBackground:normalColor];
    [self setHighlightedBackground:hightedColor];
    [self setDisableClickBackground:disableColor];
}

-(void)setNormalBackground:(UIColor *)normalColor
{
    [self setBackgroundImage:[UIImage createImageWithColor:normalColor] forState:UIControlStateNormal];
}

-(void)setHighlightedBackground:(UIColor *)hightedColor
{
    [self setBackgroundImage:[UIImage createImageWithColor:hightedColor] forState:UIControlStateHighlighted];
}

-(void)setDisableClickBackground:(UIColor *)disableColor
{
    [self setBackgroundImage:[UIImage createImageWithColor:disableColor] forState:UIControlStateDisabled];
}

@end
