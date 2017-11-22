//
//  UIButton+CountDown.m
//  ZhongRongJinFu
//
//  Created by Yosef Lin on 10/16/15.
//  Copyright © 2015 Yosef Lin. All rights reserved.
//

#import "UIButton+CountDown.h"
#import "NSObject+Associate.h"

/**
 *  按钮标题
 */
static const char ButtonCountDownButtonName = 0;
/**
 *  倒计时时间
 */
static const char ButtonCountDownCountDownTime = 0;
/**
 *  计时器
 */
static const char ButtonCountDownTimer = 0;
/**
 *  计时结束后按钮显示的标题
 */
static const char ButtonCountDownEndButtonName = 0;
/**
 *  格式化输出格式
 */
static const char ButtonCountDownFormat = 0;

/**
 *  按钮是否可以触发
 */
static const char ButtonCountDownEnable = 0;

@implementation UIButton(CountDown)

-(void)startCountDown:(NSTimeInterval)time;
{
    self.enabled = NO;
    //存储当前标题，和时间
    [self setAssociatedObject:self.titleLabel.text forKey:&ButtonCountDownButtonName];
    [self setAssociatedObject:@(time) forKey:&ButtonCountDownCountDownTime];
    
    NSTimer* countDownTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(countdownTimer:) userInfo:nil repeats:YES];
    [self setAssociatedObject:countDownTimer forKey:&ButtonCountDownTimer];

    [self setTitle:[NSString stringWithFormat:@""] forState:UIControlStateDisabled];
    [[NSRunLoop currentRunLoop] addTimer:countDownTimer forMode:NSRunLoopCommonModes];
}

-(void)countdownTimer:(id)sender
{
    NSTimeInterval countDownSecs = [[self getAssociatedObjectForKey:&ButtonCountDownCountDownTime] doubleValue];
    NSTimer* countDownTimer = [self getAssociatedObjectForKey:&ButtonCountDownTimer];
    if( --countDownSecs <= 0 )
    {
        [countDownTimer invalidate];
        countDownTimer = nil;
        //计时结束后，判断是否可再被触发
        self.enabled = [[self getAssociatedObjectForKey:&ButtonCountDownEnable] boolValue];
        if ([self getAssociatedObjectForKey:&ButtonCountDownEndButtonName] == nil) {
            [self setTitle:[self getAssociatedObjectForKey:&ButtonCountDownButtonName] forState:UIControlStateDisabled];
        }
        else
        {
            [self setTitle:[self getAssociatedObjectForKey:&ButtonCountDownEndButtonName] forState:UIControlStateDisabled];
            [self setTitle:[self getAssociatedObjectForKey:&ButtonCountDownEndButtonName] forState:UIControlStateNormal];
        }
    }
    else
    {
        if([self getAssociatedObjectForKey:&ButtonCountDownFormat] == nil)
        {
            [self setTitle:[NSString stringWithFormat:@"%ld秒后重试",(long)countDownSecs] forState:UIControlStateDisabled];
        }
        else
        {
            [self setTitle:[NSString stringWithFormat:[self getAssociatedObjectForKey:&ButtonCountDownFormat],(long)countDownSecs] forState:UIControlStateDisabled];
        }
    }
    [self setAssociatedObject:@(countDownSecs) forKey:&ButtonCountDownCountDownTime];
}

- (void)setEndCountDownTitle:(NSString *)endTitle
{
    [self setAssociatedObject:endTitle forKey:&ButtonCountDownEndButtonName];
}

- (void)setFormatString:(NSString *)format
{
    [self setAssociatedObject:format forKey:&ButtonCountDownFormat];
}

- (void)setButtonEnable:(BOOL)isEnable
{
    //计时结束
    if ([[self getAssociatedObjectForKey:&ButtonCountDownCountDownTime] doubleValue] == 0) {
        [self setEnabled:isEnable];
    }
    [self setAssociatedObject:@(isEnable) forKey:&ButtonCountDownEnable];
}
@end
