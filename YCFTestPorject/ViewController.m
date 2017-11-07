//
//  ViewController.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/26.
//  Copyright © 2017年 jiang. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Factory.h"
#import "RequestManager.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RequestManager postrRequestWithURLString:@"" parameters:nil succeed:^(NSDictionary *dic) {
        
    } failure:^(NSInteger eerrorCode) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
- (UITableView *)tableView{
    if (!_tableView) {
        __weak typeof(self) weakSelf = self;
        _tableView = [UITableView tableviewInitWithDelegate:weakSelf];
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
