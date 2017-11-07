//
//  UITableView+Factory.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/31.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "UITableView+Factory.h"

@implementation UITableView (Factory)

+ (UITableView *)tableviewInitWithDelegate:(id)delegate{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.dataSource = delegate;
    tableView.delegate = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 45;
    tableView.backgroundColor = [UIColor whiteColor];
    return tableView;
}

@end
