//
//  ScaleImage.h
//  YCFTestPorject
//
//  Created by jiang on 2017/11/10.
//  Copyright © 2017年 YCF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaleImage : UIImage
/**
 *  缩放图片
 *
 *  @param image     原始图片
 *  @param scaleSize 缩放比例
 *
 *  @return 返回按照缩放比例缩放后的图片
 */
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
/**
 *  制定宽度缩放图片
 *
 *  @param image 原始图片
 *  @param size  缩放后的尺寸
 *
 *  @return 指定SIZE的图片
 */
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)size;
/**
 *  将图片保存到相册中
 *
 *  @param image 要保存的图片
 */
+ (void)saveThePhotoLibary:(UIImage *)image;


@end
