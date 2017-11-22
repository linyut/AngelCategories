//
//  UITableViewCell+Bottomline.h
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Bottomline)

/**
 *  隐藏线条
 */
- (void)hiddenLine;
/**
 * 显示整条线条
 */
- (void)wholeLine;
/**
 *  左右相等间距
 *
 *  @param space 间距
 */
- (void)equalSpacing:(CGFloat)space;
@end
