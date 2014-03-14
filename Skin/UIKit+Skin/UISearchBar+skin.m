//
//  UISearchBar+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UISearchBar+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UISearchBar (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(barTintColor)]) {
        UIColor *barColor = self.barTintColor;
        if ([barColor isKindOfClass:[DObject class]]) {
            self.barTintColor = [barColor copy];
        }
    }
}

@end
