//
//  ZHBarButtonItem.h
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHBarButtonItem : UIBarButtonItem

+ (ZHBarButtonItem *)BarButtonItemWithImage:(UIImage *)image
                                      block:(dispatch_block_t)block;

+ (ZHBarButtonItem *)BarButtonItemWithTitle:(NSString *)title
                                      block:(dispatch_block_t)block;

@end
