//
//  UISwitch+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-14.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UISwitch+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UISwitch (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(onTintColor)]) {
        UIColor *onTint = self.onTintColor;
        if ([onTint isKindOfClass:[DObject class]]) {
            self.onTintColor = [onTint copy];
        }
    }
    
    if ([self respondsToSelector:@selector(tintColor)]) {
        UIColor *tint = self.tintColor;
        if ([tint isKindOfClass:[DObject class]]) {
            self.tintColor = [tint copy];
        }
    }
    
    if ([self respondsToSelector:@selector(thumbTintColor)]) {
        UIColor *thumbTint = self.thumbTintColor;
        if ([thumbTint isKindOfClass:[DObject class]]) {
            self.thumbTintColor = thumbTint;
        }
    }
}

@end
