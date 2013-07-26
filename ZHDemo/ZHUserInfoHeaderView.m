//
//  ZHUserInfoHeaderView.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/SDWebImageManager.h>
#import "ZHUserInfoHeaderView.h"
#import "ZHUserInfoBottomView.h"
#import "ZHUserInfoObject.h"
#import "UIImage+RounedImage.h"

#define HeaderDescriptionFont 										[UIFont systemFontOfSize:14.0f]
#define HeaderDescriptionMaxWidth									300

#define HeaderDescriptionToAvatarMargin						15
#define HeaderDescriptionToBottomMargin						10

@interface ZHUserInfoHeaderView ()

@property (nonatomic) UIImageView *userInfoHeaderAvatarView;
@property (nonatomic) UIButton *userInfoHeaderAvatarButton;

@property (nonatomic) UILabel *userInfoHeaderNameLabel;

@property (nonatomic) UIScrollView *headlineScrollView;
@property (nonatomic) UILabel *userInfoHeaderHeadlineLabel;

@property (nonatomic) UIButton *following_topicButton;
@property (nonatomic) UILabel *userInfoHeaderFollowing_topic_countLabel;
@property (nonatomic) UILabel *userInfoHeaderFollowing_topicLabel;

@property (nonatomic) UIButton *following_countButton;
@property (nonatomic) UILabel *userInfoHeaderFollowing_countLabel;
@property (nonatomic) UILabel *userInfoHeaderFollowingLabel;

@property (nonatomic) UIButton *followerButton;
@property (nonatomic) UILabel *userInfoHeaderFollower_countLabel;
@property (nonatomic) UILabel *userInfoHeaderFollowerLabel;

@property (nonatomic) UILabel *userInfoHeaderDescriptionLabel;
@property (nonatomic) ZHUserInfoBottomView *userInfoBottomView;

@end

@implementation ZHUserInfoHeaderView
@synthesize userInfoHeaderAvatarButton = userInfoHeaderAvatarButton_;

@synthesize userInfoHeaderNameLabel = userInfoHeaderNameLabel_;

@synthesize headlineScrollView = headlineScrollView_;
@synthesize userInfoHeaderHeadlineLabel = userInfoHeaderHeadlineLabel_;

@synthesize following_topicButton = following_topicButton_;
@synthesize userInfoHeaderFollowing_topic_countLabel = userInfoHeaderFollowing_topic_countLabel_;
@synthesize userInfoHeaderFollowing_topicLabel = userInfoHeaderFollowing_topicLabel_;

@synthesize following_countButton = following_countButton_;
@synthesize userInfoHeaderFollowing_countLabel = userInfoHeaderFollowing_countLabel_;
@synthesize userInfoHeaderFollowingLabel = userInfoHeaderFollowingLabel_;

@synthesize followerButton = followerButton_;
@synthesize userInfoHeaderFollower_countLabel = userInfoHeaderFollower_countLabel_;
@synthesize userInfoHeaderFollowerLabel = userInfoHeaderFollowerLabel_;

