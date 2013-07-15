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

@property (nonatomic) UILabel *answerHeaderTitleLabel;
@property (nonatomic) UILabel *answerHeaderDesLabel;
@property (nonatomic) UIButton *answerHeaderAvatarButton;
@property (nonatomic) UILabel *answerHeaderNameLabel;
@property (nonatomic) UIButton *answerHeaderFocusButton;
@property (nonatomic) UILabel *answerHeaderFocusLabel;
@property (nonatomic) UIButton *answerHeaderCommentButton;
@property (nonatomic) UILabel *answerHeaderCommentLabel;
@property (nonatomic) ZHAnswerHeaderFollowButton *answerHeaderfollowButton;

+ (CGFloat)AnswerHeaderViewHeightWithObject:(id<ZHObject>)object;

- (void)bindHeaderContentWithObject:(id<ZHObject>)object;

@end
