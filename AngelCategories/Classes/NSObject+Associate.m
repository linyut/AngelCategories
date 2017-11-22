//
//  NSObject+Associate.m
//  ZhongRongJinFu
//
//  Created by Yosef Lin on 9/11/15.
//  Copyright (c) 2015 Yosef Lin. All rights reserved.
//

#import "NSObject+Associate.h"
#import <objc/runtime.h>

@implementation NSObject(Associate)

-(void)setAssociatedObject:(id)object forKey:(const void*)key
{
    objc_setAssociatedObject( self , key , object , OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(id)getAssociatedObjectForKey:(const void*)key
{
    return objc_getAssociatedObject( self , key );
}

@end
