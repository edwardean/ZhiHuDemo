//
//  ZHProfileBase.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileBaseCell.h"
#import "ZHUserInfoViewController.h"
#import "ZHProfileNormalStyleCell.h"
#import "ZHUserProfileWeiboStyleCell.h"
#import "ZHProfileCollectionStyleCell.h"
#import "ZHUserProfileWeiboStyleCell.h"
#import "ZHProfileBlacklistStyleCell.h"


@interface ZHProfileBaseCell ()

@property (nonatomic) Class cellClass;

@property (nonatomic) UIEdgeInsets backgroundImageEdgeInsets;

@end

@implementation ZHProfileBaseCell

@synthesize cellType = cellType_;
@synthesize cellClass = cellClass_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
  if (self) {
    self.backgroundImageEdgeInsets = UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0);
    self.backgroundView = [[UIImageView alloc] initWithImage:nil highlightedImage:nil];
    self.contentMode = UIViewContentModeScaleToFill;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.cellType = CellPositionUnknow;
  }
  
  return self;
}

#pragma mark - Background
//我去年买了个表，因为提供的Cell背景图片左右两边各有10个像素的透明像素，
//所以导致cell背景显示时不能显示原有的长度，这个bug望后人修复

- (void)setCellType:(ZHCellPositionType)cellType
{
  if (cellType_ != cellType) {
    
  UIImage *normalImage = nil;
  UIImage *highlightImage = nil;
  UIEdgeInsets insets = self.backgroundImageEdgeInsets;

  switch (cellType) {
    case CellPositionBottom:
      
      normalImage = [[UIImage imageNamed:@"ZHCellBottomNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellBottomHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellPositionMiddle:
      
      normalImage = [[UIImage imageNamed:@"ZHCellMiddleNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellMiddleHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellPositionSingle:
      normalImage = [[UIImage imageNamed:@"ZHCellSingleNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellSingleHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellPositionTop:
      normalImage = [[UIImage imageNamed:@"ZHCellTopNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellTopHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    default:
      break;
  }

  [(UIImageView *)[self backgroundView] setImage:normalImage];
  [(UIImageView *)[self backgroundView] setHighlightedImage:highlightImage];

  cellType_ = cellType;
    
  }
  
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
  
  [(UIImageView *)self.backgroundView setHighlighted:highlighted];
  
  [(UIImageView *)self.accessoryView setHighlighted:highlighted];
  
  for (UIView *view in [self.contentView subviews])
  {
    if ([view isKindOfClass:[UILabel class]]) {
      UILabel *label = (UILabel *)view;
      label.textColor = highlighted ? [UIColor whiteColor] : [UIColor blackColor];
      
      label.shadowOffset = highlighted ? CGSizeMake(0, -1.0) : CGSizeZero;
      label.shadowColor = highlighted ? [UIColor grayColor] : [UIColor clearColor];
      
    }
  }
  
}


#pragma mark - seleted

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];
}


#pragma mark - Bind Data

- (void)bindWithObject:(id)object
          withCellType:(ZHCellPositionType)aCellType
{
  self.cellType = aCellType;
  
  [self bindWithObject:object];
}

- (void)bindCellTitle:(NSString *)title
               detail:(NSString *)detail
         withCellType:(ZHCellPositionType)aCellType
{
  self.cellType = aCellType;
  
  [self bindCellTitle:title detail:detail];
}

- (void)bindCellTitle:(NSString *)title
               detail:(NSString *)detail
{
  // SubClass will overwrite this method. Don't comment me
}

- (void)layoutSubviews
{
	[super layoutSubviews];
}

@end
