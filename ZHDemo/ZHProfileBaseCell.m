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

@property (nonatomic, strong, readwrite) UIImageView *cellNormalBackgroundView;
@property (nonatomic, strong, readwrite) UIImageView *cellSelectedBackgroundView;

@end

@implementation ZHProfileBaseCell

@synthesize cellType = cellType_;
@synthesize cellClass = cellClass_;
@synthesize cellNormalBackgroundView = cellNormalBackgroundView_;
@synthesize cellSelectedBackgroundView = cellSelectedBackgroundView_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
  if (self) {

  }
  
  return self;
}

#pragma mark - Background

- (void)setCellType:(ZHProfileCellPositionType)cellType
{
  cellType_ = cellType;
  CGRect rect = CGRectMake(0, 0, 320, self.frame.size.height);
  self.bounds = rect;
  self.cellNormalBackgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
  self.cellSelectedBackgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
  [cellNormalBackgroundView_ setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
  [cellSelectedBackgroundView_ setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
  switch (cellType) {
    case CellBottom:
      [cellNormalBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellBottomNormal.png"]];
      [cellSelectedBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellBottomHighlight.png"]];
      break;
      
    case CellMiddle:
      [cellNormalBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellMiddleNormal.png"]];
      [cellSelectedBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellMiddleHighlight.png"]];
      break;
      
    case CellSingle:
      [cellNormalBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellSingleNormal.png"]];
      [cellSelectedBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellSingleHighlight.png"]];
      break;
      
    case CellTop:
      [cellNormalBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellTopNormal.png"]];
      [cellSelectedBackgroundView_ setImage:[UIImage imageNamed:@"ZHCellTopHighlight.png"]];
      break;
      
    default:
      break;
  }
  [self setBackgroundView:nil];
  [self setSelectedBackgroundView:nil];
  [self setBackgroundView:cellNormalBackgroundView_];
  [self setSelectedBackgroundView:cellSelectedBackgroundView_];
  
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
  
  for (UIView *view in [self.contentView subviews])
  {
    if ([view isKindOfClass:[UILabel class]]) {
      if (highlighted) {
        [(UILabel *)view setTextColor:[UIColor colorWithRed:0.991 green:0.990 blue:1.000 alpha:1.000]];
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

- (void)layoutSubviews
{
	[super layoutSubviews];
}

@end
