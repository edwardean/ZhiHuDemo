//
//  ZHFeedsCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ZHFeedsObject.h"
#import "ZHFeedsAnswerCell.h"
#import "UIView+Frame.h"
#import "NSString+CalculateTextSize.h"

@interface ZHFeedsAnswerCell ()
{
	BOOL isActorsLabelHighlighted;
}

@property (nonatomic, strong, readwrite) UILabel *actorsLabel;							//某某某
@property (nonatomic, strong, readwrite) UILabel *feedLabel;								//回答/赞同了该问题
@property (nonatomic, strong, readwrite) UIButton *avatarButton;						//头像
@property (nonatomic, strong, readwrite) UILabel *titleLabel;								//标题
@property (nonatomic, strong, readwrite) UIImageView *voteupBackgroundView;	//标签背景
@property (nonatomic, strong, readwrite) UILabel *voteupLabel;							//标签
@property (nonatomic, strong, readwrite) UILabel *answerExcerptLabel;				//问题描述

@end

@implementation ZHFeedsAnswerCell
@synthesize actorsLabel = actorsLabel_;
@synthesize feedLabel = feedLabel_;
@synthesize avatarButton = avatarButton_;
@synthesize titleLabel = titleLabel_;
@synthesize voteupBackgroundView = voteupBackgroundView_;
@synthesize voteupLabel = voteupLabel_;
@synthesize answerExcerptLabel = answerExcerptLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.actorsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [actorsLabel_ setBackgroundColor:[UIColor clearColor]];
    [actorsLabel_ setFont:[UIFont systemFontOfSize:ACTORSLABELFONTSIZE]];
    [actorsLabel_ setOrigin:CGPointMake(CELLCONTENTMARGINTOLEFT, CELLCONTENTMARGINTOTOP)];
    [actorsLabel_ setTextColor:[UIColor colorWithRed:0.320 green:0.485 blue:0.730 alpha:1.000]];
    [actorsLabel_ setLineBreakMode:LINEBREAKBYTRUNCATINGTAIL];
    [actorsLabel_ setUserInteractionEnabled:YES];
    UITapGestureRecognizer *actorsLabelGesture = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(labelTapped:)];
    [actorsLabel_ addGestureRecognizer:actorsLabelGesture];
    [[UILabel appearance] setHighlightedTextColor:[UIColor grayColor]];
    [actorsLabel_ setBackgroundColor:[UIColor grayColor]];
    [self.contentView addSubview:actorsLabel_];
    
    
    self.feedLabel = [[UILabel alloc] init];
    [feedLabel_ setBackgroundColor:[UIColor clearColor]];
    [feedLabel_ setFont:[UIFont systemFontOfSize:ACTORSLABELFONTSIZE]];
    [feedLabel_ setTextColor:[UIColor colorWithWhite:0.594 alpha:1.000]];
    [feedLabel_ setY:CELLCONTENTMARGINTOTOP];
    [self.contentView addSubview:feedLabel_];
    
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [avatarButton_ setOrigin:CGPointMake([self width] - CELLCONTENTMARGINTORIGHT - 25, CELLCONTENTMARGINTOTOP)];
    [avatarButton_ setSize:CGSizeMake(25, 25)];
    [[avatarButton_ layer] setCornerRadius:3.0f];
    [avatarButton_ setClipsToBounds:YES];
		[self.contentView addSubview:avatarButton_];
    
    self.titleLabel = [[UILabel alloc] init];
    [titleLabel_ setBackgroundColor:[UIColor clearColor]];
    [titleLabel_ setNumberOfLines:0];
    [titleLabel_ setX:CELLCONTENTMARGINTOLEFT];
    [titleLabel_ setLineBreakMode:LINEBREAKBYTRUNCATINGTAIL];
    [titleLabel_ setFont:[UIFont boldSystemFontOfSize:TITLELABELFONTSIZE]];
    [self.contentView addSubview:titleLabel_];
    
    
    self.voteupBackgroundView = [[UIImageView alloc]
                                 initWithFrame:CGRectMake(0,0,25,15)];
    [voteupBackgroundView_ setImage:[UIImage
                                     imageNamed:@"ZHQuestionViewAnswerVotedBase.png"]];
    [voteupBackgroundView_ setX:CELLCONTENTMARGINTOLEFT];
    [self.contentView addSubview:voteupBackgroundView_];
    
    self.voteupLabel = [[UILabel alloc] init];
    [self.voteupLabel setBackgroundColor:[UIColor clearColor]];
    [self.voteupLabel setTextColor:[UIColor whiteColor]];
    [self.voteupLabel setTextAlignment:TEXTALIGNMENTCENTER];
    [voteupLabel_ setFont:[UIFont systemFontOfSize:11.0f]];
    [voteupLabel_ setAdjustsFontSizeToFitWidth:YES];
    [self.voteupBackgroundView addSubview:voteupLabel_];
    
    
    self.answerExcerptLabel = [[UILabel alloc] init];
    [answerExcerptLabel_ setBackgroundColor:[UIColor clearColor]];
    [answerExcerptLabel_ setNumberOfLines:0];
    [answerExcerptLabel_ setLineBreakMode:LINEBREAKBYTRUNCATINGTAIL];
    [answerExcerptLabel_ setFont:[UIFont systemFontOfSize:EXCERPTLABELFONTSIZE]];
    [answerExcerptLabel_ setTextColor:[UIColor grayColor]];
    [self.contentView addSubview:answerExcerptLabel_];
    
  }
  return self;
}

