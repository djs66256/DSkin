//
//  UIView+skin.m
//  TestDemo
//
//  Created by daniel on 14-3-11.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "UIView+skin.h"
#import <objc/runtime.h>
#import "DSkin.h"

static const char DCustomBackgroundColorKey;

@implementation UIView (skin)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeSelector:@selector(initWithFrame:) withSelector:@selector(initWithNotificationAndFrame:)];
        [self exchangeSelector:@selector(initWithCoder:) withSelector:@selector(initWithNotificationAndCoder:)];
        
        [self exchangeSelector:NSSelectorFromString(@"dealloc") withSelector:@selector(deallocWithNotification)];
        
        [self exchangeSelector:@selector(setBackgroundColor:) withSelector:@selector(setCustomBackgroundColor:)];
        [self exchangeSelector:@selector(backgroundColor) withSelector:@selector(customBackgroundColor)];
    });
}

+ (void)exchangeSelector:(SEL)oldSelector withSelector:(SEL)newSelector
{
    Method oldMethod = class_getInstanceMethod(self, oldSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
    
    method_exchangeImplementations(oldMethod, newMethod);
}

- (id)initWithNotificationAndFrame:(CGRect)frame
{
    self = [self initWithNotificationAndFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNeedDisplaySkin) name:DSkinNeedDisplayNotification object:nil];
    }
    return self;
}

- (id)initWithNotificationAndCoder:(NSCoder *)aDecoder
{
    self = [self initWithNotificationAndCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNeedDisplaySkin) name:DSkinNeedDisplayNotification object:nil];
    }
    return self;
}

- (void)setNeedDisplaySkin
{
    [self setNeedsDisplay];
    UIColor *bgColor = self.backgroundColor;
    if ([bgColor isKindOfClass:[DObject class]]) {
        self.backgroundColor = bgColor;
    }
}

- (void)setCustomBackgroundColor:(UIColor *)backgroundColor
{
    if ([backgroundColor isKindOfClass:[DObject class]]) {
        objc_setAssociatedObject(self, &DCustomBackgroundColorKey, backgroundColor, OBJC_ASSOCIATION_RETAIN);
    }
    else {
        objc_setAssociatedObject(self, &DCustomBackgroundColorKey, nil, OBJC_ASSOCIATION_RETAIN);
    }
    [self setCustomBackgroundColor:backgroundColor];
}

- (UIColor *)customBackgroundColor
{
    UIColor *backgroundColor = objc_getAssociatedObject(self, &DCustomBackgroundColorKey);
    if (backgroundColor) {
        return backgroundColor;
    }
    else {
        return [self customBackgroundColor];
    }
}

- (void)deallocWithNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self deallocWithNotification];
}

@end
