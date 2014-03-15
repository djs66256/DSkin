//
//  DImage.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DObject.h"

@interface DImage : DObject {
    UIImage *_object;
}

@property (nonatomic, strong) UIImage *object;

+ (UIImage *)imageForKey:(NSString *)key;

@end
