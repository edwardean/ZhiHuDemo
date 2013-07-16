//
//  UIImage+RounedImage.h
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RounedImage)

- (UIImage *)makeRoundedImage:(UIImage *)image
                       radius:(float)radius;

@end
