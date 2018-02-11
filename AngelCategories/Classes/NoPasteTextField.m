//
//  NoPasteTextField.m
//  PBPS-MA
//
//  Created by 方寸山 on 2017/5/26.
//  Copyright © 2017年 BOC_PBPS. All rights reserved.
//

#import "NoPasteTextField.h"

@implementation NoPasteTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) || action == @selector(select:) || action == @selector(selectAll:)) {
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

@end
