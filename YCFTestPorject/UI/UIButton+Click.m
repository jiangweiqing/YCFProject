//
//  UIButton+Click.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/30.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "UIButton+Click.h"
#import "UIColor+StringColor.h"

#define  clickTime  1.5
@implementation UIButton (Click)

+ (void)load{
    
}
+ (UIButton *)buttonWithImage:(NSString *)image{
    return ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        button;
    });
}
+ (UIButton *)buttonWithTitle:(NSString *)title font:(CGFloat)font titleColor:(NSString *)titleColor{
    UIButton *btn = [UIButton buttonWithType:   UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithString:titleColor] forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)buttonWithNormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    return btn;
}



@end
