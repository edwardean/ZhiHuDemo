//
//  ZHAnswerHeaderView.m
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderObject.h"
#import "ZHAnswerHeaderView.h"

#define DesLabelFont														[UIFont systemFontOfSize:15.0f]

#define CellContentMarginToLeftSide							10
#define CellContentMarginToTopSide				      10
#define CellContentMarginToBottomSide						10

#define TitleContentMarginToRightSide						55
#define DesContentMaginToRightSide							40

#define BottomButtonImageSizeWidth							17
#define BottomButtonImageSizeHeigh							15


@implementation ZHAnswerHeaderView

@synthesize answerHeaderTitleLabel = answerHeaderTitleLabel_;
@synthesize answerHeaderDesLabel = answerHeaderDesLabel_;
@synthesize answerHeaderAvatarButton = answerHeaderAvatarButton_;
@synthesize answerHeaderNameLabel = answerHeaderNameLabel_;
@synthesize answerHeaderFocusButton = answerHeaderFocusButton_;
@synthesize answerHeaderFocusLabel = answerHeaderFocusLabel_;
@synthesize answerHeaderCommentButton = answerHeaderCommentButton_;
@synthesize answerHeaderCommentLabel = answerHeaderCommentLabel_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    
    if (!answerHeaderTitleLabel_) {
      
      self.answerHeaderTitleLabel = [[UILabel alloc] init];
      [answerHeaderTitleLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [answerHeaderTitleLabel_ setOrigin:CGPointMake(CellContentMarginToLeftSide, CellContentMarginToTopSide)];
      [answerHeaderTitleLabel_ setBackgroundColor:[UIColor blueColor]];
      [self addSubview:answerHeaderTitleLabel_];
    }
    
    if (!answerHeaderDesLabel_) {
      self.answerHeaderDesLabel = [[UILabel alloc] init];
      [answerHeaderDesLabel_ setFont:DesLabelFont];
      [answerHeaderDesLabel_ setTextColor:[UIColor lightGrayColor]];
      [answerHeaderDesLabel_ setNumberOfLines:0];
      [answerHeaderDesLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
      [answerHeaderDesLabel_ setX:CellContentMarginToLeftSide];
      [answerHeaderDesLabel_ setBackgroundColor:[UIColor cyanColor]];
      [self addSubview:answerHeaderDesLabel_];
    }
    
    if (!answerHeaderAvatarButton_) {
      self.answerHeaderAvatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderAvatarButton_ setSize:CGSizeMake(20, 20)];
      [answerHeaderAvatarButton_ setImage:[UIImage imageNamed:@"ZHDMViewInputBox.png"]
                                 forState:UIControlStateNormal];
      [answerHeaderAvatarButton_.layer setCornerRadius:3.0f];
      [answerHeaderAvatarButton_ setX:CellContentMarginToLeftSide];
      [self addSubview:answerHeaderAvatarButton_];
    }
    
    if (!answerHeaderNameLabel_) {
      self.answerHeaderNameLabel = [[UILabel alloc] init];
      [answerHeaderNameLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
      [answerHeaderNameLabel_ setBackgroundColor:[UIColor greenColor]];
      [self addSubview:answerHeaderNameLabel_];
    }
    
    if (!answerHeaderFocusButton_) {
      self.answerHeaderFocusButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderFocusButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewFollowingIcon.png"]
                                forState:UIControlStateNormal];
      [answerHeaderFocusButton_ setX:CellContentMarginToLeftSide];
      [answerHeaderFocusButton_ setSize:CGSizeMake(BottomButtonImageSizeWidth, BottomButtonImageSizeHeigh)];
      [self addSubview:answerHeaderFocusButton_];
    }
    
    if (!answerHeaderFocusLabel_) {
      self.answerHeaderFocusLabel = [[UILabel alloc] init];
      [answerHeaderFocusLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
      [answerHeaderFocusLabel_ setBackgroundColor:[UIColor yellowColor]];
      [answerHeaderFocusLabel_ setText:@"0"];
      [self addSubview:answerHeaderFocusLabel_];
    }
    
    if (!answerHeaderCommentButton_) {
      self.answerHeaderCommentButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderCommentButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewCommentIcon.png"]
                                  forState:UIControlStateNormal];
      [answerHeaderCommentButton_ setSize:CGSizeMake(BottomButtonImageSizeWidth, BottomButtonImageSizeHeigh)];
      [self addSubview:answerHeaderCommentButton_];
    }
    
    if (!answerHeaderCommentLabel_) {
      self.answerHeaderCommentLabel = [[UILabel alloc] init];
      [answerHeaderCommentLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
      [answerHeaderCommentLabel_ setBackgroundColor:[UIColor redColor]];
      [answerHeaderCommentLabel_ setText:@"0"];
      [self addSubview:answerHeaderCommentLabel_];
    }
    
    
    /**
     关注收藏夹按钮，
     自定义UIControl子类
     Add it here....
     **/
    
  }
  return self;
}

