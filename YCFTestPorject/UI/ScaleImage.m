//
//  ScaleImage.m
//  YCFTestPorject
//
//  Created by jiang on 2017/11/10.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import "ScaleImage.h"
#import <Photos/Photos.h>
#import <Foundation/Foundation.h>
@implementation ScaleImage
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)size{
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}
+ (void)saveThePhotoLibary:(UIImage *)image{
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
    }];
}
- (void)addd{
    NSArray *dataArray;
    @autoreleasepool {
        for (int i = 0; i<dataArray.count; i++) {
            NSLog(@"____%@",dataArray[i]);
        }
//        [dataArray]
    }
}
@end
