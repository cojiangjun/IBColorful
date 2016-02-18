//
//  NSObject_Extension.m
//  IBColorful
//
//  Created by rcio on 16/2/18.
//  Copyright © 2016年 GF Securities. All rights reserved.
//


#import "NSObject_Extension.h"
#import "IBColorful.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[IBColorful alloc] initWithBundle:plugin];
        });
    }
}
@end
