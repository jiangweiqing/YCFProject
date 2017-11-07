//
//  RequestManager.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "RequestManager.h"

static BOOL is_Fist = YES;
static BOOL canCheckNetwork = NO;


@implementation RequestManager
+ (void)postrRequestWithURLString:(NSString *)str parameters:(NSDictionary *)param succeed:(void (^)(NSDictionary *))scuess failure:(void (^)(NSInteger))failure{
    [self startMonitoring];
    BOOL isOk = [[AFNetworkReachabilityManager sharedManager] isReachable];
    if (isOk == false && canCheckNetwork == YES) {
        if (failure) {
            failure(1004);
        }
        return;
    }
    NetWorkingClient *client = [self sessionManager];
    [client POST:str parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (scuess) {
            scuess(responseDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error.code);
        }
    }];
    
}
+ (void)startMonitoring{
    if (is_Fist) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            canCheckNetwork = YES;
        }];
        is_Fist = NO;
    }
}
+ (NetWorkingClient *)sessionManager{
    NetWorkingClient *manager = [NetWorkingClient shareedClient];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 设置请求头中的参数
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    return manager;
    
}
@end

@implementation NetWorkingClient

+ (instancetype)shareedClient{
   
    static NetWorkingClient *client = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (client == nil) {
            client = [[NetWorkingClient alloc] initWithBaseURL:BaseURL];
        }
    });
    return client;
}

@end
