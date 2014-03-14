//
//  UIActivityIndicatorView+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UIActivityIndicatorView+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UIActivityIndicatorView (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(color)]) {
        UIColor *color = self.color;
        if ([color isKindOfClass:[DObject class]]) {
            self.color = [color copy];
        }
    }
}

@end
