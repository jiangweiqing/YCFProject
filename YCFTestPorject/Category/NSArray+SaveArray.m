//
//  NSArray+SaveArray.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "NSArray+SaveArray.h"

@implementation NSArray (SaveArray)

- (BOOL)writeToFileWithFileName:(NSString *)fileName{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *path = [documentsDirectory stringByAppendingString:fileName];
    BOOL didWriteSucessFull = [data writeToFile:path atomically:YES];
    return didWriteSucessFull;
}
+ (NSArray *)readFromFile:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = [paths firstObject];
    NSString *path = [document stringByAppendingString:fileName];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}


@end
