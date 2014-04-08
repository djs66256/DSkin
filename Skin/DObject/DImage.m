//
//  DImage.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DImage.h"
#import "DSkin.h"
#import "DResizableImage.h"
#import "DStretchImage.h"

#define InheritanceClass UIImage

@interface DImage () {
}

@end

@implementation DImage
@synthesize object = _object;

+ (Class)objectClass
{
    return [UIImage class];
}

#pragma mark - override

- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets NS_AVAILABLE_IOS(5_0) // create a resizable version of this image. the interior is tiled when drawn.
{
    return [self resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeTile];
}

- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode NS_AVAILABLE_IOS(6_0)
{
    DResizableImage *image = [[DResizableImage alloc] init];
    image.key = self.key;
    image.resizingMode = resizingMode;
    image.capInsets = capInsets;
    return (UIImage *)image;
}

- (UIImage *)imageWithAlignmentRectInsets:(UIEdgeInsets)alignmentInsets NS_AVAILABLE_IOS(6_0)
{
    DImage *image = [[DImage alloc] init];
    image.key = self.key;
    image.object = [self.object imageWithAlignmentRectInsets:alignmentInsets];
    return (UIImage *)image;
}

// Create a version of this image with the specified rendering mode. By default, images have a rendering mode of UIImageRenderingModeAutomatic.
- (UIImage *)imageWithRenderingMode:(UIImageRenderingMode)renderingMode NS_AVAILABLE_IOS(7_0)
{
    DImage *image = [[DImage alloc] init];
    image.key = self.key;
    image.object = [self.object imageWithRenderingMode:renderingMode];
    return (UIImage *)image;
}

- (UIImage *)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
{
    DStretchImage *image = [[DStretchImage alloc] init];
    image.leftCapinset = leftCapWidth;
    image.topCapinset = topCapHeight;
    image.key = self.key;
    return (UIImage *)image;
}

#pragma mark -

- (UIImage *)object
{
    if (self.needReload) {
        self.needReload = NO;
        _object = [[DSkin defaultSkin] imageForKey:self.key];
    }
    if (_object == nil) {
        _object = [[UIImage alloc] init];
    }
    
    return _object;
}

+ (UIImage *)imageForKey:(NSString *)key
{
    DImage *image = [[DImage alloc] init];
    image.key = key;
    return (UIImage *)image;
}

@end
