//
//  DStretchImage.m
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "DStretchImage.h"

@implementation DStretchImage

- (UIImage *)object
{
    if (self.needReload) {
        _object = [[super object] stretchableImageWithLeftCapWidth:_leftCapinset topCapHeight:_topCapinset];
    }
    return _object;
}

@end
