//
//  ZHAnswerHeaderView.m
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImage+RounedImage.h"
#import "ZHAnswerHeaderObject.h"
#import "ZHAnswerHeaderView.h"
#import "ZHAnswerHeaderFollowButton.h"

#define ZH_ANSWERHEADER_DESLABELFONTSIZE												14.0f

#define ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE									20
#define ZH_ANSWERHEADER_CONTENTMARGINTOTOPSIDE				      		10
#define ZH_ANSWERHEADER_CONTENTMARGINTOBOTTOMSIDE								10

#define ZH_ANSWERHEADER_TITLECONTENTMARGINTORIGHTSIDE						65
#define ZH_ANSWERHEADER_DESCONTENTMAGINTORIGHTSIDE							40

#define ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEWIDTH							17
#define ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEHEIGH							15

@interface ZHAnswerHeaderView ()


@property (nonatomic) UILabel *answerHeaderTitleLabel;
@property (nonatomic) UILabel *answerHeaderDesLabel;
@property (nonatomic) UIButton *answerHeaderAvatarButton;
@property (nonatomic) UILabel *answerHeaderNameLabel;
@property (nonatomic) UIButton *answerHeaderFocusButton;
@property (nonatomic) UILabel *answerHeaderFocusLabel;
@property (nonatomic) UIButton *answerHeaderCommentButton;
@property (nonatomic) UILabel *answerHeaderCommentLabel;
@property (nonatomic) ZHAnswerHeaderFollowButton *answerHeaderfollowButton;
@property (nonatomic) CGSize originSize;

@end

@implementation ZHAnswerHeaderView

@synthesize originSize = originSize_;

