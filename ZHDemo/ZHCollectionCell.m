//
//  ZHCollectionCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "UIImage+RounedImage.h"
#import "ZHCollectionObject.h"
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/SDWebImageManager.h>
#import "ZHCollectionCell.h"
#import "ZHUserInfoViewController.h"

#define ZHCOLLECTIONCELLDEFAULTCELLHEIGHT												95

#define ZHCOLLECTIONCELLCONTENTLEFTMARGIN												20
#define ZHCOLLECTIONCELLCONTENTTOPMARGIN												15

// Des
#define ZHCOLLECTIONCELLDESCONTENTTOTITLEMARGIN									15
#define ZHCOLLECTIONCELLDESCONTENTTORIGHTMARGIN									25
#define ZHCOLLECTIONCELLDESCONTENTTOUNDERLINEMARGIN							5

// Bottom Content
#define ZHCOLLECTIONCELLBOTTOMCONTENTTOUNDERLINEMARGIN					28
#define ZHCOLLECTIONCELLBOTTOMCONTENTAVATARTONAMEMARGIN					10
#define ZHCOLLECTIONCELLBOTTOMCONTENTANSWERMAXWIDTH							70
#define ZHCOLLECTIONCELLBOTTOMCONTENTANSWERTORIGHTMARGIN	  		10
#define ZHCOLLECTIONCELLBOTTOMCONTENTTOBOTTOM								 	  10

#define ZHCOLLECTIONCELLTITLELABELFONTSIZE											15.0f
#define ZHCOLLECTIONCELLDESLABELFONTSIZE												15.0f
#define ZHCOLLECTIONCELLDESLABELWIDTH														270.0f


#define TITLEHEIGHT												44
#define TITLEWIDTH												250

@interface ZHCollectionCell ()
{
	CGFloat answerLabelOriginX_;
}
@property (nonatomic) UIImageView *cellBackgroundView;
@property (nonatomic) UILabel *collectionCellTitleLabel;
@property (nonatomic) UILabel *collectionCellDesLabel;
@property (nonatomic) UIButton *collectionCellAvatarButton;
@property (nonatomic) UILabel *collectionCellNameLabel;
@property (nonatomic) UILabel *collectionCellAnswersLabel;

@property (nonatomic) UIImageView *temporaryImageView;

@end

@implementation ZHCollectionCell