@synthesize userInfoHeaderDescriptionLabel = userInfoHeaderDescriptionLabel_;
@synthesize userInfoBottomView = userInfoBottomView_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    
    if (!userInfoHeaderAvatarButton_) {
      self.userInfoHeaderAvatarButton = [[UIButton alloc] initWithFrame:CGRectMake(8,
                                                                                   15,
                                                                                   80,
                                                                                   81)];
      [[userInfoHeaderAvatarButton_ layer] setCornerRadius:5.0f];
      [userInfoHeaderAvatarButton_ setClipsToBounds:YES];
      [self addSubview:userInfoHeaderAvatarButton_];
    }
    
    if (!userInfoHeaderNameLabel_) {
      self.userInfoHeaderNameLabel = [[UILabel alloc] init];
      [userInfoHeaderNameLabel_ setOrigin:CGPointMake(95, 15)];
      [userInfoHeaderNameLabel_ setNumberOfLines:1];
      [userInfoHeaderNameLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [userInfoHeaderNameLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:userInfoHeaderNameLabel_];
    }
    
    if (!headlineScrollView_) {
      self.headlineScrollView = [[UIScrollView alloc] init];
      [headlineScrollView_ setY:16];
      [headlineScrollView_ setShowsHorizontalScrollIndicator:NO];
      headlineScrollView_.clipsToBounds = YES;
      [self addSubview:headlineScrollView_];
    }
    
    if (!userInfoHeaderHeadlineLabel_) {
      self.userInfoHeaderHeadlineLabel = [[UILabel alloc] init];
      [userInfoHeaderHeadlineLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
      [userInfoHeaderHeadlineLabel_ setTextColor:[UIColor grayColor]];
      [userInfoHeaderHeadlineLabel_ setBackgroundColor:[UIColor clearColor]];
      if (headlineScrollView_) {
        [headlineScrollView_ addSubview:userInfoHeaderHeadlineLabel_];
      }
    }
    
    if (!following_topicButton_) {
      self.following_topicButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [following_topicButton_ setFrame:CGRectMake(90, 52, 65, 40)];
      
      // Add following_topicButton_ touch event here ...
      [self addSubview:following_topicButton_];
    }
    
    if (!userInfoHeaderFollowing_topic_countLabel_) {
      self.userInfoHeaderFollowing_topic_countLabel = [[UILabel alloc] init];
      [userInfoHeaderFollowing_topic_countLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [userInfoHeaderFollowing_topic_countLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollowing_topic_countLabel_ setOrigin:CGPointMake(5, 5)];
      if (following_topicButton_) {
        [following_topicButton_ addSubview:userInfoHeaderFollowing_topic_countLabel_];
      }
    }
    
    if (!userInfoHeaderFollowing_topicLabel_) {
      self.userInfoHeaderFollowing_topicLabel = [[UILabel alloc] init];
      [userInfoHeaderFollowing_topicLabel_ setFont:[UIFont systemFontOfSize:10.0f]];
      [userInfoHeaderFollowing_topicLabel_ setTextColor:[UIColor grayColor]];
      [userInfoHeaderFollowing_topicLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollowing_topicLabel_ setOrigin:CGPointMake(5, 22)];
      if (following_topicButton_) {
        [following_topicButton_ addSubview:userInfoHeaderFollowing_topicLabel_];
      }
    }
    
    if (!following_countButton_) {
      self.following_countButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [following_countButton_ setFrame:CGRectMake(165, 52, 65, 40)];
      
      // Add following_countButton_ touch event here ...
      [self addSubview:following_countButton_];
    }
    
    if (!userInfoHeaderFollowing_countLabel_) {
      self.userInfoHeaderFollowing_countLabel = [[UILabel alloc] init];
      [userInfoHeaderFollowing_countLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [userInfoHeaderFollowing_countLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollowing_countLabel_ setOrigin:CGPointMake(5, 5)];
      if (following_countButton_) {
        [following_countButton_ addSubview:userInfoHeaderFollowing_countLabel_];
      }
    }
    
    if (!userInfoHeaderFollowingLabel_) {
      self.userInfoHeaderFollowingLabel = [[UILabel alloc] init];
      [userInfoHeaderFollowingLabel_ setFont:[UIFont systemFontOfSize:10.0f]];
      [userInfoHeaderFollowingLabel_ setTextColor:[UIColor grayColor]];
      [userInfoHeaderFollowingLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollowingLabel_ setOrigin:CGPointMake(5, 22)];
      if (following_countButton_) {
        [following_countButton_ addSubview:userInfoHeaderFollowingLabel_];
      }
    }
    
    
    if (!followerButton_) {
      self.followerButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [followerButton_ setFrame:CGRectMake(243, 52, 65, 40)];
      [[followerButton_ layer] setCornerRadius:3.0f];
      [followerButton_ setClipsToBounds:YES];
      //[[followerButton_ layer] setBackgroundColor:[[UIColor colorWithWhite:0.817 alpha:1.000] CGColor]];
     	//[followerButton_ addTarget:self action:@selector(followerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
      // Add followerButton_ touch event here ...
      [self addSubview:followerButton_];
    }
    
    if (!userInfoHeaderFollower_countLabel_) {
      self.userInfoHeaderFollower_countLabel = [[UILabel alloc] init];
      [userInfoHeaderFollower_countLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
      [userInfoHeaderFollower_countLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollower_countLabel_ setOrigin:CGPointMake(5, 5)];
      if (followerButton_) {
        [followerButton_ addSubview:userInfoHeaderFollower_countLabel_];
      }
    }
    
    if (!userInfoHeaderFollowerLabel_) {
      self.userInfoHeaderFollowerLabel = [[UILabel alloc] init];
      [userInfoHeaderFollowerLabel_ setFont:[UIFont systemFontOfSize:10.0f]];
      [userInfoHeaderFollowerLabel_ setTextColor:[UIColor grayColor]];
      [userInfoHeaderFollowerLabel_ setBackgroundColor:[UIColor clearColor]];
      [userInfoHeaderFollowerLabel_ setOrigin:CGPointMake(5, 22)];
      if (followerButton_) {
        [followerButton_ addSubview:userInfoHeaderFollowerLabel_];
      }
    }
    
    if (!userInfoHeaderDescriptionLabel_) {
      self.userInfoHeaderDescriptionLabel = [[UILabel alloc] init];
      [userInfoHeaderDescriptionLabel_ setFont:HeaderDescriptionFont];
      [userInfoHeaderDescriptionLabel_ setNumberOfLines:0];
      [userInfoHeaderDescriptionLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
      [userInfoHeaderDescriptionLabel_ setTextColor:[UIColor lightGrayColor]];
      [userInfoHeaderDescriptionLabel_ setBackgroundColor:[UIColor clearColor]];
      [self addSubview:userInfoHeaderDescriptionLabel_];
    }
    
    if (!userInfoBottomView_) {
      self.userInfoBottomView = [[ZHUserInfoBottomView alloc] initWithFrame:CGRectMake(0, 0, 320, 51)];
      [userInfoBottomView_ setBackgroundColor:[UIColor
                                               colorWithPatternImage:[UIImage
                                                                      imageNamed:@"ZHProfileViewToolbar.png"]]];
      [self addSubview:userInfoBottomView_];
    }
    
    [self clearHeaderContent];
  }
  return self;
}

- (void)clearHeaderContent
{
  [self.userInfoHeaderAvatarButton setBackgroundImage:[UIImage imageNamed:@"AvatarMaskXL.png"]
                                             forState:UIControlStateNormal];
  [self.userInfoHeaderNameLabel setText:nil];
  [self.userInfoHeaderHeadlineLabel setText:nil];
  [self.userInfoHeaderFollowing_topic_countLabel setText:@"0"];
  [self.userInfoHeaderFollowing_topicLabel setText:@"他的话题"];
  [self.userInfoHeaderFollowing_countLabel setText:@"0"];
  [self.userInfoHeaderFollowingLabel setText:@"他关注的人"];
  [self.userInfoHeaderFollower_countLabel setText:@"0"];
  [self.userInfoHeaderFollowerLabel  setText:@"关注他的人"];
  [self.userInfoHeaderDescriptionLabel setText:nil];
}

- (void)bindHeaderContentWithObject:(id<ZHObject>)object
{
  [self clearHeaderContent];
  
  [self.userInfoHeaderAvatarButton setBackgroundImage:nil forState:UIControlStateNormal];
  [[self.userInfoHeaderAvatarButton layer] setBorderWidth:1.0f];
  [[self.userInfoHeaderAvatarButton layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
  
	ZHUserInfoObject *infoObject = (ZHUserInfoObject *)object;
  
  if (infoObject.name) {
    [self.userInfoHeaderNameLabel setText:[NSString stringWithFormat:@"%@, ",infoObject.name]];
  }
  if (infoObject.headline) {
    [self.userInfoHeaderHeadlineLabel setText:infoObject.headline];
  }
  
  if ([infoObject.gender integerValue] == -1) {
    [self.userInfoHeaderFollowing_topicLabel setText:@"她的话题"];
    [self.userInfoHeaderFollowingLabel setText:@"她关注的人"];
    [self.userInfoHeaderFollowerLabel  setText:@"关注她的人"];
  } else {
  	[self.userInfoHeaderFollowing_topicLabel setText:@"他的话题"];
    [self.userInfoHeaderFollowingLabel setText:@"他关注的人"];
    [self.userInfoHeaderFollowerLabel  setText:@"关注他的人"];
  }
  
  if (infoObject.avatar_url) {
    __block typeof(self) weakself = self;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadWithURL:[NSURL URLWithString:infoObject.avatar_url]
                    delegate:self
                     options:0
                     success:^(UIImage *image) {
                       [weakself.userInfoHeaderAvatarButton
                        setImage:image
                        forState:UIControlStateNormal];
                     }
                     failure:^(NSError *error) {
                       [weakself.userInfoHeaderAvatarButton
                        setImage:[UIImage imageNamed:@"AvatarMale150.png"]
                        forState:UIControlStateNormal];
                     }];
    
  }
  
  if (infoObject.following_topic_count) {
    [self.userInfoHeaderFollowing_topic_countLabel setText:infoObject.following_topic_count];
  }
  
  if (infoObject.following_count) {
    [self.userInfoHeaderFollowing_countLabel setText:infoObject.following_count];
  }
  
  if (infoObject.follower_count) {
    [self.userInfoHeaderFollower_countLabel setText:infoObject.follower_count];
  }
  
  if (infoObject.des) {
    [self.userInfoHeaderDescriptionLabel setText:infoObject.des];
  }
  
  NSString *voteup_count = @"0";
  NSString *thanked_count = @"0";
  
  if (infoObject.voteup_count) {
    voteup_count = infoObject.voteup_count;
  }
  
  if (infoObject.thanked_count) {
    thanked_count = infoObject.thanked_count;
  }
  
  [self.userInfoBottomView addUserVoteupCount:voteup_count
                                   ThankCount:thanked_count];
  
  [self.userInfoHeaderNameLabel sizeToFit];
  [self.userInfoHeaderHeadlineLabel sizeToFit];
  [self.userInfoHeaderFollowing_topic_countLabel sizeToFit];
  [self.userInfoHeaderFollowing_topicLabel sizeToFit];
  [self.userInfoHeaderFollowing_countLabel sizeToFit];
  [self.userInfoHeaderFollowingLabel sizeToFit];
  [self.userInfoHeaderFollower_countLabel sizeToFit];
  [self.userInfoHeaderFollowerLabel sizeToFit];
  
  [self sizeToFit];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  // Layout userInfoHeaderHeadlineLabel
  CGFloat headlineScrollViewOriginX = [self.userInfoHeaderNameLabel right];
  CGSize headlineLabelSize = [self.userInfoHeaderHeadlineLabel size];
  [self.headlineScrollView setX:headlineScrollViewOriginX];
  [self.headlineScrollView setSize:CGSizeMake([self width] - headlineScrollViewOriginX - 10,
                                              headlineLabelSize.height)];
  [self.headlineScrollView setContentSize:headlineLabelSize];
  
  // Layout userInfoHeaderDescriptionLabel_
  CGSize size = [self.userInfoHeaderDescriptionLabel.text
                 CalculateTextSizeWith:[UIFont systemFontOfSize:14.0f]
                 Size:CGSizeMake(HeaderDescriptionMaxWidth, MAXFLOAT)
                 LineBreakMode:self.userInfoHeaderDescriptionLabel.lineBreakMode];
  
  CGFloat descriptionLabelOriginY = [self.userInfoHeaderAvatarButton bottom] + HeaderDescriptionToAvatarMargin;
  [self.userInfoHeaderDescriptionLabel setFrame:CGRectMake(10,
                                                           descriptionLabelOriginY,
                                                           size.width,
                                                           size.height)];
  [self.userInfoBottomView setY:[self.userInfoHeaderDescriptionLabel bottom] + 12];
}

- (CGSize)sizeThatFits:(CGSize)size
{
  
  CGRect frame = self.frame;
  
  CGFloat descriptionLabelOriginY = [self.userInfoHeaderAvatarButton bottom] + HeaderDescriptionToAvatarMargin;
  
  CGFloat bottomViewHeight = [self.userInfoBottomView height];
  
	CGSize descriptionSize = [self.userInfoHeaderDescriptionLabel.text
                            CalculateTextSizeWith:[UIFont systemFontOfSize:14.0f]
                            Size:CGSizeMake(HeaderDescriptionMaxWidth, MAXFLOAT)
                            LineBreakMode:self.userInfoHeaderDescriptionLabel.lineBreakMode];
  
  CGFloat height = descriptionLabelOriginY + descriptionSize.height + HeaderDescriptionToBottomMargin + bottomViewHeight;
  frame.size.height = height;
	return frame.size;
}

@end
