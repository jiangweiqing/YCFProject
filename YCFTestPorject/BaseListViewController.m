//
//  BaseListViewController.m
//  YCFTestPorject
//
//  Created by jiang on 2017/11/6.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListViewController ()

@end

@implementation BaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageCout = 15;
    self.pageNumber = 1;
    // Do any additional setup after loading the view.
}
- (void)loadData{
    //    NSDictionary *param = [NSDictionary]
}
- (void)reFreshData{
    self.pageNumber = 1;
    [self loadData];
}
- (void)loadMoreData{
    self.pageNumber++;
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
