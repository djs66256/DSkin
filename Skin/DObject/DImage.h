//
//  DImage.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DObject.h"

@interface DImage : DObject

@property (nonatomic, strong) UIImage *object;
@property (nonatomic, strong) NSString *fileName;

+ (UIImage *)imageForKey:(NSString *)key;

@end
