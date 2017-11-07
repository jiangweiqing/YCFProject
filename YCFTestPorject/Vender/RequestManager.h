//
//  RequestManager.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 YCF. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define BaseURL    ([NSURL URLWithString:@""])
#define kTimeoutInterval  15 
@interface RequestManager : NSObject
// failure:(void(^)(NSInteger eerrorCode))
+(void)postrRequestWithURLString:(NSString *)str parameters:(NSDictionary *)param succeed:(void(^)(NSDictionary *dic))scuess failure:(void(^)(NSInteger eerrorCode))failure;

@end

@interface NetWorkingClient : AFHTTPSessionManager
+ (instancetype)shareedClient;
@end
