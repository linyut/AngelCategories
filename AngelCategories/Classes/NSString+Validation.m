//
//  NSString+Validation.m
//  LoginViewDemo
//
//  Created by erongdu_cxk on 16/3/14.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import "NSString+Validation.h"

//手机号码验证13开头
//#define kValidationPhone @"^((1[358][0-9])|(14[57])|(17[0-9]))\\d{8}$"
#define kValidationPhone @"^((1[3456789][0-9]))\\d{8}$"
//邮箱验证
#define kValidationMail @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
//身份证验证
#define kValidationIDCard @"^\\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18}?$"
//IP地址验证
#define kValidationIP @"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))"
//日期中的月验证(01~09和1~12)
#define kValidationMonth @"^(0?[1-9]|1[0-2])$"
//日期中的日验证(01~09和1~31)
#define kValidationDay @"^((0?[1-9])|((1|2)[0-9])|30|31)$"
//密码验证
#define kValidationPassword @"^(?![^a-zA-Z]+$)(?!\\D+$).{8,16}$"
//用户名验证（包含数字加字母）
#define kValidationUserName @"^(?![0-9]+$)[0-9A-Za-z]{4,16}$"
//银行卡简单验证 15位和19位
#define kValidationBankCard @"^\\d{15,19}$"
//验证码纯数字6位
#define kValidationPhoneCode @"^\\d{6}"
//中文验证
#define kValidationChinese @"^[\u4e00-\u9fa5]{2,10}$"
//验证字母和数字
#define kValidationLetterOrNumber @"^[a-zA-Z0-9]{0,}$"
//
#define kValidationURL @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
//@"((http|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?"

@implementation NSString (Validation)

- (BOOL)validationType:(ValidationType)validationType
{
    return [self validationExpression:[self expressionByValidationType:validationType]];
}

- (BOOL)validationExpression:(NSString *)expression
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",expression];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPrueInt
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    int intVal;
    return [scanner scanInt:&intVal] && [scanner isAtEnd];
}

- (BOOL)isPrueFloat
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    float floatVal;
    return [scanner scanFloat:&floatVal] && [scanner isAtEnd];
}

- (BOOL)isPrueIntOrFloat
{
    return [self isPrueFloat]||[self isPrueInt];
}

/**
 *  根据类型返回对应的正则表达式
 *
 *  @param type 待验证的正则表达式
 *
 *  @return 正则表达式
 */
- (NSString *)expressionByValidationType:(ValidationType)type
{
    NSString *str;
    switch (type) {
        case ValidationTypePhone:
            str = kValidationPhone;
            break;
        case ValidationTypeMail:
            str = kValidationMail;
            break;
        case ValidationTypeIDCard:
            str = kValidationIDCard;
            break;
        case ValidationTypeIP:
            str = kValidationIP;
            break;
        case ValidationTypeMonth:
            str = kValidationMonth;
            break;
        case ValidationTypeDay:
            str = kValidationDay;
            break;
        case ValidationTypePassword:
            str = kValidationPassword;
            break;
        case ValidationTypeUserName:
            str = kValidationUserName;
            break;
        case ValidationTypeBankCard:
            str = kValidationBankCard;
            break;
        case ValidationTypePhoneCode:
            str = kValidationPhoneCode;
            break;
        case ValidationTypeChinese:
            str = kValidationChinese;
            break;
        case ValidationTypeLetterOrNumber:
            str = kValidationLetterOrNumber;
            break;
        case ValidationTypeURL:
            str = kValidationURL;
            break;
        default:
            str = @"";
            break;
    }
    return str;
}
@end
