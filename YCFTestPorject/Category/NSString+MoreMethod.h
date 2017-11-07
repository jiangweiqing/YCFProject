//
//  NSString+MoreMethod.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MoreMethod)

#pragma mark 获取手机型号
+ (NSString *)getPhonePlatform;
#pragma mark  获取版本号
+ (NSString *)getAppVersionName;
#pragma mark  获取手机唯一标示
+ (NSString *)getPhoneUniqueIdentification;
+ (NSString *)base64SecString:(NSString *)str;
+ (NSString *)textFormBase64String:(NSString*)baseStr;
+ (NSString *)getMD5FormingString:(NSString *)inputString;
+ (NSString *)getUUID;
+ (NSString *)getOneDateFormTime:(NSTimeInterval )time byFormat:(NSString *)format;
+ (NSString *)mobileInfoValue;
+ (BOOL) stringIsNil:(NSString *)str;













@end
