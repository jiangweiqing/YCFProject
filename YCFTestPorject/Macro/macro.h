//
//  macro.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/30.
//  Copyright © 2017年 YCF. All rights reserved.
//

#ifndef macro_h
#define macro_h

#import "Category.h"

//环境切换
#define KAppStroe 0 //appStroe发布将其置为1
#define KDEBUG 1
#if KAppStroe
#define BaseURLString @""
#else
#define BaseURLString @""
#endif

// 屏幕的size
#define KScreenSize    [UIScreen mainScreen].bounds.size
#define KScreenHeight  ([[UIScreen mainScreen] bounds].size.height)
#define KScreenWidth   ([[UIScreen mainScreen] bounds].size.width)
// 获得版本信息
#define OSVersion [[UIDevice currentDevice].systemVersion floatValue]
#define IS_IOS7 (OSVersion >= 7.0)
#define IS_IOS8 (OSVersion >= 8.0)
#define IS_IOS9 (OSVersion >= 9.0)
#define IS_IOS10 (OSVersion >= 10.0)
#define IS_IOS11 (OSVersion >= 11.0)

//区分iphone屏幕大小
#define is_Screen4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define is_Screen47 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define is_Screen55 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 屏幕尺寸与iphone6 对比
#define KScaleToiPhone6 (KScreenWidth/320)


//字体大小适配
#define SizeScale (KScreenWidth > 375 ? 1.2 :1)
#define kSystemFont(value) [UIFont systemFontOfSize:value * SizeScale]
#define kboldSystemFont(value) [UIFont boldSystemFontOfSize:value * SizeScale]


#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define NULLSAFE_ENABLED 0
#else
#define DLog(...);
#define NULLSAFE_ENABLED 1
#endif

/**
 *  手机号正则匹配
 电信号段:133/153/180/181/189/177/199
 联通号段:130/131/132/155/156/185/186/145/176/166
 移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178/198
 虚拟运营商:170
 */
// 手机号正则匹配
static inline bool predicateIsMobilePhone(NSString * mobilePhone){
    NSString * validateContent = @"^1(3[0-9]|4[57]|5[0-35-9]|6[6]|9[89]|8[0-9]|7[06-8])\\d{8}$";
    NSPredicate *validateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", validateContent];
    if (mobilePhone.length == 11  && ![NSString stringIsNil:mobilePhone] && [validateTest evaluateWithObject:mobilePhone]) {
        return YES;
    }else
        return NO;
}


#endif /* macro_h */
