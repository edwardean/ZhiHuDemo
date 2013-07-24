//
//  ZHFeedQuestionFollowCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsQuestionFollowCell.h"
#import <QuartzCore/QuartzCore.h>
#import "ZHFeedsObject.h"
#import "UIView+Frame.h"

@interface ZHFeedQuestionFollowCell ()

@property (nonatomic, strong) UILabel *followerLabel;
@property (nonatomic, strong) UILabel *followDesLabel;
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZHFeedQuestionFollowCell

@synthesize followerLabel = followerLabel_;
@synthesize followDesLabel = followDesLabel_;
@synthesize avatarButton = avatarButton_;
@synthesize titleLabel = titleLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.followerLabel = [[UILabel alloc] init];
    [followerLabel_ setBackgroundColor:[UIColor clearColor]];
    [followerLabel_ setTextColor:[UIColor colorWithRed:0.608 green:0.841 blue:1.000 alpha:1.000]];
    [followerLabel_ setNumberOfLines:1];
    [followerLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [followerLabel_ setFont:[UIFont systemFontOfSize:11.0f]];
    [self.contentView addSubview:followerLabel_];
    
    self.followDesLabel = [[UILabel alloc] init];
    [followDesLabel_ setBackgroundColor:[UIColor clearColor]];
    [followDesLabel_ setTextColor:[UIColor colorWithRed:0.736 green:0.739 blue:0.739 alpha:1.000]];
    [followDesLabel_ setFont:[UIFont systemFontOfSize:11.0f]];
    [self.contentView addSubview:followDesLabel_];
    
    self.titleLabel = [[UILabel alloc] init];
    [titleLabel_ setBackgroundColor:[UIColor clearColor]];
    [titleLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [titleLabel_ setNumberOfLines:0];
    [titleLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.contentView addSubview:titleLabel_];
    
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [avatarButton_ setOrigin:CGPointMake([self width] - CELLCONTENTMARGINTORIGHT - 25, CELLCONTENTMARGINTOTOP)];
    [avatarButton_ setSize:CGSizeMake(25, 25)];
    [[avatarButton_ layer] setCornerRadius:3.0f];
    [avatarButton_ setClipsToBounds:YES];
    [self.contentView addSubview:avatarButton_];
  }
  
  return self;
}

- (void)clearCellContent
{
	[self.avatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMale50.png"]
                               forState:UIControlStateNormal];
  [self.followerLabel setText:nil];
  [self.followDesLabel setText:nil];
  [self.titleLabel setText:nil];
}

+ (CGFloat)RowHeightWitObject:(id)object
{
  ZHFeedsObject *feedObject = (ZHFeedsObject *)object;
  NSString *title = feedObject.title;
  CGSize titleDefaultSize = CGSizeMake(CELLTITLELABELWIDTH, CELLTITLELABELHEIGHT);
  CGSize size = [title sizeWithFont:[UIFont boldSystemFontOfSize:TITLELABELFONTSIZE] constrainedToSize:titleDefaultSize lineBreakMode:NSLineBreakByTruncatingTail];
  CGFloat cellHeight = CELLCONTENTMARGINTOTOP + 10 + MARGINBEWTEENTWOCONTENT + size.height + CELLCONTENTMARGINTOBOTTOM;
  return cellHeight;
}

- (void)bindWithObject:(id)object
{
	
}

@end
