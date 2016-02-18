//
//  IBColorful.m
//  IBColorful
//
//  Created by rcio on 16/2/18.
//  Copyright © 2016年 GF Securities. All rights reserved.
//

#import "IBColorful.h"
#import "IBUIView.h"

@interface IBColorful()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation IBColorful

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    [NSView IBUIViewSwizzle];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
