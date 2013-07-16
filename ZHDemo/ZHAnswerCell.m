//
//  ZHAnswerCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+RounedImage.h"
#import "UIView+Frame.h"
#import "ZHAnswerCell.h"
#import "ZHAnswerObject.h"

#define AnswerCellContentMarginToTopSide				15
#define AnswerCellContentMarginToLeftSide				18
#define AnswerCellTitleToLineMargin							10

#define AnswerCellBottomContentOriginToLine			10
#define AvatarToTagMargin												5

#define AvatarToExcerptMargin										10
#define AvatarWidth															25
#define AvatarHeight														25
#define TagWidth																25
#define TagHeight																15

#define TitleLabelWidth													250
#define ExcerptLabelWidth												235

#define TitleLabelMaxHeight											44
#define ExcerptLabelMaxHeight										60

#define TagLabelToBottomMargin									10
#define ExcerptLabelToBottommargin							15

#define ArrowbuttonToRightSideMargin						10

#define AnswerExcerptLabelFont                  [UIFont systemFontOfSize:14.0f]
#define AnswerTitleLabelFont                    [UIFont boldSystemFontOfSize:15.0f]


#define AnswerCellMaxHeight											140.0f
#define AnswerCellMinHeight											120.0f

@interface ZHAnswerCell ()

@property (nonatomic) UILabel *answerTitleLabel;
@property (nonatomic) UIButton *answerArrowListButton;
@property (nonatomic) UIButton *avatarButton;
@property (nonatomic) UIImageView *voteupBackgroundView;
@property (nonatomic) UILabel *voteupLabel;
@property (nonatomic) UILabel *answerExcerptLabel;

@property (nonatomic) UIImageView *temporaryImageView;

@property (nonatomic) UIImageView *answerSeparateLine;

@end

@implementation ZHAnswerCell
@synthesize answerTitleLabel = answerTitleLabel_;
@synthesize answerArrowListButton = answerArrowListButton_;
@synthesize avatarButton = avatarButton_;
@synthesize voteupBackgroundView = voteupBackgroundView_;
@synthesize voteupLabel = voteupLabel_;
@synthesize answerExcerptLabel = answerExcerptLabel_;
@synthesize temporaryImageView = temporaryImageView_;
@synthesize answerSeparateLine = answerSeparateLine_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    if (!answerTitleLabel_) {
      self.answerTitleLabel = [[UILabel alloc] init];
      [answerTitleLabel_ setFont:AnswerTitleLabelFont];
      [answerTitleLabel_ setNumberOfLines:0];
      [answerTitleLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
      [answerTitleLabel_ setBackgroundColor:[UIColor clearColor]];
      [answerTitleLabel_ setOrigin:CGPointMake(AnswerCellContentMarginToLeftSide, AnswerCellContentMarginToTopSide)];
      [self.contentView addSubview:answerTitleLabel_];
    }
    
    if (!answerArrowListButton_) {
      self.answerArrowListButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [answerArrowListButton_ setSize:CGSizeMake(10, 14)];
      [answerArrowListButton_ setImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]
                              forState:UIControlStateNormal];
      [self.contentView addSubview:answerArrowListButton_];
    }
    
    if (!avatarButton_) {
      self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [avatarButton_ setSize:CGSizeMake(AvatarWidth, AvatarHeight)];
      [avatarButton_ setImage:[UIImage imageNamed:@"AvatarMaskS.png"]
                     forState:UIControlStateNormal];
      [avatarButton_.layer setCornerRadius:3.0f];
      [avatarButton_ setX:AnswerCellContentMarginToLeftSide];
      [self.contentView addSubview:avatarButton_];
    }
    
    if (!voteupBackgroundView_) {
      self.voteupBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                0,
                                                                                25,
                                                                                15)];
      [voteupBackgroundView_ setImage:[UIImage
                                       imageNamed:@"ZHQuestionViewAnswerVotedBase.png"]];
      [voteupBackgroundView_ setX:AnswerCellContentMarginToLeftSide];
      [voteupBackgroundView_ setSize:CGSizeMake(TagWidth, TagHeight)];
      [self.voteupBackgroundView.layer setCornerRadius:3.0f];
      [self.contentView addSubview:voteupBackgroundView_];
    }
    
    if (!voteupLabel_) {
      self.voteupLabel = [[UILabel alloc] init];
      [voteupLabel_ setTextColor:[UIColor whiteColor]];
      [voteupLabel_ setFont:[UIFont systemFontOfSize:11.0f]];
      [voteupLabel_ setTextAlignment:NSTextAlignmentCenter];
      [voteupLabel_ setAdjustsFontSizeToFitWidth:YES];
      [voteupLabel_ setText:@"0"];
      [voteupLabel_ setBackgroundColor:[UIColor clearColor]];
      if (voteupBackgroundView_) {
        [voteupBackgroundView_ addSubview:voteupLabel_];
      }
    }
    
    if (!answerExcerptLabel_) {
      self.answerExcerptLabel = [[UILabel alloc] init];
      [answerExcerptLabel_ setFont:AnswerExcerptLabelFont];
      [answerExcerptLabel_ setNumberOfLines:0];
      [answerExcerptLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
      [answerExcerptLabel_ setTextColor:[UIColor colorWithWhite:0.337 alpha:1.000]];
      [answerExcerptLabel_ setBackgroundColor:[UIColor clearColor]];
      [self.contentView addSubview:answerExcerptLabel_];
    }
    
    if (!temporaryImageView_) {
      self.temporaryImageView = [[UIImageView alloc] init];
    }
    
    if (!answerSeparateLine_) {
      self.answerSeparateLine = [[UIImageView alloc]
                                 initWithImage:[UIImage
                                                imageNamed:@"ZHFeaturedContentBase.png"]];
      [self.contentView addSubview:answerSeparateLine_];
    }
    
    
    self.clipsToBounds = YES;
  }
  return self;
}

