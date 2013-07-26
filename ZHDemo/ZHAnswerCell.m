//
//  ZHAnswerCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-13.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/SDWebImageManager.h>
#import "UIImage+RounedImage.h"
#import "UIView+Frame.h"
#import "ZHAnswerCell.h"
#import "ZHAnswerObject.h"

#define ZHANSWERCELLCONTENTMARGINTOTOPSIDE									20
#define ZHANSWERCELLCONTENTMARGINTOLEFTSIDE									20
#define ZHANSWERCELLTITLETOLINEMARGIN												10

#define ZHANSWERCELLBOTTOMCONTENTORIGINTOLINE								15
#define ZHANSWERCELLAVATARTOTAGMARGIN												5

#define ZHANSWERCELLAVATARTOEXCERPTMARGIN										10
#define ZHANSWERCELLAVATARWIDTH															25
#define ZHANSWERCELLAVATARHEIGHT														26
#define ZHANSWERCELLTAGWIDTH																25
#define ZHANSWERCELLTAGHEIGHT																15

#define ZHANSWERCELLTITLELABELWIDTH													250
#define ZHANSWERCELLEXCERPTLABELWIDTH												235

#define ZHANSWERCELLTITLELABELMAXHEIGHT											44
#define ZHANSWERCELLEXCERPTLABELMAXHEIGHT										60

#define ZHANSWERCELLTAGLABELTOBOTTOMMARGIN									20
#define ZHANSWERCELLEXCERPTLABELTOBOTTOMMARGIN							15

#define ZHANSWERCELLARROWBUTTONTORIGHTSIDEMARGIN						10

#define ZHANSWERCELLANSWEREXCERPTLABELFONTSIZE              14.0f
#define ZHANSWERCELLANSWERTITLELABELFONT                    15.0f


#define ZHANSWERCELLANSWERCELLMAXHEIGHT											140.0f

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
    
    self.backgroundView = [[UIImageView alloc]
                           initWithImage:[[UIImage
                                           imageNamed:@"ZHExploreListItemBase.png"]
                                          resizableImageWithCapInsets:UIEdgeInsetsMake(15,
                                                                                       16,
                                                                                       7,
                                                                                       16)]];
    
    
    // answerTitleLabel
    self.answerTitleLabel = [[UILabel alloc] init];
    [answerTitleLabel_ setFont:[UIFont boldSystemFontOfSize:ZHANSWERCELLANSWERTITLELABELFONT]];
    [answerTitleLabel_ setNumberOfLines:0];
    [answerTitleLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [answerTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [answerTitleLabel_ setOrigin:CGPointMake(ZHANSWERCELLCONTENTMARGINTOLEFTSIDE,
                                             ZHANSWERCELLCONTENTMARGINTOTOPSIDE)];
    [self.contentView addSubview:answerTitleLabel_];
    
    // answerArrowListButton
    self.answerArrowListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [answerArrowListButton_ setSize:CGSizeMake(10, 14)];
    [answerArrowListButton_ setImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]
                            forState:UIControlStateNormal];
    [self.contentView addSubview:answerArrowListButton_];
    
    // avatarButton
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [avatarButton_ setSize:CGSizeMake(ZHANSWERCELLAVATARWIDTH,
                                      ZHANSWERCELLAVATARHEIGHT)];
    [avatarButton_.layer setCornerRadius:3.0f];
    [avatarButton_ setClipsToBounds:YES];
    [avatarButton_ setX:ZHANSWERCELLCONTENTMARGINTOLEFTSIDE];
    [self.contentView addSubview:avatarButton_];
    
    // voteupBackgroundView
    self.voteupBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              25,
                                                                              15)];
    [voteupBackgroundView_ setImage:[UIImage
                                     imageNamed:@"ZHQuestionViewAnswerVotedBase.png"]];
    [voteupBackgroundView_ setX:ZHANSWERCELLCONTENTMARGINTOLEFTSIDE];
    [voteupBackgroundView_ setSize:CGSizeMake(ZHANSWERCELLTAGWIDTH,
                                              ZHANSWERCELLTAGHEIGHT)];
    [self.voteupBackgroundView.layer setCornerRadius:3.0f];
    [self.contentView addSubview:voteupBackgroundView_];
    
    // voteupLabel
    self.voteupLabel = [[UILabel alloc] init];
    [voteupLabel_ setTextColor:[UIColor whiteColor]];
    [voteupLabel_ setFont:[UIFont systemFontOfSize:11.0f]];
    [voteupLabel_ setTextAlignment:NSTextAlignmentCenter];
    [voteupLabel_ setAdjustsFontSizeToFitWidth:YES];
    [voteupLabel_ setBackgroundColor:[UIColor clearColor]];
    if (voteupBackgroundView_) {
      [voteupBackgroundView_ addSubview:voteupLabel_];
    }
    
    // answerExcerptLabel
    self.answerExcerptLabel = [[UILabel alloc] init];
    [answerExcerptLabel_ setFont:[UIFont systemFontOfSize:ZHANSWERCELLANSWEREXCERPTLABELFONTSIZE]];
    [answerExcerptLabel_ setNumberOfLines:0];
    [answerExcerptLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [answerExcerptLabel_ setTextColor:[UIColor colorWithWhite:0.337 alpha:1.000]];
    [answerExcerptLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:answerExcerptLabel_];
    
    
    self.temporaryImageView = [[UIImageView alloc] init];
    
    // answerSeparateLine
    self.answerSeparateLine = [[UIImageView alloc]
                               initWithFrame:CGRectMake(9.5, 0, 301, 1)];
    [answerSeparateLine_ setImage:[UIImage imageNamed:@"ZHAnswerViewTopBarShadow.png"]];
    
    [self.backgroundView addSubview:self.answerSeparateLine];
    
  }
  return self;
}

