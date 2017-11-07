//
//  UIColor+StringColor.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/27.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "macro.h"
@interface UIColor (StringColor)
#pragma mark 通过RGB16进制字符串获取颜色，默认透明度为1
+ (UIColor *)colorWithString:(NSString *)srting;
#pragma mark 16进制字符串获取颜色透明度添加参数
+ (UIColor *)colorWithString:(NSString *)string Alpha:(CGFloat)alpha;
@end
