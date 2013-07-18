//
//  NSString+CalculateTextSize.h
//  ZHDemo
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CalculateTextSize)

- (CGSize)CalculateTextSizeWith:(UIFont *)font
                           Size:(CGSize)defaultSize
                  LineBreakMode:(NSLineBreakMode)linebreakMode;

@end
