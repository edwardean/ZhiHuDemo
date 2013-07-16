//
//  ZHAnswerCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerCell.h"
#import "ZHAnswerObject.h"
#import <QuartzCore/QuartzCore.h>

#define AnswerCellContentMarginToTopSide				10
#define AnswerCellContentMarginToLeftSide				10

#define AnswerExcerptLabelFont                  [UIFont systemFontOfSize:13.0f]
#define AnswerTitleLabelFont                    [UIFont systemFontOfSize:15.0f]
@interface ZHAnswerCell ()

@property (nonatomic) UILabel *answerTitleLabel;
@property (nonatomic) UIButton *answerArrowListButton;
@property (nonatomic) UIButton *avatarButton;
@property (nonatomic) UIImageView *voteupBackgroundView;
@property (nonatomic) UILabel *voteupLabel;
@property (nonatomic) UILabel *answerExcerptLabel;

@end

@implementation ZHAnswerCell

@synthesize answerTitleLabel = answerTitleLabel_;
@synthesize answerArrowListButton = answerArrowListButton_;
@synthesize avatarButton = avatarButton_;
@synthesize voteupBackgroundView = voteupBackgroundView_;
@synthesize voteupLabel = voteupLabel_;
@synthesize answerExcerptLabel = answerExcerptLabel_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
      if (!answerTitleLabel_) {
        self.answerTitleLabel = [[UILabel alloc] init];
        [answerTitleLabel_ setFont:AnswerTitleLabelFont];
        [answerTitleLabel_ setNumberOfLines:0];
        [answerTitleLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
        [answerTitleLabel_ setBackgroundColor:[UIColor greenColor]];
        [answerTitleLabel_ setOrigin:CGPointMake(AnswerCellContentMarginToLeftSide, AnswerCellContentMarginToTopSide)];
        [self.contentView addSubview:answerTitleLabel_];
      }
      
      if (!answerArrowListButton_) {
        self.answerArrowListButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [answerArrowListButton_ setImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]
                                forState:UIControlStateNormal];
        [self.contentView addSubview:answerArrowListButton_];
      }
      
      if (!avatarButton_) {
        self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [avatarButton_ setImage:[UIImage imageNamed:@"AvatarMaskS.png"]
                       forState:UIControlStateNormal];
        [avatarButton_.layer setCornerRadius:3.0f];
        [avatarButton_ setX:AnswerCellContentMarginToLeftSide];
        [self.contentView addSubview:avatarButton_];
      }
      
      if (!voteupBackgroundView_) {
        self.voteupBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 15)];
        [voteupBackgroundView_ setImage:[UIImage imageNamed:@"ZHQuestionViewAnswerVotedBase.png"]];
        [voteupBackgroundView_ setX:AnswerCellContentMarginToLeftSide];
        [self.voteupBackgroundView.layer setCornerRadius:3.0f];
        [self.contentView addSubview:voteupBackgroundView_];
      }
      
      if (!voteupLabel_) {
        self.voteupLabel = [[UILabel alloc] init];
        [voteupLabel_ setTextColor:[UIColor whiteColor]];
        [voteupLabel_ setFont:[UIFont systemFontOfSize:12.0f]];
        [voteupLabel_ setTextAlignment:NSTextAlignmentCenter];
        [voteupLabel_ setText:@"0"];
        [self.contentView addSubview:voteupLabel_];
      }
      
      if (!answerExcerptLabel_) {
        self.answerExcerptLabel = [[UILabel alloc] init];
  			[answerExcerptLabel_ setFont:AnswerExcerptLabelFont];
        [answerExcerptLabel_ setNumberOfLines:0];
        [answerExcerptLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
        [answerExcerptLabel_ setTextColor:[UIColor colorWithWhite:0.337 alpha:1.000]];
        [self.contentView addSubview:answerExcerptLabel_];
      }
      
    }
    return self;
}

+ (CGFloat)RowHeightWitObject:(id)object
{
	return 44.0f;
}

- (void)bindWithObject:(id)object
{
	
}

@end
