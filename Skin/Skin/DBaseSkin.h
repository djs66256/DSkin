//
//  DBaseSkin.h
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSkinProtocol.h"

@interface DBaseSkin : NSObject <DSkinProtocol>

- (id)initWithFileName:(NSString *)fileName;

@end
