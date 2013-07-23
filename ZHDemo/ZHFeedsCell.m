//
//  ZHFeedsCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ZHFeedsCell.h"

//#if __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000
//#define LINEBREAKBYTRUNCATINGTAIL  UILineBreakModeTailTruncation
//#define TEXTALIGNMENTCENTER				 UITextAlignmentCenter
//#else
#define LINEBREAKBYTRUNCATINGTAIL  NSLineBreakByTruncatingTail
#define TEXTALIGNMENTCENTER				 NSTextAlignmentCenter
//#endif

// global
#define CELLCONTENTMARGINTOLEFT				10
#define CELLCONTENTMARGINTORIGHT			10
#define CELLCONTENTMARGINTOTOP				10
#define CELLCONTENTMARGINTOBOTTOM			10

// detail
#define MARGINBEWTEENTWOCONTENT				8			//每两个子视图间距都为10
#define ACTORSLABELFONTSIZE						13.0f
#define TITLELABELFONTSIZE						14.0f
#define EXCERPTLABELFONTSIZE					13.0f


#define ACTORSLABELHIGHLIGHTEDKEY		@"Actors"
@interface ZHFeedsCell ()
{
	BOOL isActorsLabelHighlighted;
}

@property (nonatomic, strong, readwrite) UILabel *actorsLabel;							//某某某
@property (nonatomic, strong, readwrite) UILabel *feedLabel;								//回答/赞同了该问题
@property (nonatomic, strong, readwrite) UIImageView *avatarImageView;	    //头像
@property (nonatomic, strong, readwrite) UILabel *titleLabel;								//标题
@property (nonatomic, strong, readwrite) UIImageView *voteupBackgroundView;	//标签背景
@property (nonatomic, strong, readwrite) UILabel *voteupLabel;							//标签
@property (nonatomic, strong, readwrite) UILabel *answerExcerptLabel;				//问题描述

@end

@implementation ZHFeedsCell
@synthesize actorsLabel = actorsLabel_;
@synthesize feedLabel = feedLabel_;
@synthesize avatarImageView = avatarImageView_;
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
    [self.contentView addSubview:actorsLabel_];
    
    
    self.feedLabel = [[UILabel alloc] init];
    [feedLabel_ setBackgroundColor:[UIColor clearColor]];
    [feedLabel_ setFont:[UIFont systemFontOfSize:ACTORSLABELFONTSIZE]];
    [feedLabel_ setTextColor:[UIColor colorWithWhite:0.684 alpha:1.000]];
    [feedLabel_ setY:CELLCONTENTMARGINTOTOP];
    [self.contentView addSubview:feedLabel_];
    
    
    self.avatarImageView = [[UIImageView alloc] init];
    [avatarImageView_ setOrigin:CGPointMake([self width] - CELLCONTENTMARGINTORIGHT - 25, CELLCONTENTMARGINTOTOP)];
    [avatarImageView_ setSize:CGSizeMake(25, 25)];
    [[avatarImageView_ layer] setCornerRadius:3.0f];
    [avatarImageView_ setClipsToBounds:YES];
    [self.contentView addSubview:avatarImageView_];
    
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


+ (CGFloat)RowHeightWitObject:(id)object
{
  NSLog(@"Object:%@",object);
	return 144.0f;
}

- (void)bindWithObject:(id)object
{
	[self.actorsLabel setText:@"插门胡的小背心"];
  [self.feedLabel setText:@"关注了该问题"];
  [self.avatarImageView setImage:[UIImage imageNamed:@"ava.png"]];
  [self.titleLabel setText:@"尚处在演进中的知乎 REST API，我们不需要关心实现细节，只需要关心接口的定义。"];
  [self.voteupLabel setText:@"69"];
  [self.answerExcerptLabel setText:@"GCD 可以使我们的多线程代码获得跨平台的多核 CPU 伸缩性，基于 block 的回调方式，方便立即可用线程安全串行、并行队列，等等，故一般不使用传统基于 POSIX thread API。"];
}


- (void)layoutSubviews
{
	[super layoutSubviews];
  
  
  [self.actorsLabel sizeToFit];
  [self.feedLabel sizeToFit];
  [self.feedLabel setX:[self.actorsLabel right] + 5];
  
  [self.titleLabel setY:[self.feedLabel bottom] + MARGINBEWTEENTWOCONTENT];
  
  CGFloat titleDefaultWidth = [self.avatarImageView left] - CELLCONTENTMARGINTOLEFT - 10;
  CGFloat titleDefaultHeight = 45;
  CGSize titleDefaultSize = CGSizeMake(titleDefaultWidth, titleDefaultHeight);
  CGSize titleSize = [self.titleLabel.text CalculateTextSizeWith:self.titleLabel.font
                                                            Size:titleDefaultSize
                                                   LineBreakMode:self.titleLabel.lineBreakMode];
  
  [self.titleLabel setSize:titleSize];
  
  [self.voteupBackgroundView setY:[self.titleLabel bottom] + MARGINBEWTEENTWOCONTENT];
	[self.voteupLabel setSize:CGSizeMake([self.voteupBackgroundView width] - 1,
  [self.voteupBackgroundView height] - 1)];
  
  [self.answerExcerptLabel setOrigin:CGPointMake([self.voteupBackgroundView right] + 5, [self.voteupBackgroundView y])];
  CGFloat excerptLabelDefultWidth = [self width] - [self.voteupBackgroundView right] - 5 - CELLCONTENTMARGINTORIGHT;
	CGSize excerptLabelDefultSize = CGSizeMake(excerptLabelDefultWidth, 55);
  
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
