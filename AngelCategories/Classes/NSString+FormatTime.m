//
//  NSString+FormatTime.m
//  test
//
//  Created by cxk@erongdu.com on 16/10/12.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import "NSString+FormatTime.h"
#import "NSObject+Associate.h"

static const char dateFormat;

@implementation NSString (FormatTime)

+ (NSString *)stringWithTimeInterval:(long long)second formatString:(NSString *)formatStr
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *dateFormatter = [self getAssociatedObjectForKey:&dateFormat];
    if(!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [self setAssociatedObject:dateFormatter forKey:&dateFormat];
    }
    [dateFormatter setDateFormat:formatStr];
    return [dateFormatter stringFromDate:date];
}
@end
