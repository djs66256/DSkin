//
//  DSkin.m
//  TestDemo
//
//  Created by daniel on 14-3-11.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DSkin.h"

NSString * const DSkinDidChangedSkinNotification = @"DSkinDidChangedSkinNotification";
NSString * const DSkinNeedDisplayNotification = @"DSkinNeedDisplayNotification";

@interface DSkin ()

@property (nonatomic, strong) id<DSkinProtocol> skinImp;

@end

@implementation DSkin

+ (instancetype)defaultSkin
{
    static DSkin *g_skin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_skin = [[DSkin alloc] init];
    });
    return g_skin;
}

- (NSString *)imageNameForKey:(NSString *)key
{
    return [_skinImp imageNameForKey:key];
}

- (UIColor *)colorForKey:(NSString *)key
{
    return [_skinImp colorForKey:key];
}

- (void)setSkin:(id<DSkinProtocol>)newSkin
{
    _skinImp = newSkin;
    [[NSNotificationCenter defaultCenter] postNotificationName:DSkinDidChangedSkinNotification object:nil];
}

- (void)setNeedDisplayAllView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:DSkinNeedDisplayNotification object:nil];
}

@end
