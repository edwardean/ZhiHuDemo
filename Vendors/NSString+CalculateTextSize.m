//
//  NSString+CalculateTextSize.m
//  ZHDemo
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "NSString+CalculateTextSize.h"

@implementation NSString (CalculateTextSize)

- (CGSize)CalculateTextSizeWith:(UIFont *)font
                           Size:(CGSize)defaultSize
                  LineBreakMode:(NSLineBreakMode)linebreakMode
{
	CGSize size = [self sizeWithFont:font constrainedToSize:defaultSize lineBreakMode:linebreakMode];
  return size;
}

@end
