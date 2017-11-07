//
//  AppDelegate+AddSetting.m
//  YCFTestPorject
//
//  Created by jiang on 2017/11/2.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "AppDelegate+AddSetting.h"
#import <BuglyHotfix/Bugly.h>
#import <BuglyHotfix/BuglyMender.h>
#import "JPEngine.h"


@implementation AppDelegate (AddSetting)
- (void)settingBugly{
    BuglyConfig *config           = [[BuglyConfig alloc] init];
    config.delegate               = self;
    config.debugMode              = YES;
    config.reportLogLevel         = BuglyLogLevelInfo;
    [Bugly startWithAppId:@"900001055" developmentDevice:YES config:config];
    [JPEngine handleException:^(NSString *msg) {
    NSException *jspatchException = [NSException exceptionWithName:@"Hotfix Exception" reason:msg userInfo:nil];
    [Bugly reportException:jspatchException];
    }];

    [[BuglyMender sharedMender] checkRemoteConfigWithEventHandler:^(BuglyHotfixEvent event, NSDictionary *patchInfo) {
        if (event == BuglyHotfixEventPatchValid || event == BuglyHotfixEventNewPatch) {
            NSString *pathDirectory = [[BuglyMender sharedMender] patchDirectory];
            if (pathDirectory) {
                NSString *patchFileName = @"main.js";
                NSString *patchFile = [pathDirectory stringByAppendingString:patchFileName];
                if ([[NSFileManager defaultManager] fileExistsAtPath:patchFile] && [JPEngine evaluateScriptWithPath:patchFile] != nil) {
                    [[BuglyMender sharedMender] reportPatchStatus:BuglyHotfixPatchStatusActiveSucess];
                }else{
                    [[BuglyMender sharedMender] reportPatchStatus:BuglyHotfixPatchStatusActiveFail];
                }
            }
        }
    }];
}
@end