+ (CGFloat)RowHeightWitObject:(id)object
{
  ZHAnswerObject *answerObject = (ZHAnswerObject *)object;
  CGSize titleSize = CGSizeZero;
  CGSize excerptSize = CGSizeZero;
  
  if (answerObject.title) {
    titleSize = CalculateTextSize(answerObject.title,
                                  AnswerTitleLabelFont,
                                  TitleLabelWidth,
                                  TitleLabelMaxHeight,
                                  NSLineBreakByTruncatingTail);
  }
  
  if (answerObject.excerpt) {
    excerptSize = CalculateTextSize(answerObject.excerpt,
                                    AnswerExcerptLabelFont,
                                    ExcerptLabelWidth,
                                    ExcerptLabelMaxHeight,
                                    NSLineBreakByTruncatingTail);
  }
  
  CGFloat cellHeight = titleSize.height + excerptSize.height + AnswerCellContentMarginToTopSide + AnswerCellTitleToLineMargin + AnswerCellBottomContentOriginToLine + ExcerptLabelToBottommargin;
  
  if (cellHeight > AnswerCellMaxHeight) {
    cellHeight = AnswerCellMaxHeight;
  }
  if (cellHeight < AnswerCellMinHeight) {
    cellHeight = AnswerCellMinHeight;
  }
  
	return cellHeight;
}

- (void)bindWithObject:(id)object
{
	ZHAnswerObject *answerObject = (ZHAnswerObject *)object;
  if (answerObject.title) {
    [self.answerTitleLabel setText:answerObject.title];
  }
  
  if (answerObject.excerpt) {
    [self.answerExcerptLabel setText:answerObject.excerpt];
  }
  
  if (answerObject.avatar_url) {
    
    __block typeof(self) weakself = self;
    
    UIImageView *avatarImageView = weakself.temporaryImageView;
    [avatarImageView setImageWithURL:[NSURL URLWithString:answerObject.avatar_url]
                    placeholderImage:nil
                             options:SDWebImageProgressiveDownload
                             success:^(UIImage *image) {
                               image = [image makeRoundedImage:image
                                                        radius:3.0f];
                               [weakself.avatarButton setImage:image
                                                      forState:UIControlStateNormal];
                             } failure:^(NSError *error) {
                               
                             }];
  }
  
  if (answerObject.voteup_count) {
    [self.voteupLabel setText:answerObject.voteup_count];
  }

  [self layoutIfNeeded];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout Subviews
  
  // Layout TitleLabel
	CGSize answerTitleSize = CalculateTextSize(self.answerTitleLabel.text,
                                             AnswerTitleLabelFont,
                                             TitleLabelWidth,
                                             TitleLabelMaxHeight,
                                             self.answerTitleLabel.lineBreakMode);
  
  [self.answerTitleLabel setSize:answerTitleSize];
  
  // Layout Arrow Button
  [self.answerArrowListButton setX:[self width] - 45];
  [self.answerArrowListButton setCenterY:[self.answerTitleLabel centerY]];
  
  // Layout Line
  CGFloat  lineOriginY = [self.answerTitleLabel bottom] + AnswerCellTitleToLineMargin;
  [self.answerSeparateLine setY:lineOriginY];
  
  // Layout Bottom Content
  // Layout Avatar
  CGFloat avatarOriginY = [self.answerSeparateLine bottom] + AnswerCellBottomContentOriginToLine;
  [self.avatarButton setY:avatarOriginY];
  
  // Layout TagBackgroundView
  CGFloat tagViewOriginY = [self.avatarButton bottom] + AvatarToTagMargin;
  [self.voteupBackgroundView setY:tagViewOriginY];
  
  // Layout TagLabel
  [self.voteupLabel setSize:CGSizeMake([self.voteupBackgroundView width] - 1,
                                       [self.voteupBackgroundView height] - 1)];
  
  // Layout Excerpt Label
  CGFloat excerptLabelOriginX = [self.avatarButton right] + AvatarToExcerptMargin;
  CGFloat excerptLabelOriginY = [self.avatarButton y];
  
  CGSize excerptSize = CalculateTextSize(self.answerExcerptLabel.text,
                                         AnswerExcerptLabelFont,
                                         ExcerptLabelWidth,
                                         ExcerptLabelMaxHeight,
                                         self.answerExcerptLabel.lineBreakMode);

  CGFloat voteupLabelBottom = [self.voteupBackgroundView bottom];
	CGFloat height = voteupLabelBottom - avatarOriginY;
  CGFloat excerptCenterY = 0;
  if (excerptSize.height < height) {
    excerptCenterY = height * 0.5f;
  }
  
  [self.answerExcerptLabel setFrame:CGRectMake(excerptLabelOriginX,
                                               excerptLabelOriginY,
                                               excerptSize.width,
                                               excerptSize.height)];
  if (excerptCenterY) {
    [self.answerExcerptLabel setCenterY:excerptLabelOriginY + excerptCenterY];
  }
  
}

@end
