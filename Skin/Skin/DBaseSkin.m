//
//  DBaseSkin.m
//  TestDemo
//
//  Created by daniel on 14-3-12.
//  Copyright (c) 2014年 段家顺. All rights reserved.
//

#import "DBaseSkin.h"
#import "DObject.h"
#import "DColor.h"
#import "DImage.h"

@interface DBaseSkin ()

@property (nonatomic, strong) NSMutableDictionary *skinDict;

@end

@implementation DBaseSkin

- (id)initWithFileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        _skinDict = [[NSMutableDictionary alloc] init];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
        if (dic) {
            [self parse:dic];
        }
        else {
            NSLog(@"skin:%@ not exist", fileName);
        }
    }
    return self;
}

- (void)parse:(NSDictionary *)dic
{
    // (123,123,123)
    NSDictionary *colorDict = dic[@"color"];
    NSMutableDictionary *colorSkinDict = [NSMutableDictionary dictionary];
    [colorDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        NSString *rgba = [obj stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"() "]];
        NSArray *rgbaArr = [rgba componentsSeparatedByString:@","];
        if (rgbaArr.count == 4) {
            float r = (CGFloat)[rgbaArr[0] floatValue]/255;
            float g = (CGFloat)[rgbaArr[1] floatValue]/255;
            float b = (CGFloat)[rgbaArr[2] floatValue]/255;
            float a = (CGFloat)[rgbaArr[3] floatValue]/255;
            colorSkinDict[key] = [UIColor colorWithRed:r green:g blue:b alpha:a];
        }
        else {
            NSLog(@"[skin] %@ color parse error", key);
        }
    }];
    _skinDict[@"color"] = colorSkinDict;
    
    NSDictionary *imageDict = dic[@"image"];
    NSMutableDictionary *imageSkinDict = [NSMutableDictionary dictionary];
    [imageDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        imageSkinDict[key] = obj;
    }];
    _skinDict[@"image"] = imageSkinDict;
}

- (NSString *)imageNameForKey:(NSString *)key
{
    return _skinDict[@"image"][key];
}

- (UIColor *)colorForKey:(NSString *)key
{
    return _skinDict[@"color"][key];
}

@end
