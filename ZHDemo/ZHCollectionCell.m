//
//  ZHCollectionCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+RounedImage.h"
#import "ZHCollectionObject.h"
#import <QuartzCore/QuartzCore.h>
#import "ZHCollectionCell.h"

#define ZHCOLLECTIONCELLDEFAULTCELLHEIGHT												95

#define ZHCOLLECTIONCELLCONTENTLEFTMARGIN												10
#define ZHCOLLECTIONCELLCONTENTTOPMARGIN												15

// Des
#define ZHCOLLECTIONCELLDESCONTENTTOTITLEMARGIN									10
#define ZHCOLLECTIONCELLDESCONTENTTORIGHTMARGIN									25
#define ZHCOLLECTIONCELLDESCONTENTTOUNDERLINEMARGIN							10

// Bottom Content
#define ZHCOLLECTIONCELLBOTTOMCONTENTTOUNDERLINEMARGIN					10
#define ZHCOLLECTIONCELLBOTTOMCONTENTAVATARTONAMEMARGIN					10
#define ZHCOLLECTIONCELLBOTTOMCONTENTANSWERMAXWIDTH							70
#define ZHCOLLECTIONCELLBOTTOMCONTENTANSWERTORIGHTMARGIN	  		10
#define ZHCOLLECTIONCELLBOTTOMCONTENTTOBOTTOM								 	  10


#define ZHCOLLECTIONCELLDESLABELFONTSIZE												15.0f
#define ZHCOLLECTIONCELLDESLABELWIDTH														270.0f


@interface ZHCollectionCell ()
{
	CGFloat answerLabelOriginX_;
}

@property (nonatomic) UILabel *collectionCellTitleLabel;
@property (nonatomic) UILabel *collectionCellDesLabel;
@property (nonatomic) UIButton *collectionCellAvatarButton;
@property (nonatomic) UILabel *collectionCellNameLabel;
@property (nonatomic) UILabel *collectionCellAnswersLabel;

@property (nonatomic) UIImageView *temporaryImageView;

@end

@implementation ZHCollectionCell

