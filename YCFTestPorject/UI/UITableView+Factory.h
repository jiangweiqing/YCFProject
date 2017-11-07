//
//  UITableView+Factory.h
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Factory)

+ (UITableView *)tableviewInitWithDelegate:(id<UITableViewDelegate>)delegate;

@end
