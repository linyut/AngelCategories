//
//  NSObject+Associate.h
//  ZhongRongJinFu
//
//  Created by Yosef Lin on 9/11/15.
//  Copyright (c) 2015 Yosef Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Associate)

-(void)setAssociatedObject:(id)object forKey:(const void*)key;
-(id)getAssociatedObjectForKey:(const void*)key;

@end
