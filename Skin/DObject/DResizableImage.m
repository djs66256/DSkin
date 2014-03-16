//
//  DResizableImage.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "DResizableImage.h"

@implementation DResizableImage

- (id)initWithImage:(DImage *)image
{
    self = [super init];
    if (self) {
        self.key = image.key;
        _resizingMode = UIImageResizingModeStretch;
        _capInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (id)copy
{
    DResizableImage *image = [super copy];
    image.resizingMode = _resizingMode;
    image.capInsets = _capInsets;
    return image;
}

- (id)mutableCopy
{
    return [self copy];
}

- (UIImage *)object
{
    if (self.needReload) {
        _object = [[super object] resizableImageWithCapInsets:_capInsets resizingMode:_resizingMode];
    }
    return _object;
}

@end
