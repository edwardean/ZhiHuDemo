//
//  ZHUserInfoCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-19.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoCell.h"
#import <UIKit/UITableView.h>

@interface ZHUserInfoCell ()

@end

@implementation ZHUserInfoCell
@synthesize titleLabel = titleLabel_;
@synthesize countLabel = countLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.titleLabel = [[UILabel alloc] init];
    [titleLabel_ setFont:[UIFont systemFontOfSize:13.0]];
    [titleLabel_ setCenterY:self.centerY - 8];
    [titleLabel_ setX:10];
    [titleLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:titleLabel_];
    
    self.countLabel = [[UILabel alloc] init];
    [countLabel_ setFont:[UIFont systemFontOfSize:13.0f]];
    [countLabel_ setCenterY:self.centerY - 8];
    [countLabel_ setX:245];
    [countLabel_ setSize:CGSizeMake(30, 15)];
    [countLabel_ setTextAlignment:NSTextAlignmentCenter];
    [countLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:countLabel_];
    
  }
  
  return self;
}

- (void)clearCellContent
{
	[self.titleLabel setText:nil];
  [self.countLabel setText:nil];
}

- (void)setCellTitle:(NSString *)title
         CountString:(NSString *)count
     isTitleInCenter:(BOOL)isCenter
{
	
  [self clearCellContent];
  
  if (title) {
    [self.titleLabel setText:title];
    [self.titleLabel sizeToFit];
  }
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  if (selected) {
    
  }
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
	
}

@end
