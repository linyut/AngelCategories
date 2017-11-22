//
//  RDCountDownButton.h
//  baianlicai
//
//  Created by Liang Shen on 16/5/19.
//  Copyright © 2016年 Yosef Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RDCountDownButton;
typedef NSString* (^CountDownChanging)(RDCountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(RDCountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(RDCountDownButton *countDownButton,NSInteger tag);

@interface RDCountDownButton : UIButton
{
    NSInteger _second;
    NSUInteger _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
    
    CountDownChanging _countDownChanging;
    CountDownFinished _countDownFinished;
    TouchedCountDownButtonHandler _touchedCountDownButtonHandler;
}
@property(nonatomic,strong) id userInfo;

-(void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
-(void)countDownChanging:(CountDownChanging)countDownChanging;
-(void)countDownFinished:(CountDownFinished)countDownFinished;

-(void)startCountDownWithSecond:(NSUInteger)second;
-(void)stopCountDown;
@end