+ (CGFloat)AnswerHeaderViewHeightWithObject:(id<ZHObject>)object
{
	return 0.0f;
}

- (void)bindHeaderContentWithObject:(id<ZHObject>)object
{
	ZHAnswerHeaderObject *answerHeaderObject = (ZHAnswerHeaderObject *)object;
  if (answerHeaderObject.title) {
    [self.answerHeaderTitleLabel setText:answerHeaderObject.title];
  }
  
  if (answerHeaderObject.des) {
    [self.answerHeaderDesLabel setText:answerHeaderObject.des];
  }
  
  if (answerHeaderObject.name) {
    [self.answerHeaderNameLabel setText:answerHeaderObject.name];
  }
  
  if (answerHeaderObject.follower_count) {
    [self.answerHeaderFocusLabel setText:answerHeaderObject.follower_count];
  }
  
  if (answerHeaderObject.comment_count) {
    [self.answerHeaderCommentLabel setText:answerHeaderObject.comment_count];
  }
  
  if (answerHeaderObject.avatar_url) {
    /**
     根据url设置用户头像
     **/
  }
  
  [self.answerHeaderTitleLabel sizeToFit];
  [self.answerHeaderDesLabel sizeToFit];
  [self.answerHeaderNameLabel sizeToFit];
  [self.answerHeaderFocusLabel sizeToFit];
  [self.answerHeaderCommentLabel sizeToFit];
  
  [self layoutIfNeeded];
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout Title Label
  [self.answerHeaderTitleLabel setSize:TextFitsSize(self.answerHeaderTitleLabel.text,
                                                    [self width] - CellContentMarginToLeftSide - TitleContentMarginToRightSide,
                                                    self.answerHeaderTitleLabel.font)];
  
  // Layout Des Label
  CGFloat desLabelOriginY = [self.answerHeaderTitleLabel bottom] + CellContentMarginToBottomSide;
  [self.answerHeaderDesLabel setY:desLabelOriginY];
  [self.answerHeaderDesLabel setSize:TextFitsSize(self.answerHeaderDesLabel.text,
                                                  [self width] - CellContentMarginToLeftSide - DesContentMaginToRightSide,
                                                  self.answerHeaderDesLabel.font)];
  
  // Layout AvatarButton and NameLabel
  CGFloat firstUnderlineOriginY = [self.answerHeaderDesLabel bottom] + CellContentMarginToBottomSide;
  
}

- (CGSize)sizeThatFits:(CGSize)size
{
	return CGSizeZero;
}

CGSize TextFitsSize(NSString *text,CGFloat width,UIFont *font) {
	
  CGSize size = [text sizeWithFont:font
                 constrainedToSize:CGSizeMake(width, MAXFLOAT)
                     lineBreakMode:NSLineBreakByWordWrapping];
  return size;
}

@end
