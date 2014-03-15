//
//  DColor.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DColor.h"
#import "DSkin.h"

#define InheritanceClass UIColor

@interface DColor () {
    UIColor *_object;
}

@end

@implementation DColor
@synthesize object = _object;

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
    return [self instancesRespondToSelector:aSelector] || [InheritanceClass instancesRespondToSelector:aSelector];
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol
{
    return [self conformsToProtocol:protocol] || [InheritanceClass conformsToProtocol:protocol];
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector
{
    IMP imp = [self instanceMethodForSelector:aSelector];
    if (imp == NULL) {
        imp = [InheritanceClass instanceMethodForSelector:aSelector];
    }
    return imp;
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *method = [self instanceMethodSignatureForSelector:aSelector];
    if (method == NULL) {
        method = [InheritanceClass instanceMethodSignatureForSelector:aSelector];
    }
    return method;
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    return [self resolveClassMethod:sel] || [InheritanceClass resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return [super resolveInstanceMethod:sel] || [InheritanceClass resolveInstanceMethod:sel];
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
