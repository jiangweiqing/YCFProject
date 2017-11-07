//
//  NSArray+SaveArray.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SaveArray)
- (BOOL)writeToFileWithFileName:(NSString *)fileName;
+ (NSArray *)readFromFile:(NSString *)fileName;
@end
