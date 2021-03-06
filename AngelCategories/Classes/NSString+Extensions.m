//
//  NSString+Extensions.m
//  boc_ios
//
//  Created by Mark on 9/30/16.
//  Copyright © 2016 BOC. All rights reserved.
//

#import "NSString+Extensions.h"
#import <UIKit/UIKit.h>

@implementation NSString (Extensions)

- (CGFloat)heightForWidth:(CGFloat)width usingFont:(UIFont *)font
{
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [self boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:context];
    return r.size.height;
}

- (BOOL)isBlank {
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isChinese {
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (CGRect)boundingRectWithSize:(CGSize)size andFont:(UIFont *)font {
    return [self boundingRectWithSize:size andFont:font lineSpacing:0];
}

- (CGRect)boundingRectWithSize:(CGSize)size andFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    return [self boundingRectWithSize:size
                              options:\
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}
                              context:nil];
}

- (CGRect)boundingRectWithSize:(CGSize)size andFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing showLine:(NSInteger)line {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    CGFloat lineHeight = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                            options:\
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                         attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}
                                            context:nil].size.height;
    
    CGRect trueRect = [self boundingRectWithSize:size
                                         options:\
                       NSStringDrawingTruncatesLastVisibleLine |
                       NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}
                                         context:nil];
    
    NSInteger numberOfLine = 0;
    CGFloat trueNumberOfLine = trueRect.size.height / lineHeight;
    if (trueNumberOfLine > line) {
        numberOfLine = line;
    } else {
        numberOfLine = floor(trueNumberOfLine);
        if (numberOfLine == 0) {
            numberOfLine = 1;
        }
    }
    
    return CGRectMake(trueRect.origin.x, trueRect.origin.y, trueRect.size.width, numberOfLine * lineHeight);
}

- (CGSize)boundingSizeWithFont:(UIFont *)font constraintSize:(CGSize)size showLine:(NSInteger)line {
    NSString *seedString = @"国";
    CGFloat lineHeight = [seedString boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                  andFont:font].size.height;
    CGSize trueSize = [self boundingRectWithSize:size andFont:font].size;
    NSInteger numberOfLine = 0;
    CGFloat trueNumberOfLine = trueSize.height / lineHeight;
    if (trueNumberOfLine > line) {
        numberOfLine = line;
    } else {
        numberOfLine = floor(trueNumberOfLine);
        if (numberOfLine == 0) {
            numberOfLine = 1;
        }
    }
    return CGSizeMake(trueSize.width, numberOfLine * lineHeight);
}

- (NSString *)encode {
    CFStringRef strRef = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (CFStringRef)self,
                                                                 NULL,
                                                                 NULL,
                                                                 kCFStringEncodingUTF8);
    return (NSString *)CFBridgingRelease(strRef);
}

- (NSString *)decode {
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString *)removeSpaceAndNewline:(NSString *)str {
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}

- (NSString *)stringByTrimmingCharactersWithCustomSet;{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:set];
    return trimmedString;
}

- (NSDictionary *)toDictionary {
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
}

- (NSString*)getDatePrefix16 {
    if (self.length > 16) {
        return [self substringToIndex:16];
    }
    
    return self;
}

@end
