//
//  DObject.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

// Multiple Inheritance Class

#import <UIKit/UIKit.h>

@interface DObject : NSObject

@property (nonatomic, strong) NSObject *object;
@property (nonatomic, strong) NSString *key;
@property (nonatomic) BOOL needReload;

@end
