//
//  NSString+FormatNumber.h
//  YinMiJinRong
//
//  Created by erongdu_cxk on 16/1/5.
//  Copyright © 2016年 Mr_zhaohy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormatNumber)


/**
 *  数值转换成字符串，解决出现显示0.000...0001或者0.999...9999问题
 *  一般进过计算会出现这样的问题
 *
 *  @param doubleValue 数值
 *
 *  @return 返回正确的字符串
 */
+ (NSString *)numberStringWithDouble:(double)doubleValue;

/**
 *  对数值进行格式化，形式是###,###.##最多显示2位小数
 *
 *  @param doubleValue 数值
 *
 *  @return 返回格式化的字符串
 */
+ (NSString *)stringNumberFormatterWithDoubleAutoDot:(double)doubleValue;

/**
 *  对数值进行格式化，形式是###,###.00固定2位小数
 *
 *  @param doubleValue 数值
 *
 *  @return 返回格式化的字符串
 */
+ (NSString *)stringNumberFormatterWithDouble:(double)doubleValue;

/**
 数值转换成###.##不进行格式化，小数点最多2位

 @param doubleValue 数值
 @return 字符串
 */
+ (NSString *)stringNoNumberFormatterWithDoubleAutoDot:(double)doubleValue;


/**
 字符串格式化 加空格

 @param str 原字符串
 @param start 位置
 @return 字符串
 */
+(NSString *)formatNumberWithString:(NSMutableString *)str startIndex:(NSUInteger)start;


/**
 数值转中文
 
 @param number 数值
 @return 字符串
 */
+ (NSString *)chineseNumber:(NSInteger)number;
@end
