//
//  DSkinProtocol.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSkinProtocol <NSObject>

- (NSString *)imageNameForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (UIColor *)colorForKey:(NSString *)key;

@end
