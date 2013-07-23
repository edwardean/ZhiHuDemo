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

@end

@implementation ZHProfileBaseCell

@synthesize cellType = cellType_;
@synthesize cellClass = cellClass_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

#pragma mark - Background

- (void)setCellType:(ZHProfileCellPositionType)cellType
{
  cellType_ = cellType;
  UIImageView *cellNormalBackgroundView = [[UIImageView alloc] init];
  UIImageView *cellSelectedBackgroundView = [[UIImageView alloc] init];
  switch (cellType) {
    case CellBottom:
      [cellNormalBackgroundView setImage:[UIImage imageNamed:@"ZHCellBottomNormal.png"]];
      [cellSelectedBackgroundView setImage:[UIImage imageNamed:@"ZHCellBottomHighlight.png"]];
      break;
      
    case CellMiddle:
      [cellNormalBackgroundView setImage:[UIImage imageNamed:@"ZHCellMiddleNormal.png"]];
      [cellSelectedBackgroundView setImage:[UIImage imageNamed:@"ZHCellMiddleHighlight.png"]];
      break;
      
    case CellSingle:
      [cellNormalBackgroundView setImage:[UIImage imageNamed:@"ZHCellSingleNormal.png"]];
      [cellSelectedBackgroundView setImage:[UIImage imageNamed:@"ZHCellSingleHighlight.png"]];
      break;
      
    case CellTop:
      [cellNormalBackgroundView setImage:[UIImage imageNamed:@"ZHCellTopNormal.png"]];
      [cellSelectedBackgroundView setImage:[UIImage imageNamed:@"ZHCellTopHighlight.png"]];
      break;
      
    default:
      break;
  }
  [self setBackgroundView:cellNormalBackgroundView];
  [self setSelectedBackgroundView:cellSelectedBackgroundView];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
  
  for (UIView *view in [self.contentView subviews])
  {
    if ([view isKindOfClass:[UILabel class]]) {
      if (highlighted) {
        [(UILabel *)view setTextColor:[UIColor whiteColor]];
      } else {
        [(UILabel *)view setTextColor:[UIColor blackColor]];
      }
      
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
  // SubClass will overwrite this method. Don't comment this
}


@end
