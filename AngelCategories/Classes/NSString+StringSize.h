//
//  NSString+StringSize.h
//  Pods
//
//  Created by cxk@erongdu.com on 16/10/27.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringSize)

- (CGSize)sizeWithFont:(UIFont*)font maxSize:(CGSize)size;

+ (CGSize)sizeWithString:(NSString*)str font:(UIFont*)font maxSize:(CGSize)size;

@end
