//
//  UILabel+Creator.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Creator)

+ (UILabel *)labelWithText:(NSString *)text font:(CGFloat)font textColor:(NSString *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
