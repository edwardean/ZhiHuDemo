//
//  UIImage+RounedImage.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "UIImage+RounedImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (RounedImage)

- (UIImage *)makeRoundedImage:(UIImage *)image
                       radius:(float)radius;
{
  CALayer *imageLayer = [CALayer layer];
  imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
  imageLayer.contents = (id) image.CGImage;
  
  imageLayer.masksToBounds = YES;
  imageLayer.cornerRadius = radius;
  
  UIGraphicsBeginImageContext(image.size);
  [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return roundedImage;
}

@end
