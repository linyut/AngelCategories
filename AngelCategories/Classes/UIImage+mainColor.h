//
//  UIImage+mainColor.h
//  Pods
//
//  Created by hey on 2016/11/22.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (mainColor)

/**
 获取uiimage 主色调

 @param image image
 @return rgb 色值
 */
+(UIColor*)ImageMostColor:(UIImage*)image;
@end
