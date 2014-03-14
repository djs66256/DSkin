//
//  UILabel+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-14.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UILabel+skin.h"
#import "DObject.h"
#import "UIView+skin.h"

@implementation UILabel (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    UIColor *textColor = self.textColor;
    if ([textColor isKindOfClass:[DObject class]]) {
        self.textColor = [textColor copy];
    }
    
    UIColor *shadowColor = self.shadowColor;
    if ([shadowColor isKindOfClass:[DObject class]]) {
        self.shadowColor = shadowColor;
    }
    
    UIColor *highlightedTextColor = self.highlightedTextColor;
    if ([highlightedTextColor isKindOfClass:[DObject class]]) {
        self.highlightedTextColor = highlightedTextColor;
    }
    
    
}

@end