@synthesize cellBackgroundView = cellBackgroundView_;
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
    
    self.backgroundView = [[UIImageView alloc]
                           initWithImage:[[UIImage
                                           imageNamed:@"ZHExploreFavBase.png"]
                                          stretchableImageWithLeftCapWidth:28
                                          topCapHeight:28]];
    
    // collectionCellTitleLabel
    self.collectionCellTitleLabel = [[UILabel alloc] init];
    [collectionCellTitleLabel_ setFont:[UIFont boldSystemFontOfSize:ZHCOLLECTIONCELLTITLELABELFONTSIZE]];
    [collectionCellTitleLabel_ setNumberOfLines:0];
    [collectionCellTitleLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [collectionCellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:collectionCellTitleLabel_];
    [self.collectionCellTitleLabel setOrigin:CGPointMake(ZHCOLLECTIONCELLCONTENTLEFTMARGIN, ZHCOLLECTIONCELLCONTENTTOPMARGIN)];
    
    // collectionCellDesLabel
    self.collectionCellDesLabel = [[UILabel alloc] init];
    [collectionCellDesLabel_ setFont:[UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE]];
    [collectionCellDesLabel_ setTextColor:[UIColor lightGrayColor]];
    [collectionCellDesLabel_ setNumberOfLines:0];
    [collectionCellDesLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
    [collectionCellDesLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:collectionCellDesLabel_];
    
    // collectionCellAvatarButton
    self.collectionCellAvatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [collectionCellAvatarButton_ setSize:CGSizeMake(20, 20)];
    [collectionCellAvatarButton_.layer setCornerRadius:3.0f];
    [collectionCellAvatarButton_ setClipsToBounds:YES];
    [collectionCellAvatarButton_ setBackgroundImage:[UIImage imageNamed:@"ZHDMViewInputBox.png"]
                                           forState:UIControlStateNormal];
    [self.contentView addSubview:collectionCellAvatarButton_];
    // Add Button Event here...
    [collectionCellAvatarButton_ addTarget:self action:@selector(buttonTapped:)
                          forControlEvents:UIControlEventTouchUpInside];
    
    
    // collectionCellNameLabel
    self.collectionCellNameLabel = [[UILabel alloc] init];
    [collectionCellNameLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [collectionCellNameLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:collectionCellNameLabel_];
    
    // collectionCellAnswersLabel
    self.collectionCellAnswersLabel = [[UILabel alloc] init];
    [collectionCellAnswersLabel_ setFont:[UIFont boldSystemFontOfSize:11.0f]];
    [collectionCellAnswersLabel_ setTextColor:[UIColor grayColor]];
    [collectionCellAnswersLabel_ setTextAlignment:NSTextAlignmentRight];
    [collectionCellAnswersLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:collectionCellAnswersLabel_];
    
    answerLabelOriginX_ = self.width - ZHCOLLECTIONCELLBOTTOMCONTENTANSWERMAXWIDTH - ZHCOLLECTIONCELLBOTTOMCONTENTANSWERTORIGHTMARGIN;
 		self.temporaryImageView = [[UIImageView alloc] init];
  
  }
  return self;
}

- (void)prepareForReuse
{
	[super prepareForReuse];
  
  [self.collectionCellTitleLabel setText:nil];
  [self.collectionCellDesLabel setText:nil];
  [self.collectionCellNameLabel setText:nil];
  [self.collectionCellAnswersLabel setText:nil];
}

- (void)buttonTapped:(id)sender
{
	NSLog(@"%s",__func__);
}

- (void)bindWithObject:(id)object
{
  
	ZHCollectionObject *collectionObject = (ZHCollectionObject *)object;
  NSString *title = collectionObject.title;
  NSString *description = collectionObject.des;
  NSString *name = collectionObject.name;
  NSString *avatar_url = collectionObject.avatarURL;
  NSString *answer_count = collectionObject.answerCOUNT;
  
  [self.collectionCellTitleLabel setText:title];
  [self.collectionCellDesLabel setText:description];
  [self.collectionCellNameLabel setText:name];
  [self.collectionCellAnswersLabel setText:[NSString
                                            stringWithFormat:@"%@ 个问答",answer_count]];
  
  // Downloading Avatar Image Using 'avatar_url' here ...
  if (avatar_url) {
    __block typeof(self) weakself = self;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadWithURL:[NSURL URLWithString:avatar_url]
                    delegate:self
                     options:0
                     success:^(UIImage *image) {
                       [weakself.collectionCellAvatarButton
                        setImage:image
                        forState:UIControlStateNormal];
                     }
                     failure:^(NSError *error) {
                       [weakself.collectionCellAvatarButton
                        setImage:[UIImage imageNamed:@"AvatarMale68.png"]
                        forState:UIControlStateNormal];
                     }];
    
  }
  
  [self.collectionCellNameLabel sizeToFit];
  [self.collectionCellAnswersLabel sizeToFit];
  
  [self layoutIfNeeded];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout title label
  CGSize titleSize = [self.collectionCellTitleLabel.text
                      CalculateTextSizeWith:self.collectionCellTitleLabel.font
                      Size:CGSizeMake(TITLEWIDTH, TITLEHEIGHT)
                      LineBreakMode:self.collectionCellTitleLabel.lineBreakMode];
  [self.collectionCellTitleLabel setSize:titleSize];
  
  // Layout des label
	CGFloat desLabelOriginY = [self.collectionCellTitleLabel bottom] + ZHCOLLECTIONCELLDESCONTENTTOTITLEMARGIN;
  [self.collectionCellDesLabel setOrigin:CGPointMake(ZHCOLLECTIONCELLCONTENTLEFTMARGIN, desLabelOriginY)];
  
  CGSize desLabelSize = [self.collectionCellDesLabel.text
                         CalculateTextSizeWith:[UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE]
                         Size:CGSizeMake(ZHCOLLECTIONCELLDESLABELWIDTH, MAXFLOAT)
                         LineBreakMode:self.collectionCellDesLabel.lineBreakMode];
  [self.collectionCellDesLabel setSize:desLabelSize];
  
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
  NSString *des = @"";
  NSString *title = @"";
  if (collectionObject.des) {
    des = collectionObject.des;
  }
  if (collectionObject.title) {
    title = collectionObject.title;
  }
  
  CGFloat titleHeight = [title CalculateTextSizeWith:[UIFont boldSystemFontOfSize:ZHCOLLECTIONCELLTITLELABELFONTSIZE]
                                                Size:CGSizeMake(TITLEWIDTH, TITLEHEIGHT)
                                       LineBreakMode:NSLineBreakByTruncatingTail].height;
  
  CGFloat rowHeight = [des CalculateTextSizeWith:[UIFont systemFontOfSize:ZHCOLLECTIONCELLDESLABELFONTSIZE]
                                            Size:CGSizeMake(ZHCOLLECTIONCELLDESLABELWIDTH, MAXFLOAT)
                                   LineBreakMode:NSLineBreakByWordWrapping].height + titleHeight+ ZHCOLLECTIONCELLDEFAULTCELLHEIGHT;
  return rowHeight;
}

@end
