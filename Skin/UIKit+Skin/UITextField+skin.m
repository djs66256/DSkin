//
//  UITextField+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-14.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UITextField+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UITextField (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    UIColor *textColor = self.textColor;
    if ([textColor isKindOfClass:[DObject class]]) {
        self.textColor = [textColor copy];
    }
    
    UIImage *background = self.background;
    if ([background isKindOfClass:[DObject class]]) {
        self.background = [background copy];
    }
    
    UIImage *disabledBackground = self.disabledBackground;
    if ([disabledBackground isKindOfClass:[DObject class]]) {
        self.disabledBackground = [disabledBackground copy];
    }
}

@end
