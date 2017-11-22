//
//  UIImage+Resize.h
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)


-(UIImage *)transformtoSize:(CGSize)Newsize;
//头像
-(UIImage *)icontoSize:(CGSize)Newsize1;
/**
 *  重绘，将图片画成圆形
 *
 *  @param image 操作图片
 *
 *  @return 返回结果
 */
+ (UIImage *)drawRound:(UIImage *)image;
/**
 *  重绘，加边框，圆形
 *
 *  @param image  加工图片
 *  @param border 边框宽度
 *  @param color  边框颜色
 *
 *  @return 返回结果
 */
+ (UIImage *)drawRound:(UIImage *)image border:(CGFloat)border borderColor:(UIColor *)color;

@end
