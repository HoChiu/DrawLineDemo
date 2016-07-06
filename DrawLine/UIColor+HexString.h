//
//  UIColor+HexString.h
//  ToolFramework
//
//  Created by  YANGReal on 13-1-28.
//  Copyright (c) 2013年 YANGReal. All rights reserved.
//
// UIColor扩展类，使用16进制进行颜色的赋值

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
/**
 *  修改UIColor的透明度
 *
 *  @param originColor 原始颜色
 *  @param alpha       透明度
 *
 *  @return 新颜色
 */
+ (UIColor *)colorWithUIColor:(UIColor *)originColor alpha:(CGFloat)alpha;


- (UIColor *)reverseColor;

@end
