//
//  UIControl+Click.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/30.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "UIControl+Click.h"
#import <objc/runtime.h>
#define Interval 1.0
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@interface UIControl (Click)
@property (nonatomic, assign) NSTimeInterval uxy_acceptEventInterval;   // 可以用这个给重复点击加间隔
@end

@implementation UIControl (Click)
+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__uxy_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}
- (void)__uxy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
//    if (self.uxy_ignoreEvent) return;
//    if (self.uxy_acceptEventInterval > 0)
//    {
//        self.uxy_ignoreEvent = YES;
//        [self performSelector:@selector(setUxy_ignoreEvent:) withObject:@(NO) afterDelay:self.uxy_acceptEventInterval];
//    }
//    [self __uxy_sendAction:action to:target forEvent:event];
}

@end
