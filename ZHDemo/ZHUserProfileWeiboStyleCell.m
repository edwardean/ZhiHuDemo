//
//  ZHUserInfoWeiboCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserProfileWeiboStyleCell.h"

@interface ZHUserProfileWeiboStyleCell ()

@property (nonatomic, strong) UIImage *sinaIcon;
@property (nonatomic, strong) UIImage *qqIcon;

@property (nonatomic, strong) UIImageView *weiboIconImageView;
@property (nonatomic, strong) UILabel *weiboNameLabel;

@end

@implementation ZHUserProfileWeiboStyleCell

@synthesize sinaIcon = sinaIcon_;
@synthesize qqIcon = qqIcon_;
@synthesize weiboIconImageView = weiboIconImageView_;
@synthesize weiboNameLabel = weiboNameLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.accessoryView = [[UIImageView alloc]
                          initWithImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]];
    
    self.weiboIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 21, 18)];
    
    [weiboIconImageView_ setX:20];
    [weiboIconImageView_ setY:10];
    [self.contentView addSubview:weiboIconImageView_];
    
    self.weiboNameLabel = [[UILabel alloc] init];
    [weiboNameLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [weiboNameLabel_ setBackgroundColor:[UIColor clearColor]];
    [weiboNameLabel_ setSize:CGSizeMake(40, 15)];
    [weiboNameLabel_ setY:10];
    [self.contentView addSubview:weiboNameLabel_];
    
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
	[self.weiboIconImageView setImage:nil];
  [self.weiboNameLabel setText:nil];
}

- (void)bindWeiboCellWithType:(WeiboType)type weiboName:(NSString *)weiboName
{
	[self clearCellContent];
  
  UIImage *sina = [UIImage imageNamed:@"ZHProfileViewSinaWeiboIcon.png"];
  UIImage *qq = [UIImage imageNamed:@"ZHProfileViewTencentWeiboIcon.png"];
  
  switch (type) {
    case SinaWeibo:
      [self.weiboIconImageView setImage:sina];
      break;
    case QQWeibo:
      [self.weiboIconImageView setImage:qq];
      break;
      
    default:
      break;
  }
  
  [self.weiboNameLabel setText:weiboName];
}

- (void)bindWeiboObject:(NSDictionary *)weiboDic
{
	[self clearCellContent];
  
  UIImage *sina = [UIImage imageNamed:@"ZHProfileViewSinaWeiboIcon.png"];
  UIImage *qq = [UIImage imageNamed:@"ZHProfileViewTencentWeiboIcon.png"];
  
  if ([weiboDic objectForKey:@"sina"]) {
    [self.weiboIconImageView setImage:sina];
    [self.weiboNameLabel setText:[weiboDic objectForKey:@"sina"]];
  }
  if ([weiboDic objectForKey:@"qq"]) {
    [self.weiboIconImageView setImage:qq];
    [self.weiboNameLabel setText:[weiboDic objectForKey:@"qq"]];

  }

}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [self.weiboNameLabel sizeToFit];
  
  [self.weiboNameLabel setCenterX:self.centerX];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
