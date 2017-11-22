//
//  NSString+FilePath.h
//  Crowdfunding
//
//  Created by aaaa on 16/7/5.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FilePath)

/**
 *  是否存在文件
 *
 *  @param fileName  文件名
 *  @param uuid 项目id
 *
 *  @return 存在返回yes
 */
+ (BOOL)isExistProtocolFileName:(NSString *)fileName uuid:(NSString *)uuid;

/**
 *  返回文件路径
 *
 *  @param fileName  文件名
 *  @param uuid 项目id
 *
 *  @return 返回文件路径
 */
+ (NSString *)protocolFileName:(NSString *)fileName uuid:(NSString *)uuid;

/**
 *  是否存在文件
 *
 *  @param fileName  文件名
 *  @param floderName 文件夹名
 *
 *  @return 存在返回yes
 */
+ (BOOL)isExistFileName:(NSString *)fileName floderName:(NSString *)floderName;

/**
 *  返回文件路径
 *
 *  @param fileName  文件名
 *  @param floderName 文件夹名
 *
 *  @return 返回文件路径
 */
+ (NSString *)fileWithFileName:(NSString *)fileName floderName:(NSString *)floderName;;

@end
