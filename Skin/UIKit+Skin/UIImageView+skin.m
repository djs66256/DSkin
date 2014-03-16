//
//  UIImageView+skin.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "UIImageView+skin.h"
#import "UIView+skin.h"
#import "DObject.h"

@implementation UIImageView (skin)

- (void)setNeedDisplaySkin
{
    [super setNeedDisplaySkin];
    
    if ([self.image isKindOfClass:[DObject class]]) {
        UIImage *image = self.image;
        self.image = [image copy];
    }
    
    if ([self.highlightedImage isKindOfClass:[DObject class]]) {
        UIImage *highlightImage = self.highlightedImage;
        self.highlightedImage = [highlightImage copy];
    }
    
    NSArray *animImages = self.animationImages;
    if (animImages) {
        self.animationImages = nil;
        self.animationImages = animImages;
    }
    
    NSArray *highlightedAnimImages = self.highlightedAnimationImages;
    if (highlightedAnimImages) {
        self.highlightedAnimationImages = nil;
        self.highlightedAnimationImages = highlightedAnimImages;
    }
}

@end
