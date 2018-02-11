//
//  KeyChainStore.h
//  wocao
//
//  Created by JLove on 16/12/22.
//  Copyright © 2016年 JLove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;


@end
