//
//  NSString+FormatNumber.m
//  YinMiJinRong
//
//  Created by erongdu_cxk on 16/1/5.
//  Copyright © 2016年 Mr_zhaohy. All rights reserved.
//

#import "NSString+FormatNumber.h"
#import "NSObject+Associate.h"

static const char numberFormatChar;
static const char numberChineseChar;

@implementation NSString (FormatNumber)

+ (NSString *)stringFormatString:(NSString *)formatterString doubleValue:(double)doubleValue
{
    NSNumberFormatter *numberFormat = [self getAssociatedObjectForKey:&numberFormatChar];
    if (!numberFormat) {
        numberFormat = [[NSNumberFormatter alloc] init];
        [self setAssociatedObject:numberFormat forKey:&numberFormatChar];
    }
    [numberFormat setPositiveFormat:formatterString];
    return [numberFormat stringFromNumber:[NSNumber numberWithDouble:doubleValue]];
}

+ (NSString *)stringNumberFormatterWithDouble:(double)doubleValue
{
    NSString *formatterString = @"###,##0.00";
    return [self stringFormatString:formatterString doubleValue:doubleValue];
}

+ (NSString *)stringNumberFormatterWithDoubleAutoDot:(double)doubleValue
{
    NSString *formatterString = @"###,###.##";
    return [self stringFormatString:formatterString doubleValue:doubleValue];
}

+ (NSString *)numberStringWithDouble:(double)doubleValue
{
    NSString *stringValue = [NSString stringWithFormat:@"%lf",doubleValue];
    NSDecimalNumber *numValue = [NSDecimalNumber decimalNumberWithString:stringValue];
    NSString *resultString = [numValue stringValue];
    return resultString;
}

+ (NSString *)stringNoNumberFormatterWithDoubleAutoDot:(double)doubleValue
{
    NSString *formatterString = @"###.##";
    return [self stringFormatString:formatterString doubleValue:doubleValue];
}

+(NSString *)formatNumberWithString:(NSMutableString *)str startIndex:(NSUInteger)start{

        int k = 0;
        for (NSUInteger i = start; i < str.length ; i++)
        {

            k++;
            //每隔4个插入一个@“”号
            if (k == 5) {
                [str insertString:@" " atIndex:i];
                k = 0;
            }
        }
        return [str copy];

}

+ (NSString *)chineseNumber:(NSInteger)number
{
    NSNumberFormatter *numberFormat = [self getAssociatedObjectForKey:&numberChineseChar];
    if (!numberFormat) {
        numberFormat = [[NSNumberFormatter alloc] init];
        [self setAssociatedObject:numberFormat forKey:&numberChineseChar];
    }
    numberFormat.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSString *string = [numberFormat stringFromNumber:[NSNumber numberWithInteger:number]];
    return string;
}
@end
