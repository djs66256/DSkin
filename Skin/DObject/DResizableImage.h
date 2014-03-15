//
//  DResizableImage.h
//  DSkinDemo
//
//  Created by daniel on 14-3-15.
//  Copyright (c) 2014年 daniel. All rights reserved.
//

#import "DImage.h"

@interface DResizableImage : DImage

@property (nonatomic) UIEdgeInsets capInsets;
@property (nonatomic) UIImageResizingMode resizingMode;

@end
