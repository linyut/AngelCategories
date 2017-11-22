//
//  UIImage+Tint.h
//  baianlicai
//
//  Created by Liang Shen on 16/6/30.
//  Copyright © 2016年 Yosef Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

+ (UIImage*)createImageWithColor:(UIColor*) color;

@end
