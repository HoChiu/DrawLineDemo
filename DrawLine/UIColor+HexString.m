//
//  UIColor+HexString.m
//  ToolFramework
//
//  Created by  YANGReal on 13-1-28.
//  Copyright (c) 2013年 YANGReal. All rights reserved.
//

#import "UIColor+HexString.h"

#define DEFAULT_VOID_COLOR [UIColor clearColor]

@implementation UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    return [self colorWithHexString:stringToConvert alpha:1.0];
}

+ (UIColor *)colorWithUIColor:(UIColor *)originColor alpha:(CGFloat)alpha
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    BOOL isOK = [originColor getRed:&r green:&g blue:&b alpha:&a];
    if (isOK) {
        return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    }
    
    return [UIColor clearColor];
}

- (UIColor *)reverseColor
{
    CGFloat r = 0, g = 0, b = 0, a = 0;
    BOOL isOK = [self getRed:&r green:&g blue:&b alpha:&a];
    if (isOK)
    {
        return [UIColor colorWithRed:1-r green:1-g blue:1-b alpha:1];
    }
    return [UIColor clearColor];
}


@end
