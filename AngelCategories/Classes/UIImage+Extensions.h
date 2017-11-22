//
//  UIImage+Extensions.h
//  boc_ios
//
//  Created by scs on 2016/11/19.
//  Copyright © 2016年 中行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)


/**
 颜色转图片

 @param color 颜色值

 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  图片的压缩方法
 *
 *  @param sourceImg   要被压缩的图片
 *  @param defineWidth 要被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+ (UIImage *)IMGCompressed:(UIImage *)sourceImg targetWidth:(CGFloat)defineWidth;

- (UIImage*) normalizedImage;



@end
