//
//  BaseListViewController.h
//  YCFTestPorject
//
//  Created by jiang on 2017/11/6.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseListViewController : UIViewController
@property (nonatomic, assign) NSInteger pageNumber;
@property (nonatomic, assign) NSInteger pageCout;
@property (nonatomic, assign) NSInteger totalCount;


- (void)loadData;
- (void)reFreshData;
- (void)loadMoreData;
@end
