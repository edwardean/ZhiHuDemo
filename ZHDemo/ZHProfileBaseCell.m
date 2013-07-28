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
    self.backgroundView.contentMode = UIViewContentModeScaleToFill;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.cellType = -1;
  }
  
  return self;
}

#pragma mark - Background

- (void)setCellType:(ZHProfileCellPositionType)cellType
{
  if (cellType_ != cellType) {
    
  UIImage *normalImage = nil;
  UIImage *highlightImage = nil;
  UIEdgeInsets insets = self.backgroundImageEdgeInsets;

  switch (cellType) {
    case CellBottom:
      
      normalImage = [[UIImage imageNamed:@"ZHCellBottomNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellBottomHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellMiddle:
      
      normalImage = [[UIImage imageNamed:@"ZHCellMiddleNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellMiddleHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellSingle:
      normalImage = [[UIImage imageNamed:@"ZHCellSingleNormal.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      highlightImage = [[UIImage imageNamed:@"ZHCellSingleHighlight.png"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
      break;
      
    case CellTop:
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
          withCellType:(ZHProfileCellPositionType)aCellType
{
  self.cellType = aCellType;
  
  [self bindWithObject:object];
}

- (void)bindCellTitle:(NSString *)title
               detail:(NSString *)detail
         withCellType:(ZHProfileCellPositionType)aCellType
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