@synthesize collectionCellTitleLabel = collectionCellTitleLabel_;
@synthesize collectionCellDesLabel = collectionCellDesLabel_;
@synthesize collectionCellAvatarButton = collectionCellAvatarButton_;
@synthesize collectionCellNameLabel = collectionCellNameLabel_;
@synthesize collectionCellAnswersLabel = collectionCellAnswersLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style
		reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    if (!collectionCellTitleLabel_) {
      self.collectionCellTitleLabel = [[UILabel alloc] init];
      [collectionCellTitleLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [collectionCellTitleLabel_ setNumberOfLines:1];
      [collectionCellTitleLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
      [collectionCellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
      [self.contentView addSubview:collectionCellTitleLabel_];
    }
    
    if (!collectionCellDesLabel_) {
      self.collectionCellDesLabel = [[UILabel alloc] init];
      [collectionCellDesLabel_ setFont:[UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE]];
      [collectionCellDesLabel_ setTextColor:[UIColor lightGrayColor]];
      [collectionCellDesLabel_ setNumberOfLines:0];
      [collectionCellDesLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
      [collectionCellDesLabel_ setBackgroundColor:[UIColor clearColor]];
      [self.contentView addSubview:collectionCellDesLabel_];
    }
    
    if (!collectionCellAvatarButton_) {
      self.collectionCellAvatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [collectionCellAvatarButton_ setSize:CGSizeMake(20, 20)];
      [collectionCellAvatarButton_ setImage:[UIImage imageNamed:@"ZHDMViewInputBox.png"]
                                   forState:UIControlStateNormal];
      [collectionCellAvatarButton_.layer setCornerRadius:3.0f];
      [self.contentView addSubview:collectionCellAvatarButton_];
      
      // Add Button Event here...
      //[collectionCellAvatarButton_ addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!collectionCellNameLabel_) {
      self.collectionCellNameLabel = [[UILabel alloc] init];
      [collectionCellNameLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
      [collectionCellNameLabel_ setBackgroundColor:[UIColor clearColor]];
      [self.contentView addSubview:collectionCellNameLabel_];
    }
    
    if (!collectionCellAnswersLabel_) {
      self.collectionCellAnswersLabel = [[UILabel alloc] init];
      [collectionCellAnswersLabel_ setFont:[UIFont boldSystemFontOfSize:11.0f]];
      [collectionCellAnswersLabel_ setTextColor:[UIColor grayColor]];
      [collectionCellAnswersLabel_ setTextAlignment:NSTextAlignmentRight];
      [collectionCellAnswersLabel_ setBackgroundColor:[UIColor clearColor]];
      [self.contentView addSubview:collectionCellAnswersLabel_];
    }
    
    answerLabelOriginX_ = self.width - ZHCOLLECTIONCELLBOTTOMCONTENTANSWERMAXWIDTH - ZHCOLLECTIONCELLBOTTOMCONTENTANSWERTORIGHTMARGIN;
 		self.temporaryImageView = [[UIImageView alloc] init];
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
	[self.collectionCellTitleLabel setText:nil];
  [self.collectionCellDesLabel setText:nil];
  [self.collectionCellNameLabel setText:nil];
  [self.collectionCellAnswersLabel setText:nil];
  
}

- (void)bindWithObject:(id)object
{
  [self clearCellContent];
  
	ZHCollectionObject *collectionObject = (ZHCollectionObject *)object;
  NSString *title = collectionObject.title;
  NSString *description = collectionObject.des;
  NSString *name = collectionObject.name;
  NSString *avatar_url = collectionObject.avatar_url;
  NSString *answer_count = collectionObject.answer_count;
  
  [self.collectionCellTitleLabel setText:title];
  [self.collectionCellDesLabel setText:description];
  [self.collectionCellNameLabel setText:name];
  [self.collectionCellAnswersLabel setText:[NSString
                                            stringWithFormat:@"%@ 个问答",answer_count]];
  
  // Downloading Avatar Image Using 'avatar_url' here ...
  if (avatar_url) {
    __block typeof(self) weakself = self;
    UIImageView *avatarImage = weakself.temporaryImageView;
    [avatarImage setImageWithURL:[NSURL URLWithString:avatar_url]
                placeholderImage:nil
                         options:SDWebImageProgressiveDownload
                         success:^(UIImage *image) {
                           
                           image = [image makeRoundedImage:image radius:3.0f];
                           [weakself.collectionCellAvatarButton setImage:image forState:UIControlStateNormal];
                         }
                         failure:^(NSError *error) {
                           
                         }];
  }
  
  [self.collectionCellTitleLabel sizeToFit];
  [self.collectionCellDesLabel sizeToFit];
  [self.collectionCellNameLabel sizeToFit];
  [self.collectionCellAnswersLabel sizeToFit];
  
  [self layoutIfNeeded];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout title label
  [self.collectionCellTitleLabel setOrigin:CGPointMake(ZHCOLLECTIONCELLCONTENTLEFTMARGIN, ZHCOLLECTIONCELLCONTENTTOPMARGIN)];
  
  // Layout des label
	CGFloat desLabelOriginY = [collectionCellTitleLabel_ bottom] + ZHCOLLECTIONCELLDESCONTENTTOTITLEMARGIN;
  [self.collectionCellDesLabel setOrigin:CGPointMake(ZHCOLLECTIONCELLCONTENTLEFTMARGIN, desLabelOriginY)];
  [self.collectionCellDesLabel setSize:CalculateTextSize(self.collectionCellDesLabel.text,
                                                         [UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE],
                                                         ZHCOLLECTIONCELLDESLABELWIDTH,
                                                         MAXFLOAT,
                                                         NSLineBreakByWordWrapping)];
  
  // Layout Bottom contents
  CGFloat bottomContentOriginY = [self.collectionCellDesLabel bottom] + ZHCOLLECTIONCELLDESCONTENTTOUNDERLINEMARGIN + ZHCOLLECTIONCELLBOTTOMCONTENTTOUNDERLINEMARGIN;
  [self.collectionCellAvatarButton setOrigin:CGPointMake(ZHCOLLECTIONCELLCONTENTLEFTMARGIN, bottomContentOriginY)];
  
  CGFloat nameLabelOriginX = [self.collectionCellAvatarButton right] + ZHCOLLECTIONCELLBOTTOMCONTENTAVATARTONAMEMARGIN;
  [self.collectionCellNameLabel setOrigin:CGPointMake(nameLabelOriginX,bottomContentOriginY)];
  
  
  [self.collectionCellAnswersLabel setOrigin:CGPointMake(answerLabelOriginX_, bottomContentOriginY)];
  
}

+ (CGFloat)RowHeightWitObject:(id)object
{
  ZHCollectionObject *collectionObject = (ZHCollectionObject *)object;
  NSString *des = collectionObject.des;
  if ([des isEqualToString:@""] || !des) {
    return ZHCOLLECTIONCELLDEFAULTCELLHEIGHT;
  }
  
  CGFloat rowHeight = CalculateTextSize(des,
                                        [UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE],
                                        ZHCOLLECTIONCELLDESLABELWIDTH,
                                        MAXFLOAT,
                                        NSLineBreakByWordWrapping).height + ZHCOLLECTIONCELLDEFAULTCELLHEIGHT;
  return rowHeight;
}

@end
