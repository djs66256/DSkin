//
//  UIProgressView+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UIProgressView+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UIProgressView (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(progressTintColor)]) {
        UIColor *progressColor = self.progressTintColor;
        if ([progressColor isKindOfClass:[DObject class]]) {
            self.progressTintColor = [progressColor copy];
        }
    }
    
    if ([self respondsToSelector:@selector(trackTintColor)]) {
        UIColor *trackTintColor = self.trackTintColor;
        if ([trackTintColor isKindOfClass:[DObject class]]) {
            self.trackTintColor = [trackTintColor copy];
        }
    }
}

@end
