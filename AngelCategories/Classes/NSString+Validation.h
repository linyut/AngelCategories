//
//  NSString+Validation.h
//  LoginViewDemo
//
//  Created by erongdu_cxk on 16/3/14.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  验证类型枚举
 */
typedef NS_ENUM(NSInteger, ValidationType) {
    /**
     *  手机号码
     */
    ValidationTypePhone = 0,
    /**
     *  邮箱
     */
    ValidationTypeMail = 1,
    /**
     *  身份证号
     */
    ValidationTypeIDCard = 2,
    /**
     *  ip地址
     */
    ValidationTypeIP = 3,
    /**
     *  月
     */
    ValidationTypeMonth = 4,
    /**
     *  天
     */
    ValidationTypeDay = 5,
    /**
     *  密码
     */
    ValidationTypePassword = 6,
    /**
     *  用户名
     */
    ValidationTypeUserName = 7,
    /**
     *  银行卡号
     */
    ValidationTypeBankCard = 8,
    /**
     *  手机验证码
     */
    ValidationTypePhoneCode = 9,
    /**
     *  中文
     */
    ValidationTypeChinese = 10,
    /**
     *  验证字母或者数字
     */
    ValidationTypeLetterOrNumber = 11,
    /**
     *  URL
     */
    ValidationTypeURL = 12
};
@interface NSString (Validation)
/**
 *  根据验证类型验证字符串
 *
 *  @param validationType 验证类型
 *
 *  @return 是否符合表达式
 */
- (BOOL)validationType:(ValidationType)validationType;
/**
 *  自定义正则表达式验证字符串
 *
 *  @param expression 正则表达式
 *
 *  @return YES说明字符串符合正则表达式
 */
- (BOOL)validationExpression:(NSString *)expression;
/**
 *  是否是整数
 *
 *
 *  @return 返回YES则是整数
 */
- (BOOL)isPrueInt;
/**
 *  是否是浮点数
 *
 *
 *  @return 返回YES则是浮点数
 */
- (BOOL)isPrueFloat;
/**
 *  是否是整数或者是浮点数
 *
 *
 *  @return 返回YES则是整数或者浮点数
 */
- (BOOL)isPrueIntOrFloat;
@end