@synthesize answerHeaderTitleLabel = answerHeaderTitleLabel_;
@synthesize answerHeaderDesLabel = answerHeaderDesLabel_;
@synthesize answerHeaderAvatarButton = answerHeaderAvatarButton_;
@synthesize answerHeaderNameLabel = answerHeaderNameLabel_;
@synthesize answerHeaderFocusButton = answerHeaderFocusButton_;
@synthesize answerHeaderFocusLabel = answerHeaderFocusLabel_;
@synthesize answerHeaderCommentButton = answerHeaderCommentButton_;
@synthesize answerHeaderCommentLabel = answerHeaderCommentLabel_;
@synthesize answerHeaderfollowButton = answerHeaderfollowButton_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {

    self.originSize = frame.size;
    
    if (!answerHeaderTitleLabel_) {
      
      self.answerHeaderTitleLabel = [[UILabel alloc] init];
      [answerHeaderTitleLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [answerHeaderTitleLabel_ setNumberOfLines:0];
      [answerHeaderTitleLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
      [answerHeaderTitleLabel_ setOrigin:CGPointMake(ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE, ZH_ANSWERHEADER_CONTENTMARGINTOTOPSIDE)];
      [answerHeaderTitleLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:answerHeaderTitleLabel_];
    }
    
    if (!answerHeaderDesLabel_) {
      self.answerHeaderDesLabel = [[UILabel alloc] init];
      [answerHeaderDesLabel_ setFont:[UIFont systemFontOfSize:ZH_ANSWERHEADER_DESLABELFONTSIZE]];      [answerHeaderDesLabel_ setTextColor:[UIColor lightGrayColor]];
      [answerHeaderDesLabel_ setNumberOfLines:0];
      [answerHeaderDesLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
      [answerHeaderDesLabel_ setX:ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE];
      [answerHeaderDesLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:answerHeaderDesLabel_];
    }
    
    if (!answerHeaderAvatarButton_) {
      self.answerHeaderAvatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderAvatarButton_ setSize:CGSizeMake(20, 20)];
      [answerHeaderAvatarButton_ setImage:[UIImage imageNamed:@"ZHDMViewInputBox.png"]
                                 forState:UIControlStateNormal];
      [answerHeaderAvatarButton_.layer setCornerRadius:3.0f];
      [answerHeaderAvatarButton_ setX:ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE];
      [self addSubview:answerHeaderAvatarButton_];
    }
    
    if (!answerHeaderNameLabel_) {
      self.answerHeaderNameLabel = [[UILabel alloc] init];
      [answerHeaderNameLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
      [answerHeaderNameLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:answerHeaderNameLabel_];
    }
    
    if (!answerHeaderFocusButton_) {
      self.answerHeaderFocusButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderFocusButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewFollowingIcon.png"]
                                forState:UIControlStateNormal];
      [answerHeaderFocusButton_ setX:ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE];
      [answerHeaderFocusButton_ setSize:CGSizeMake(ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEWIDTH, ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEHEIGH)];
      [self addSubview:answerHeaderFocusButton_];
    }
    
    if (!answerHeaderFocusLabel_) {
      self.answerHeaderFocusLabel = [[UILabel alloc] init];
      [answerHeaderFocusLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
      [answerHeaderFocusLabel_ setBackgroundColor:[UIColor clearColor]];
      [answerHeaderFocusLabel_ setText:@"0"];
      [self addSubview:answerHeaderFocusLabel_];
    }
    
    if (!answerHeaderCommentButton_) {
      self.answerHeaderCommentButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerHeaderCommentButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewCommentIcon.png"]
                                  forState:UIControlStateNormal];
      [answerHeaderCommentButton_ setSize:CGSizeMake(ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEWIDTH, ZH_ANSWERHEADER_BOTTOMBUTTONIMAGESIZEHEIGH)];
      [self addSubview:answerHeaderCommentButton_];
    }
    
    if (!answerHeaderCommentLabel_) {
      self.answerHeaderCommentLabel = [[UILabel alloc] init];
      [answerHeaderCommentLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
      [answerHeaderCommentLabel_ setBackgroundColor:[UIColor clearColor]];
      [answerHeaderCommentLabel_ setText:@"0"];
      [self addSubview:answerHeaderCommentLabel_];
    }
    
    
    /**
     关注收藏夹按钮，
     自定义UIControl子类
     Add it here....
     **/
    if (!answerHeaderfollowButton_) {
      self.answerHeaderfollowButton = [[ZHAnswerHeaderFollowButton alloc] initWithFrame:CGRectZero];
      [self addSubview:answerHeaderfollowButton_];
    }
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
    __block typeof(self) weakself = self;
    UIImageView *avatarImage = [[UIImageView alloc] init];
    [avatarImage setImageWithURL:[NSURL URLWithString:answerHeaderObject.avatar_url] placeholderImage:nil options:SDWebImageProgressiveDownload success:^(UIImage *image) {
      image = [image makeRoundedImage:image radius:3.0f];
      [weakself.answerHeaderAvatarButton setImage:image forState:UIControlStateNormal];
    } failure:^(NSError *error) {
      
    }];
  }
  
  [self.answerHeaderTitleLabel sizeToFit];
  [self.answerHeaderDesLabel sizeToFit];
  [self.answerHeaderNameLabel sizeToFit];
  [self.answerHeaderFocusLabel sizeToFit];
  [self.answerHeaderCommentLabel sizeToFit];
  
  [self layoutIfNeeded];
  
  [self sizeToFit];
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout Title Label
  if ([self.answerHeaderTitleLabel.text length] > 0) {
    
    [self.answerHeaderTitleLabel setSize:CalculateTextSize(self.answerHeaderTitleLabel.text, self.answerHeaderTitleLabel.font,[self width] - ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE - ZH_ANSWERHEADER_TITLECONTENTMARGINTORIGHTSIDE, MAXFLOAT, NSLineBreakByWordWrapping)];
  } else {
  	[self.answerHeaderTitleLabel setSize:CGSizeZero];
  }
  
  // Layout Des Label
  CGFloat desLabelOriginY = [self.answerHeaderTitleLabel bottom] + ZH_ANSWERHEADER_CONTENTMARGINTOBOTTOMSIDE;
  if ([self.answerHeaderDesLabel.text length] > 0) {
    [self.answerHeaderDesLabel setY:desLabelOriginY];
    [self.answerHeaderDesLabel setSize:CalculateTextSize(self.answerHeaderDesLabel.text,self.answerHeaderDesLabel.font, [self width] - ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE - ZH_ANSWERHEADER_DESCONTENTMAGINTORIGHTSIDE,MAXFLOAT , NSLineBreakByWordWrapping)];
  } else {
  	[self.answerHeaderDesLabel setFrame:CGRectZero];
  }
  
  // Layout AvatarButton and NameLabel
  
  //第一条下划线的y坐标
  CGFloat firstUnderlineOriginY = [self.answerHeaderDesLabel bottom] + ZH_ANSWERHEADER_CONTENTMARGINTOBOTTOMSIDE;
  
  //两条线中间间距高度的中点
  CGFloat secondSectionContentCenterY = firstUnderlineOriginY + 40 * 0.5f;
  [self.answerHeaderAvatarButton setCenterY:secondSectionContentCenterY];
  
  //头像距离用户名之间10个像素
  CGFloat answerUserNameLabelOriginX = [self.answerHeaderAvatarButton right] + 10;
  if ([self.answerHeaderNameLabel.text length] > 0) {
    [self.answerHeaderNameLabel setX:answerUserNameLabelOriginX];
    [self.answerHeaderNameLabel setCenterY:secondSectionContentCenterY];
  } else {
  	[self.answerHeaderNameLabel setFrame:CGRectZero];
  }
  
  
  
  // Layout Focus Button/Label, Comment Button/Label
  // 第二条线的y坐标等于第一条线的y坐标加上两条线之间的高度40
  CGFloat secondUnderlineOriginY = firstUnderlineOriginY + 40;
  
  // 第二条线下边的高度中点等于第二条线y坐标加上下边内容高度的一半47（未透明像素高度做修正）
  CGFloat thirdSectionContentCenterY = secondUnderlineOriginY + 47 * 0.5f;
  [self.answerHeaderFocusButton setCenterY:thirdSectionContentCenterY];
  
  // answerHeaderFocusLabel的x坐标在answerHeaderFocusButton右边8个像素位置
  [self.answerHeaderFocusLabel setX:[self.answerHeaderFocusButton right] + 8];
  [self.answerHeaderFocusLabel setCenterY:thirdSectionContentCenterY];
  
  
  [self.answerHeaderCommentButton setX:[self.answerHeaderFocusLabel right] + 10];
  [self.answerHeaderCommentButton setCenterY:thirdSectionContentCenterY];
  
  [self.answerHeaderCommentLabel setX:[self.answerHeaderCommentButton right] + 8];
  [self.answerHeaderCommentLabel setCenterY:thirdSectionContentCenterY];
  
  [self.answerHeaderfollowButton setX:([self width] - 90)];
  [self.answerHeaderfollowButton setCenterY:thirdSectionContentCenterY];
  
}


- (CGSize)sizeThatFits:(CGSize)size
{
  CGSize titleSize = CalculateTextSize(self.answerHeaderTitleLabel.text,self.answerHeaderTitleLabel.font,
                                       [self width] - ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE - ZH_ANSWERHEADER_TITLECONTENTMARGINTORIGHTSIDE, MAXFLOAT,
                                       NSLineBreakByWordWrapping);
  
  CGSize desSize = CalculateTextSize(self.answerHeaderDesLabel.text, self.answerHeaderDesLabel.font,[self width] - ZH_ANSWERHEADER_CONTENTMARGINTOLEFTSIDE - ZH_ANSWERHEADER_DESCONTENTMAGINTORIGHTSIDE, MAXFLOAT, NSLineBreakByWordWrapping);
	//CGFloat height = self.originSize.height + titleSize.height + desSize.height;
  CGFloat height = 120 + titleSize.height + desSize.height;
  
  CGRect frame = self.frame;
  frame.size.height = height;
  
  return frame.size;
}

@end
