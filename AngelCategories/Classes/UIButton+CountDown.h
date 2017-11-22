//
//  UIButton+CountDown.h
//  ZhongRongJinFu
//
//  Created by Yosef Lin on 10/16/15.
//  Copyright © 2015 Yosef Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton(CountDown)

/**
 *  开始倒计时
 *
 *  @param time 倒计时时间
 */
-(void)startCountDown:(NSTimeInterval)time;

/**
 *  设置计时结束后显示的标题
 *
 *  @param endTitle 显示的标题
 */
- (void)setEndCountDownTitle:(NSString *)endTitle;
/**
 *  设置倒计时显示的字符串格式
 *
 *  @param format 字符串格式，包含一个%ld
 */
- (void)setFormatString:(NSString *)format;
/**
 *  设置按钮倒计时结束后是否可触发
 *
 *  @param isEnable 是否
 */
- (void)setButtonEnable:(BOOL)isEnable;
@end
