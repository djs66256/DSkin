//
//  UITextView+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-14.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UITextView+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UITextView (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    UIColor *textColor = self.textColor;
    if ([textColor isKindOfClass:[DObject class]]) {
        self.textColor = [textColor copy];
    }
}

@end
