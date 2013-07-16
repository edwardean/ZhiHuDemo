//
//  ZHCalculateTextSize.h
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHCalculateTextSize : NSObject

CGSize CalculateTextSize(NSString *text,UIFont *font,CGFloat width,CGFloat height,NSLineBreakMode linebreakMode);

@end
