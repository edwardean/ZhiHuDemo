//
//  ZHUserDetailView.m
//  ZHDemo
//
//  Created by Edward on 13-7-25.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserDetailView.h"
#import <QuartzCore/QuartzCore.h>

@interface ZHUserDetailView ()

@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *sexImage;

@end

@implementation ZHUserDetailView
@synthesize avatarButton = avatarButton_;
@synthesize userNameLabel = userNameLabel_;
@synthesize sexImage = sexImage_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  if (self) {
    if (!avatarButton_) {
      self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [avatarButton_ setFrame:CGRectMake(0, 0, 75, 75)];
      [[avatarButton_ layer] setCornerRadius:3.0f];
      [avatarButton_ setClipsToBounds:YES];
      [[avatarButton_ layer] setBorderWidth:1.0f];
      [[avatarButton_ layer] setBorderColor:[UIColor colorWithWhite:0.719
                                                              alpha:1.000].CGColor];
      [avatarButton_ setContentMode:UIViewContentModeScaleAspectFill];
      [avatarButton_ setY:10];
      [self addSubview:avatarButton_];
    }
    
    if (!userNameLabel_) {
      
      self.userNameLabel = [[UILabel alloc] init];
      [userNameLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
      [userNameLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:userNameLabel_];
    }
    
    
    if (!sexImage_) {
      self.sexImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 14)];
      [self addSubview:sexImage_];
    }
    
    
    [self clearCellContent];

  }
  return self;
}

- (void)clearCellContent
{
	[self.avatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMaskXL.png"]
                               forState:UIControlStateNormal];
  [self.userNameLabel setText:@"Edward"];
  [self.sexImage setImage:[UIImage imageNamed:@"ZHProfileViewGenderMale.png"]];
  
  [self.userNameLabel sizeToFit];
  
  [self setNeedsLayout];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [self.avatarButton setBackgroundImage:nil forState:UIControlStateNormal];
  [self.avatarButton setImage:[UIImage imageNamed:@"AvatarMale150.png"]
                     forState:UIControlStateNormal];
  [self.avatarButton setCenterX:self.centerX];
  
  [self.userNameLabel setCenterX:self.centerX];
  
  [self.userNameLabel setY:[self.avatarButton bottom] + 13];
  
  [self.sexImage setX:[self.userNameLabel right] + 10];
  [self.sexImage setY:[self.userNameLabel y]];
  
}


- (CGSize)sizeThatFits:(CGSize)size
{
	CGSize defaultSize = CGSizeMake(320, 0);
  defaultSize.height = 10 + 75 + 13 + 15 + 20;
  return defaultSize;
}

@end
