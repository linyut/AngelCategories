//
//  NSString+FormatTime.h
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormatTime)

/**
 *  传入秒数，格式化日期
 *
 *  @param second    秒数
 *  @param formatStr 格式化
 *
 *  @return 格式化的时间字符串
 */
+ (NSString *)stringWithTimeInterval:(long long)second formatString:(NSString *)formatStr;
@end
