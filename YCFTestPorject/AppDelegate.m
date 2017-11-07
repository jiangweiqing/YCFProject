//
//  AppDelegate.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 jiang. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AddSetting.h"
#import "PopViewController.h"
@interface AppDelegate (){
    PopViewController *_pop;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self settingBugly];
    _pop = [[PopViewController alloc] init];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"APP激活状态将会取消。。。。。");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"APP已经进入到后台状态");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"APP即将进入前台");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
//    if (!_pop.hasPop) {
//        NSLog(@"APP处于激活状态");
//        _pop.hasPop = YES;
//        [self.window.rootViewController presentViewController:_pop animated:YES completion:nil];
//    }
    PopViewController *vc = [[PopViewController alloc] init];
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"APP即将被销毁状态。。。");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end