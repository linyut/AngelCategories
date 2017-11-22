//
//  UIButton+RdNormal.h
//  Pods
//
//  Created by Liang Shen on 2016/11/16.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (RdNormal)

/**
 *  设置背景颜色 三合一
 *
 *  @param normalColor  正常颜色
 *  @param hightedColor 高亮颜色
 *  @param disableColor 不可点击颜色
 */
-(void)setNormalBackground:(UIColor *)normalColor withHightedColor:(UIColor *)hightedColor withDisabelColor:(UIColor *)disableColor;

/**
 *  设置正常的按钮颜色  按钮可点击
 *
 *  @param normalColor 颜色色值
 */
-(void)setNormalBackground:(UIColor *)normalColor;
/**
 *  设置选中以后的颜色  按钮可点击
 *
 *  @param hightedColor 颜色色值
 */
-(void)setHighlightedBackground:(UIColor *)hightedColor;
/**
 *  设置按钮不可点击的颜色 按钮不可点击
 *
 *  @param disableColor 颜色色值
 */
-(void)setDisableClickBackground:(UIColor *)disableColor;


@end
