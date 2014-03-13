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
        self.image = nil;
        self.image = image;
    }
    
    if ([self.highlightedImage isKindOfClass:[DObject class]]) {
        UIImage *highlightImage = self.highlightedImage;
        self.highlightedImage = nil;
        self.highlightedImage = highlightImage;
    }
    
    NSArray *animImages = self.animationImages;
    self.animationImages = nil;
    self.animationImages = animImages;
    
    NSArray *highlightedAnimImages = self.highlightedAnimationImages;
    self.highlightedAnimationImages = nil;
    self.highlightedAnimationImages = highlightedAnimImages;
}

@end
