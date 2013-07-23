//
//  ZHProfileCollectionStyleCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileCollectionStyleCell.h"

@interface ZHProfileCollectionStyleCell ()

@property (nonatomic, strong) UILabel *profileCellTitleLabel;
@property (nonatomic, strong) UILabel *profileCellCountLabel;

@end

@implementation ZHProfileCollectionStyleCell

@synthesize profileCellTitleLabel = profileCellTitleLabel_;
@synthesize profileCellCountLabel = profileCellCountLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage
                                                 imageNamed:@"ZHListViewArrowRight.png"]
                                           highlightedImage:[UIImage imageNamed:@"ZHListViewArrowRightHighlight.png"]];
    
    self.profileCellTitleLabel = [[UILabel alloc] init];
    [profileCellTitleLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [profileCellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [profileCellTitleLabel_ setX:20];
    [profileCellTitleLabel_ setY:10];
    [self.contentView addSubview:profileCellTitleLabel_];
    
    self.profileCellCountLabel = [[UILabel alloc] init];
    [profileCellCountLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [profileCellCountLabel_ setTextColor:[UIColor grayColor]];
    [profileCellCountLabel_ setBackgroundColor:[UIColor clearColor]];
    [profileCellCountLabel_ setTextAlignment:NSTextAlignmentCenter];
    [profileCellCountLabel_ setX:[self width]- 74];
    [profileCellCountLabel_ setY:10];
    [profileCellCountLabel_ setSize:CGSizeMake(30, 20)];
    [self.contentView addSubview:profileCellCountLabel_];
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
	[self.profileCellCountLabel setText:@"0"];
  [self.profileCellTitleLabel setText:nil];
}

- (void)bindCellTitle:(NSString *)title detail:(NSString *)detail
{
  [self clearCellContent];
  
  [self.profileCellTitleLabel setText:title];
  [self.profileCellCountLabel setText:detail];
	
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  
  [self.profileCellTitleLabel sizeToFit];
  [self.profileCellCountLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
}

@end
