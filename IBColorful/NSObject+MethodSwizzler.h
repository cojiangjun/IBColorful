//
//  NSObject+MethodSwizzler.h
//  testPlugin
//
//  Created by rcio on 16/2/17.
//  Copyright © 2016年 GF Securities. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(MethodSwizzler)
+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod;

@end
