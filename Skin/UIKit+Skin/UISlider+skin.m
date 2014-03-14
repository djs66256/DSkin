//
//  UISlider+skin.m
//  DSkinDemo
//
//  Created by daniel on 14-3-14.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "UISlider+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UISlider (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self respondsToSelector:@selector(minimumTrackTintColor)]) {
        UIColor *minColor = self.minimumTrackTintColor;
        if ([minColor isKindOfClass:[DObject class]]) {
            self.minimumTrackTintColor = [minColor copy];
        }
    }
    
    if ([self respondsToSelector:@selector(maximumTrackTintColor)]) {
        UIColor *maxColor = self.maximumTrackTintColor;
        if ([maxColor isKindOfClass:[DObject class]]) {
            self.maximumTrackTintColor = [maxColor copy];
        }
    }
    
    if ([self respondsToSelector:@selector(thumbTintColor)]) {
        UIColor *thumbColor = self.thumbTintColor;
        if ([thumbColor isKindOfClass:[thumbColor class]]) {
            self.thumbTintColor = [thumbColor copy];
        }
    }
}

@end
