//
//  NSString+MoreMethod.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "NSString+MoreMethod.h"
#import <sys/utsname.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import <CommonCrypto/CommonDigest.h>
#define CFBundleShortVersionString @"CFBundleShortVersionString"
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghij1klmnopqrstuvwxyz0123456789+/";

@implementation NSString (MoreMethod)

+ (NSString *)getPhonePlatform{
    return @"";
}
+ (NSString *)getAppVersionName{
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    return [dict valueForKey:CFBundleShortVersionString];
}
+ (NSString *)getPhoneUniqueIdentification{
    return @"";
}
+ (NSString *)base64SecString:(NSString *)str{
    NSData *baseData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [baseData base64EncodedStringWithOptions:0];
    return base64String;
}
+ (NSString *)textFormBase64String:(NSString *)baseStr{
    if (baseStr) {
        NSData *data = [NSString dataWithBase64EncodedString:baseStr];
        //IOS 自带DES加密 End
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    else {
        return @"";
    }

}
+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
    [NSException raise:NSInvalidArgumentException format:@"String can't be null"];
    if ([string length] == 0)
    return [NSData data];
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
        return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
        decodingTable[(short)encodingTable[i]] = i;
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
    return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
    return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
            break;
            if (isspace(characters[i]) || characters[i] == '=')
            continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
        break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
        bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
        bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

+ (NSString *)getMD5FormingString:(NSString *)inputString{
    char hexDigits[]={'0','E','2','A','6','3','4','D','5','1','C','7','8','9','B','F'};
    const char *cStr = [inputString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i< CC_MD5_DIGEST_LENGTH; i++) {
        Byte byte = digest[i];
        [output appendFormat:@"%c",hexDigits[byte>>4]];
        [output appendFormat:@"%c",hexDigits[(byte & 0xf)]];
    }
    return output;
}
+ (NSString *)getUUID{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
+ (NSString *)getOneDateFormTime:(NSTimeInterval)time byFormat:(NSString *)format{
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/ 1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    dateFormatter.dateFormat = format?format:@"yyyy.MM.dd";
    return [dateFormatter stringFromDate:d];
}
+ (NSString *)mobileInfoValue{
    return @"";
}
+ (BOOL)stringIsNil:(NSString *)str{
    BOOL isNil;
    if ([str isKindOfClass:[NSString class]]) {
        if (str.length==0 || str == nil || [str isEqualToString:@""] ) {
            isNil = YES;
        }else{
            isNil = NO;
        }
    }else{
        isNil = YES;
    }
    return isNil;
}

@end
