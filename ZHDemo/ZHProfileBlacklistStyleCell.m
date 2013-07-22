//
//  ZHProfileBlacklistStyleCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileBlacklistStyleCell.h"

@interface ZHProfileBlacklistStyleCell ()

@property (nonatomic, strong) UILabel *cellTitleLabel;

@end

@implementation ZHProfileBlacklistStyleCell

@synthesize cellTitleLabel = cellTitleLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.cellTitleLabel = [[UILabel alloc] init];
    [cellTitleLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [cellTitleLabel_ setY:15];
    [cellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:cellTitleLabel_];
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
	[[self cellTitleLabel] setText:nil];
}

- (void)bindWithObject:(id)object
{
  NSString *cellTitle = (NSString *)object;
  [self.cellTitleLabel setText:nil];
  
  [self.cellTitleLabel setText:cellTitle];
}

- (void)bindCellTitle:(NSString *)cellTitle
{

  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [self.cellTitleLabel sizeToFit];
  [self.cellTitleLabel setCenterX:self.centerX];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
