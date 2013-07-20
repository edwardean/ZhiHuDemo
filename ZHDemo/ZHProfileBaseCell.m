//
//  ZHProfileBase.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileBaseCell.h"

@implementation ZHProfileBaseCell

@synthesize cellType = cellType_;

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
  switch (cellType) {
    case CellBottom:
      
      break;
      
    case CellMiddle:
      
      break;
      
    case CellSingle:
      
      break;
      
    case CellTop:
      
      break;
      
    default:
      break;
  }
}

#pragma mark - seleted

// Do Seleted

#pragma mark - Bind Data

- (void)bindWithObject:(id)object
          withCellType:(ZHProfileCellPositionType)aCellType
{
  self.cellType = aCellType;
  
  [self bindWithObject:object];
}

@end
