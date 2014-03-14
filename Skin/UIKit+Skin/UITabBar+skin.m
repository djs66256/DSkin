//
//  UITabBar+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UITabBar+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UITabBar (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(barTintColor)]) {
        UIColor *barColor = self.barTintColor;
        if ([barColor isKindOfClass:[DObject class]]) {
            self.barTintColor = [barColor copy];
        }
    }
    
    if ([self respondsToSelector:@selector(selectedImageTintColor)]) {
        UIColor *selectedImageTintColor = self.selectedImageTintColor;
        if ([selectedImageTintColor isKindOfClass:[DObject class]]) {
            self.selectedImageTintColor = [selectedImageTintColor copy];
        }
    }
}

@end
