//
//  NSString+FilePath.m
//  Crowdfunding
//
//  Created by aaaa on 16/7/5.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#import "NSString+FilePath.h"

@implementation NSString (FilePath)

+(BOOL)isExistProtocolFileName:(NSString *)fileName uuid:(NSString *)uuid
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self createProtocolPath:fileName uuid:uuid]]) {
        return NO;
    }
    return YES;
}

+ (NSString *)protocolFileName:(NSString *)fileName uuid:(NSString *)uuid
{
    return [self createProtocolPath:fileName uuid:uuid];
}

+ (NSString *)createProtocolPath:(NSString *)fileName uuid:(NSString *)uuid
{
    NSString *realFilePath = [NSString stringWithFormat:@"%@/Protocol/%@/",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0],uuid];
    return [realFilePath stringByAppendingString:fileName];
}

+(BOOL)isExistFileName:(NSString *)fileName floderName:(NSString *)floderName
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self createFileWithfileWithFileName:fileName floderName:floderName]]) {
        return NO;
    }
    return YES;
}

+ (NSString *)fileWithFileName:(NSString *)fileName floderName:(NSString *)floderName
{
    return [self createFileWithfileWithFileName:fileName floderName:floderName];
}

+ (NSString *)createFileWithfileWithFileName:(NSString *)fileName floderName:(NSString *)floderName
{
    NSString *realFilePath = [NSString stringWithFormat:@"%@/%@/",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0],floderName];
    return [realFilePath stringByAppendingString:fileName];
}

@end
