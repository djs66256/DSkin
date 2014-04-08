//
//  DColor.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DColor.h"
#import "DSkin.h"

@interface DColor () {
    UIColor *_object;
}

@end

@implementation DColor
@synthesize object = _object;

+ (Class)objectClass
{
    return [UIColor class];
}

#pragma mark -
- (UIColor *)object
{
    if (self.needReload) {
        _object = [[DSkin defaultSkin] colorForKey:self.key];
        self.needReload = NO;
    }
    if (_object == nil) {
        _object = [UIColor clearColor];
    }
    return _object;
}

+ (UIColor *)colorForKey:(NSString *)key
{
    DColor *color = [[DColor alloc] init];
    color.key = key;
    return (UIColor *)color;
}

@end
