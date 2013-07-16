//
//  ZHCalculateTextSize.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCalculateTextSize.h"

@implementation ZHCalculateTextSize

CGSize CalculateTextSize(NSString *text,UIFont *font,CGFloat width,CGFloat height,NSLineBreakMode linebreakMode)
{
  CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, height) lineBreakMode:linebreakMode];
  return size;
}

@end
