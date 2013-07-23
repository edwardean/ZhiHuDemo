//
//  ZHProfileNormalStyleCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileNormalStyleCell.h"

@interface ZHProfileNormalStyleCell ()

@property (nonatomic, strong) UILabel *profileCellTitleLabel;

@end

@implementation ZHProfileNormalStyleCell

@synthesize profileCellTitleLabel = profileCellTitleLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  if (self) {
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage
                                                 imageNamed:@"ZHListViewArrowRight.png"]
                                           highlightedImage:[UIImage imageNamed:@"ZHListViewArrowRightHighlight.png"]];
        
    self.profileCellTitleLabel = [[UILabel alloc] init];
    [profileCellTitleLabel_ setX:20];
    [profileCellTitleLabel_ setY:10];
    [profileCellTitleLabel_ setSize:CGSizeMake(70, 20)];
    [profileCellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [profileCellTitleLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [self.contentView addSubview:profileCellTitleLabel_];
  }
  return self;
}

-(void)layoutSubviews
{
  [super layoutSubviews];
  
}

- (void)bindWithObject:(id)object
{
  NSLog(@"Normal:%@",object);
  NSString *cellTitle = (NSString *)object;
  [self.profileCellTitleLabel setText:nil];
  
	[self.profileCellTitleLabel setText:cellTitle];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
}

@end