- (void)labelTapped:(UIGestureRecognizer *)sender
{
  
}

- (void)clearCellContent
{
	[self.actorsLabel setText:nil];
  [self.feedLabel setText:nil];
  [self.titleLabel setText:nil];
  [self.voteupLabel setText:nil];
  [self.answerExcerptLabel setText:nil];
  [self.avatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMale50.png"]
                               forState:UIControlStateNormal];
  
}

+ (CGFloat)RowHeightWitObject:(id)object
{
  ZHFeedsObject *feedObject = (ZHFeedsObject *)object;
  
  NSString *title = feedObject.title;
  NSString *excerpt = feedObject.excerpt;
  
  if (title && excerpt) {
  CGSize titleSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:TITLELABELFONTSIZE]
                       constrainedToSize:CGSizeMake(CELLTITLELABELWIDTH, CELLTITLELABELHEIGHT)
                           lineBreakMode:NSLineBreakByTruncatingTail];
  
  CGSize excerptSize = [excerpt sizeWithFont:[UIFont systemFontOfSize:EXCERPTLABELFONTSIZE]
                           constrainedToSize:CGSizeMake(CELLEXCERPTLABELWIDTH, CELLEXCERPTLABELHEIGHT)
                               lineBreakMode:NSLineBreakByTruncatingTail];
  
  //15为第一行文字的高度
  CGFloat cellHeight = titleSize.height + excerptSize.height + CELLCONTENTMARGINTOTOP + 15 + MARGINBEWTEENTWOCONTENT  + MARGINBEWTEENTWOCONTENT + CELLCONTENTMARGINTOBOTTOM;

  return cellHeight;
  } else {
  	return 65;
  }
}

- (void)bindWithObject:(id)object
{
  [self clearCellContent];
  
  ZHFeedsObject *feedObject = (ZHFeedsObject *)object;
  NSString *excerpt = feedObject.excerpt;
  
  NSString *voteup_count = feedObject.voteup_count;
  
  NSString *title = feedObject.title;
  
  
	[self.actorsLabel setText:@"插门胡的小背心"];
  [self.feedLabel setText:@"关注了该问题"];
  [self.avatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMale50.png"]
                               forState:UIControlStateNormal];
  [self.avatarButton setImage:[UIImage imageNamed:@"ava.png"]
                     forState:UIControlStateNormal];
  [self.titleLabel setText:title];
  [self.voteupLabel setText:voteup_count];
  [self.answerExcerptLabel setText:excerpt];
}


- (void)layoutSubviews
{
	[super layoutSubviews];
  
  
  [self.actorsLabel sizeToFit];
  [self.feedLabel sizeToFit];
  [self.feedLabel setX:[self.actorsLabel right] + 5];
  
  [self.titleLabel setY:[self.feedLabel bottom] + MARGINBEWTEENTWOCONTENT];
  
  CGSize titleDefaultSize = CGSizeMake(CELLTITLELABELWIDTH, CELLTITLELABELHEIGHT);
  CGSize titleSize = [self.titleLabel.text CalculateTextSizeWith:self.titleLabel.font
                                                            Size:titleDefaultSize
                                                   LineBreakMode:self.titleLabel.lineBreakMode];
  
  [self.titleLabel setSize:titleSize];
  
  [self.voteupBackgroundView setY:[self.titleLabel bottom] + MARGINBEWTEENTWOCONTENT];
	[self.voteupLabel setSize:CGSizeMake([self.voteupBackgroundView width] - 1,
  [self.voteupBackgroundView height] - 1)];
  
  [self.answerExcerptLabel setOrigin:CGPointMake([self.voteupBackgroundView right] + 5, [self.voteupBackgroundView y] - 2)];
  
	CGSize excerptLabelDefultSize = CGSizeMake(CELLEXCERPTLABELWIDTH, CELLEXCERPTLABELHEIGHT);
  
  CGSize size = [self.answerExcerptLabel.text sizeWithFont:self.answerExcerptLabel.font
                                         constrainedToSize:excerptLabelDefultSize
                                            lineBreakMode:self.answerExcerptLabel.lineBreakMode];
  
  [self.answerExcerptLabel setSize:size];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
}

@end
