//
//  PopViewController.m
//  YCFTestPorject
//
//  Created by jiang on 2017/10/27.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "PopViewController.h"
#import <SDWebImageManager.h>
@interface PopViewController ()
@property (nonatomic, strong) UIImageView *imageview1;
@property (nonatomic, strong) UIImageView *imageview2;
@property (nonatomic, strong) UIImageView *imageview3;
@property (nonatomic, strong) UIImageView *imageview4;


@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    for (int i = 0; i<4; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0+50*i, 100, 50, 50)];
        if (i == 0) {
            self.imageview1 = view;
        }else if (i == 1){
            self.imageview2 = view;
        }else if (i == 2){
            self.imageview3 = view;
        }else{
            self.imageview4 = view;
        }
    }
    
    [self.view addSubview:self.imageview1];
    [self.view addSubview:self.imageview2];
    [self.view addSubview:self.imageview3];
    [self.view addSubview:self.imageview4];
    [self loadData];
}
- (void)loadData{
    [self loadImage];
}
-(void)loadImage
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t global =  dispatch_get_global_queue(0, 0);
    __block  UIImage *image1 = nil;
    dispatch_group_async(group, global, ^{
        [self downloadImageWithURL:@"http://h.hiphotos.baidu.com/zhidao/pic/item/b64543a98226cffc192273a6b9014a90f603ea9e.jpg" andBlock:^(UIImage *returnImage) {
            image1 = returnImage;
            NSLog(@"image1__thread-%@执行完成了...",[NSThread currentThread]);
        } enterGroup:group];
    });
    __block UIImage *image2 = nil;
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self downloadImageWithURL:@"http://i31.tinypic.com/2w7e0wy.jpg" andBlock:^(UIImage *returnImage){
            image2 = returnImage;
            NSLog(@"image2__thread-%@执行完成了...",[NSThread currentThread]);
            
        } enterGroup:group];
    });
    __block UIImage *image3 = nil;
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self downloadImageWithURL:@"http://h.hiphotos.baidu.com/zhidao/pic/item/b64543a98226cffc192273a6b9014a90f603ea9e.jpg" andBlock:^(UIImage *returnImage) {
             image3 = returnImage;
        } enterGroup:group];
        NSLog(@"image3__thread-%@执行完成了...",[NSThread currentThread]);
    });
    __block UIImage *image4 = nil;
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self downloadImageWithURL:@"http://img05.tooopen.com/images/20150422/tooopen_sy_119881522119.jpg" andBlock:^(UIImage *returnImage) {
            image4 = returnImage;
            NSLog(@"image4__thread-%@执行完成了...",[NSThread currentThread]);

        } enterGroup:group];
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        self.imageview1.image = image1;
        self.imageview2.image = image2;
        self.imageview3.image = image3;
        self.imageview4.image= image4;
        NSLog(@"Main__thread-%@执行完成了...",[NSThread currentThread]);
        
    });
}
- (void)downloadImageWithURL:(NSString *)str andBlock:(void (^)(UIImage *returnImage))imageBlock enterGroup:(dispatch_group_t)group{
    dispatch_group_enter(group);
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager loadImageWithURL:[NSURL URLWithString:str] options:SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if (imageBlock) {
            imageBlock(image);
            dispatch_group_leave(group);
        }
    }];
}
//- (void)loadImageWithURL:(NSString *)str andBlock:(UIImage * (^)(UIImage *bImage))imageBlock{
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager loadImageWithURL:[NSURL URLWithString:str] options:SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
//        if (imageBlock) {
//            imageBlock(image);
//        }
//    }];
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hasPop = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc{
    NSLog(@"##########Dealloc############");
}
@end
