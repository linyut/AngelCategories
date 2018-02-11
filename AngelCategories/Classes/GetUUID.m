//
//  getUUID.m
//  BOC
//
//  Created by JLove on 16/12/22.
//  Copyright © 2016年 JLove. All rights reserved.
//

#import "GetUUID.h"
#import "KeyChainStore.h"
#define  KEY_USERNAME_PASSWORD @"com.boc.app.usernamepassword"
#define  KEY_USERNAME @"com.boc.app.username"
#define  KEY_PASSWORD @"com.boc.app.password"

@implementation GetUUID

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
        
    }
    return strUUID;
}
@end
