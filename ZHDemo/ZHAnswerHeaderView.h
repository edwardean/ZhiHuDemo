//
//  ZHAnswerHeaderView.h
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHObject.h"

@class ZHAnswerHeaderFollowButton;
@interface ZHAnswerHeaderView : UIView


+ (CGFloat)AnswerHeaderViewHeightWithObject:(id<ZHObject>)object;

- (void)bindHeaderContentWithObject:(id<ZHObject>)object;

@end
