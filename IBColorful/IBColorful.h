//
//  IBColorful.h
//  IBColorful
//
//  Created by rcio on 16/2/18.
//  Copyright © 2016年 GF Securities. All rights reserved.
//

#import <AppKit/AppKit.h>

@class IBColorful;

static IBColorful *sharedPlugin;

@interface IBColorful : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end