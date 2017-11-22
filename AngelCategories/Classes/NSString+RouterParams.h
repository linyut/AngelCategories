//
//  NSString+RouterParams.h
//  Pods
//
//  Created by hey on 2016/11/21.
//
//

#import <Foundation/Foundation.h>

@interface NSString (RouterParams)

/**
 将字典转换成字符串

 @param infoDict 字典
 @return 字符串
 */
+ (NSString *)convertToJSONData:(id)infoDict;


/**
 讲字符串转化成字典

 @param jsonString 字符串
 @return 字典
 */
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
