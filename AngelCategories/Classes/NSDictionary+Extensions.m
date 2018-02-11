//
//  NSDictionary+Extensions.m
//  FrameProject
//
//  Created by mark on 2017/8/10.
//  Copyright © 2017年 BOC. All rights reserved.
//

#import "NSDictionary+Extensions.h"

@implementation NSDictionary(Extensions)

- (NSString *)toJsonString {
    NSString *jsonString = nil;
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        jsonString =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (error) {
            NSLog(@"Error:%@" , error);
        }
    }
    return jsonString;
}


@end
