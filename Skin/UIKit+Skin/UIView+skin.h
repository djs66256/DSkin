//
//  UIView+skin.h
//  TestDemo
//
//  Created by daniel on 14-3-11.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (skin)

+ (void)exchangeSelector:(SEL)oldSelector withSelector:(SEL)newSelector;

- (void)setNeedDisplaySkin;

@end
