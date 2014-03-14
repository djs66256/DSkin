//
//  DObject.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DObject.h"
#import "DSkin.h"

@implementation DObject
@dynamic object;

- (id)copy
{
    DObject *copyItem = [[[self class] alloc] init];
    copyItem.key = self.key;
    copyItem.object = self.object;
    return copyItem;
}

- (id)mutableCopy
{
    return [self copy];
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNeedReload) name:DSkinDidChangedSkinNotification object:nil];
        self.needReload = YES;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setNeedReload
{
    self.needReload = YES;
}

- (BOOL)isKindOfClass:(Class)aClass;
{
    return [super isKindOfClass:aClass] || [self.object isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass
{
    return [super isKindOfClass:aClass] || [self.object isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    return [super conformsToProtocol:aProtocol] || [self.object conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [super respondsToSelector:aSelector] || [self.object respondsToSelector:aSelector];
}


- (IMP)methodForSelector:(SEL)aSelector
{
    IMP imp = [super methodForSelector:aSelector];
    if (imp == NULL) {
        imp = [self.object methodForSelector:aSelector];
    }
    return imp;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    [super doesNotRecognizeSelector:aSelector];
    [self.object doesNotRecognizeSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.object respondsToSelector:aSelector]) {
        return self.object;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    [anInvocation invokeWithTarget:self.object];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *method = [super methodSignatureForSelector:aSelector];
    if (method == NULL) {
        method = [self.object methodSignatureForSelector:aSelector];
    }
    return method;
}

@end
