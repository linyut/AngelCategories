//
//  NSString+StringSize.m
//  Pods
//
//  Created by cxk@erongdu.com on 16/10/27.
//
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)

- (CGSize)sizeWithFont:(UIFont*)font maxSize:(CGSize)size
{
    //特殊的格式要求都写在属性字典中
    NSDictionary*attrs =@{NSFontAttributeName:font};
    //返回一个矩形，大小等于文本绘制完占据的宽和高。
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)sizeWithString:(NSString*)str font:(UIFont*)font maxSize:(CGSize)size{
    NSDictionary*attrs =@{NSFontAttributeName:font};
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs  context:nil].size;
}
@end
