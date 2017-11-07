//
//  UIButton+Click.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/30.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Click)
+ (UIButton *)buttonWithBackgroundImage:(NSString *)imageName;
+ (UIButton *)buttonWithTitle:(NSString *)title font:(CGFloat)font titleColor:(NSString *)titleColor;
+ (UIButton *)buttonWithNormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage;
+ (UIButton *)buttonWithImage:(NSString *)image;
@end