- (void)prepareForReuse
{
	[super prepareForReuse];
  
  [self.answerTitleLabel setText:nil];
  [self.avatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMaskS.png"]
                               forState:UIControlStateNormal];
  
  [self.voteupLabel setText:@"0"];
  [self.answerExcerptLabel setText:nil];
}

+ (CGFloat)RowHeightWitObject:(id)object
{
  ZHAnswerObject *answerObject = (ZHAnswerObject *)object;
  CGSize titleSize = CGSizeZero;
  CGSize excerptSize = CGSizeZero;
  
  if (answerObject.title) {
    titleSize = [answerObject.title CalculateTextSizeWith:[UIFont boldSystemFontOfSize:ZHANSWERCELLANSWERTITLELABELFONT]
                                                     Size:CGSizeMake(ZHANSWERCELLTITLELABELWIDTH, ZHANSWERCELLTITLELABELMAXHEIGHT)
                                            LineBreakMode:NSLineBreakByTruncatingTail];
  }
  
  if (answerObject.excerpt) {
    excerptSize = [answerObject.excerpt CalculateTextSizeWith:[UIFont systemFontOfSize:ZHANSWERCELLANSWEREXCERPTLABELFONTSIZE]
                                                         Size:CGSizeMake(ZHANSWERCELLEXCERPTLABELWIDTH, ZHANSWERCELLEXCERPTLABELMAXHEIGHT)
                                                LineBreakMode:NSLineBreakByTruncatingTail];
  }
  
  CGFloat cellHeight = titleSize.height + excerptSize.height + ZHANSWERCELLCONTENTMARGINTOTOPSIDE + ZHANSWERCELLTITLETOLINEMARGIN + ZHANSWERCELLBOTTOMCONTENTORIGINTOLINE + ZHANSWERCELLEXCERPTLABELTOBOTTOMMARGIN;
  
  
  CGFloat avatarAndTagHeight = ZHANSWERCELLAVATARHEIGHT + ZHANSWERCELLTAGHEIGHT + ZHANSWERCELLAVATARTOTAGMARGIN;
  if (excerptSize.height < avatarAndTagHeight) {
    cellHeight = titleSize.height + ZHANSWERCELLCONTENTMARGINTOTOPSIDE + ZHANSWERCELLTITLETOLINEMARGIN + ZHANSWERCELLBOTTOMCONTENTORIGINTOLINE + avatarAndTagHeight + ZHANSWERCELLTAGLABELTOBOTTOMMARGIN;
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
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadWithURL:[NSURL URLWithString:answerObject.avatar_url]
                    delegate:self
                     options:0
                     success:^(UIImage *image) {
                       [weakself.avatarButton
                        setImage:image
                        forState:UIControlStateNormal];
                     }
                     failure:^(NSError *error) {
                       [weakself.avatarButton
                        setImage:[UIImage imageNamed:@"AvatarMale50.png"]
                        forState:UIControlStateNormal];
                       
                     }];
    
  }
  
  if (answerObject.voteup_count) {
    [self.voteupLabel setText:answerObject.voteup_count];
  }
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout Subviews
  
  // Layout TitleLabel
	CGSize answerTitleSize = [self.answerTitleLabel.text CalculateTextSizeWith:[UIFont boldSystemFontOfSize:ZHANSWERCELLANSWERTITLELABELFONT]
                                                                        Size:CGSizeMake(ZHANSWERCELLTITLELABELWIDTH, ZHANSWERCELLTITLELABELMAXHEIGHT)
                                                               LineBreakMode:self.answerTitleLabel.lineBreakMode];
  
  [self.answerTitleLabel setSize:answerTitleSize];
  
  // Layout Arrow Button
  [self.answerArrowListButton setX:[self width] - 35];
  [self.answerArrowListButton setCenterY:[self.answerTitleLabel centerY]];
  
  // Layout Line
  CGFloat  lineOriginY = [self.answerTitleLabel bottom] + ZHANSWERCELLTITLETOLINEMARGIN;
  [self.answerSeparateLine setY:lineOriginY];
  
  // Layout Bottom Content
  // Layout Avatar
  CGFloat avatarOriginY = [self.answerSeparateLine bottom] + ZHANSWERCELLBOTTOMCONTENTORIGINTOLINE;
  [self.avatarButton setY:avatarOriginY];
  
  // Layout TagBackgroundView
  CGFloat tagViewOriginY = [self.avatarButton bottom] + ZHANSWERCELLAVATARTOTAGMARGIN;
  [self.voteupBackgroundView setY:tagViewOriginY];
  
  // Layout TagLabel
  [self.voteupLabel setSize:CGSizeMake([self.voteupBackgroundView width] - 1,
                                       [self.voteupBackgroundView height] - 1)];
  
  // Layout Excerpt Label
  CGFloat excerptLabelOriginX = [self.avatarButton right] + ZHANSWERCELLAVATARTOEXCERPTMARGIN;
  CGFloat excerptLabelOriginY = [self.avatarButton y];
  
  CGSize excerptSize = [self.answerExcerptLabel.text CalculateTextSizeWith:[UIFont systemFontOfSize:ZHANSWERCELLANSWEREXCERPTLABELFONTSIZE]
                                                                      Size:CGSizeMake(ZHANSWERCELLEXCERPTLABELWIDTH, ZHANSWERCELLEXCERPTLABELMAXHEIGHT)
                                                             LineBreakMode:self.answerExcerptLabel.lineBreakMode];
  
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
