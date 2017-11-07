//
//  UILabel+Creator.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "UILabel+Creator.h"
#import "UIColor+StringColor.h"
@implementation UILabel (Creator)
+ (UILabel *)labelWithText:(NSString *)text font:(CGFloat)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    label.textColor = [UIColor colorWithString:textColor];
    label.textAlignment = textAlignment;
    label.userInteractionEnabled = NO;
    return label;
}
@end
