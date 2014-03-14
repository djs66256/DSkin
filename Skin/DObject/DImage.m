//
//  DImage.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DImage.h"
#import "DSkin.h"

#define InheritanceClass UIImage

@interface DImage () {
    UIImage *_object;
}

@end

@implementation DImage
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

#pragma mark - memory warning

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
