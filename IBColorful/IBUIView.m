//
//  IBUIView.m
//  testPlugin
//
//  Created by rcio on 16/2/17.
//  Copyright © 2016年 GF Securities. All rights reserved.
//

#import "IBUIView.h"
#import "NSObject+MethodSwizzler.h"

static float colorDisk[][3] = {
    {1, 0, 0},
    {1, 0.141176, 0},
    {1, 0.301961, 0},
    {1, 0.647059, 0},
    {1, 0.74902, 0},
    {1, 0.843137, 0},
    {1, 1, 0},
    {0.8, 1, 0},
    {0.4, 1, 0},
    {0, 1, 0},
    {0, 1, 1},
    {0, 0.498039, 1},
    {0, 0, 1},
    {0.498039, 1, 0.831373},
    {0.878431, 1, 1},
    {0.941176, 0.972549, 0.960784},
    {0, 0.498039, 1},
    {0.392157, 0.584314, 0.929412},
    {0, 0.2, 0.6},
    {0.254902, 0.411765, 0.882353},
    {0, 0.2, 0.4},
    {0.164706, 0.321569, 0.745098},
    {0, 0.278431, 0.670588},
    {0.117647, 0.564706, 1},
    {0, 0.184314, 0.654902},
    {0, 0, 0.501961},
    {0.368627, 0.52549, 0.756863},
    {0.8, 0.8, 1},
    {0.0313725, 0.145098, 0.403922},
    {0.545098, 0, 1},
    {0.890196, 0.14902, 0.211765},
    {1, 0, 1}
};

@implementation NSView (RadomColor)

+ (void)IBUIViewSwizzle {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSClassFromString(@"IBUIView") swizzleWithOriginalSelector:@selector(drawRect:) swizzledSelector:@selector(drawRect_colorful:) isClassMethod:NO];

    });
}

- (void)drawRect_colorful:(CGRect)rect {
    [[self randomColor] setFill];
    NSRectFill(rect);
    [self drawRect_colorful:rect];
}

- (NSColor *)randomColor {
    int count = sizeof(colorDisk) / sizeof(float) / 3;
    UInt32 hash = ((UInt32)self >> 3) * 2654435761;
    UInt32 index = hash % count;
    float *rgb = colorDisk[index];
    
    return [NSColor colorWithRed:rgb[0]
                           green:rgb[1]
                            blue:rgb[2]
                           alpha:1];
}
@end
