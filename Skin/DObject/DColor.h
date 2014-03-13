//
//  DColor.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DObject.h"

@interface DColor : DObject

@property (nonatomic, strong) UIColor *object;

+ (UIColor *)colorForKey:(NSString *)key;

@end
