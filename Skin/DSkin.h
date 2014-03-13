//
//  DSkin.h
//  TestDemo
//
//  Created by daniel on 14-3-11.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSkinProtocol.h"
#import "DImage.h"
#import "DColor.h"

extern NSString * const DSkinDidChangedSkinNotification;
extern NSString * const DSkinNeedDisplayNotification;

@interface DSkin : NSObject <DSkinProtocol>

+ (instancetype)defaultSkin;

- (void)setSkin:(id<DSkinProtocol>)newSkin;
- (void)setNeedDisplayAllView;

@end
