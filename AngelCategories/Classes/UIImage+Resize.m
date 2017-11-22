//
//  UIImage+Resize.m
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

-(UIImage *)transformtoSize:(CGSize)Newsize
{
    // 创建一个bitmap的context
    UIGraphicsBeginImageContext(Newsize);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, Newsize.width, Newsize.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *TransformedImg=UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return TransformedImg;
}

-(UIImage *)icontoSize:(CGSize)Newsize1
{
    // 创建一个bitmap的context
    UIGraphicsBeginImageContextWithOptions(Newsize1, NO, 1);
    NSLog(@"%f",[UIScreen mainScreen].scale);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, Newsize1.width, Newsize1.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *TransformedImg=UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return TransformedImg;
}

+ (UIImage *)drawRound:(UIImage *)image
{
    return [self drawRound:image border:0.0 borderColor:[UIColor clearColor]];
}

+ (UIImage *)drawRound:(UIImage *)image border:(CGFloat)border borderColor:(UIColor *)color
{
    CGSize size = CGSizeMake(image.size.width + border, image.size.height + border);
    //创建图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //绘制边框的圆
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    [color set ];
    CGContextFillPath(context);
    //设置头像frame
    CGFloat iconX = border / 2;
    CGFloat iconY = border / 2;
    CGFloat iconW = size.width;
    CGFloat iconH = size.height;
    //绘制圆形头像范围
    CGContextAddEllipseInRect(context, CGRectMake(iconX, iconY, iconW, iconH));
    //剪切可视范围
    CGContextClip(context);
    //绘制头像
    [image drawInRect:CGRectMake(iconX, iconY, iconW, iconH)];
    //取出整个图片上下文的图片
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    return iconImage;
}
@end
